(* ::Package:: *)
(* ::Title:: *)
(*字符转换(Translate)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-08-30*)
(*Copyright: Mozilla Public License Version 2.0*)
(* ::Program:: *)
(*1.软件产品再发布时包含一份原始许可声明和版权声明。*)
(*2.提供快速的专利授权。*)
(*3.不得使用其原始商标。*)
(*4.如果修改了源代码，包含一份代码修改说明。*)
(**)
(* ::Text:: *)
(*这里应该填这个函数的介绍*)
(* ::Section:: *)
(*函数说明*)
PinyinDecompose::usage = "";
ToPinyin::usage = "";
ToSimplifiedChinese::usage = "";
ToTraditionalChinese::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Begin["`Translate`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$Translate = "V1.1";
Updated$Translate = "2018-09-07";
(* ::Subsubsection:: *)
(*Pinyin*)
toPinyin := toPinyin = JavaNew["com.hankcs.hanlp.dictionary.py.PinyinDictionary"];
PinyinDecompose[str_String] := Block[
	{
		objs, decom, convertToPinyinArray, toString,
		getShengmu, getYunmu, getTone, getPinyinWithToneMark
	},
	objs = toPinyin@convertToPinyinArray[str];
	decom = {
		Characters@str,
		Through[objs@getShengmu[][toString[]]],
		Through[objs@getYunmu[][toString[]]],
		Through[objs@getTone[]],
		Through[objs@getPinyinWithToneMark[]]
	} // Transpose;
	<|"Char" -> #1, "Sheng" -> #2, "Yun" -> #3, "Ying" -> #4, "Mark" -> #5|>& @@@ decom
];
ToPinyin[str_String, mode_Integer : 1] := Block[
	{d = PinyinDecompose[str], f},
	f = If[#["Mark"] == "none", # /. {5 -> #["Char"], "none" -> #["Char"]}, #]& /@ d;
	Switch[mode,
		1, #Mark& /@ f,
		2, StringRiffle[DeleteDuplicates@{#Sheng, #Yun, #Ying}, ""]& /@ f,
		3, StringRiffle[DeleteDuplicates@{#Sheng, #Yun}, ""]& /@ f,
		4, #Sheng& /@ f,
		5, #Yun& /@ f,
		6, #Ying& /@ f,
		_, f // Dataset
	]
];
(* ::Subsubsection:: *)
(*ToSimplified*)
t2s := t2s = JavaNew["com.hankcs.hanlp.dictionary.ts.TraditionalChineseDictionary"];
tw2s := tw2s = JavaNew["com.hankcs.hanlp.dictionary.ts.TaiwanToSimplifiedChineseDictionary"];
hk2s := hk2s = JavaNew["com.hankcs.hanlp.dictionary.ts.HongKongToSimplifiedChineseDictionary"];
Options[ToSimplifiedChinese] = {Method -> "TW"};
ToSimplifiedChinese[str_String, OptionsPattern[]] := Block[
	{convertToSimplifiedChinese},
	Switch[OptionValue[Method],
		"TW", tw2s@convertToSimplifiedChinese[str],
		"HK", hk2s@convertToSimplifiedChinese[str],
		_, t2s@convertToSimplifiedChinese[str]
	]
];
s2t := s2t = JavaNew["com.hankcs.hanlp.dictionary.ts.SimplifiedChineseDictionary"];
s2tw := s2tw = JavaNew["com.hankcs.hanlp.dictionary.ts.SimplifiedToTaiwanChineseDictionary"];
s2hk := s2hk = JavaNew["com.hankcs.hanlp.dictionary.ts.SimplifiedToHongKongChineseDictionary"];
(* ::Subsubsection:: *)
(*ToTraditional*)
Options[ToTraditionalChinese] = {Method -> "TW"};
ToTraditionalChinese[str_String, OptionsPattern[]] := Block[
	{
		convertToTraditionalChinese,
		convertToTraditionalTaiwanChinese,
		convertToTraditionalHongKongChinese
	},
	Switch[OptionValue[Method],
		"TW", s2tw@convertToTraditionalTaiwanChinese[str],
		"HK", s2hk@convertToTraditionalHongKongChinese[str],
		_, s2t@convertToTraditionalChinese[str]
	]
];
(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{PinyinDecompose, ToPinyin},
	{Protected, ReadProtected}
];
End[]
