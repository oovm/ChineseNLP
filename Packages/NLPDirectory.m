(* ::Package:: *)
(* ::Title:: *)
(*Directories(Directories)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-08-21*)
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
$NLPDirectory::usage = "ChineseNLP 的安装路径.";
$NLPData::usage = "ChineseNLP 的数据存放位置.";
$NLPResourcesList::usage = "ChineseNLP 的远程资源映射表";
$NLPModelLoader::usage = "ChineseNLP 的资源加载器.";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Begin["`Directories`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$Directories = "V1.0";
Updated$Directories = "2018-08-21";
(* ::Subsubsection:: *)
(*功能块 1*)
$NLPDirectory = DirectoryName[FindFile["ChineseNLP`Kernel`"], 2];
$NLPData = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "ChineseNLP"}];
$NLPResourcesList = <|
	"Waifu-VDSR" -> <|
		"Remote" -> "https://m.vers.site/NetModel/Waifu-VDSR.WMLF",
		"Local" -> FileNameJoin[{$NLPData, "Models", "Waifu-VDSR.WMLF"}]
	|>,
	"Waifu-LapSRN" -> <|
		"Remote" -> "https://m.vers.site/NetModel/Waifu-LapSRN2.WMLF",
		"Local" -> FileNameJoin[{$NLPData, "Models", "Waifu-LapSRN2.WMLF"}]
	|>
|>;


(* ::Subsection::Closed:: *)
(*附加设置*)
If[!FileExistsQ@#, CreateDirectory@#]& /@ {
	$NLPData,
	FileNameJoin[{$NLPData, "Models"}]
};
SetAttributes[{downloadProgress, downloadFinished, downloadStart, downloadVisualize}, HoldFirst];
SetAttributes[
	{$NLPResourcesList, $NLPModelLoader},
	{ReadProtected}
];
End[]
