(* ::Package:: *)
(* ::Title:: *)
(*GrammaticalUnit(GrammaticalUnit)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-09-07*)
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
GrammaticalUnitHLP::usage = "";
GrammaticalUnitCheck::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
ExNumber::usage = "程序包的说明,这里抄一遍";
Begin["`GrammaticalUnit`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Version$GrammaticalUnit = "V1.0";
Updated$GrammaticalUnit = "2018-09-07";
(* ::Subsubsection:: *)
(*GrammaticalUnitHLP*)
(* ::Text:: *)
(*
  ipt=Import["C:\\Users\\Aster\\OneDrive - mail.ac.id\\Desktop\\HLP 词性标注.csv",{"CSV","Dataset"},HeaderLines->1];
  #Short-><|"Tag"->#Short,"Class"->#Class,"Label"->Text[#Name],"Description"->#Detail|>&/@Normal[ipt];
  StringReplace[ToString[%,InputForm],{"""->"\\\"","""->"\\\""}]
*)
EntityStore["HLP" -> <|
	"Entities" -> <|
		"a" -> <|"Tag" -> "a", "Class" -> "形容词", "Label" -> Text["形容词"], "Description" -> "取英语形容词adjective的第1个字母"|>,
		"ad" -> <|"Tag" -> "ad", "Class" -> "形容词", "Label" -> Text["副形词"], "Description" -> "直接作状语的形容词。形容词代码a和副词代码d并在一起"|>,
		"ag" -> <|"Tag" -> "ag", "Class" -> "形容词", "Label" -> Text["形容词性语素"], "Description" -> "形容词性语素。形容词代码为a，语素代码ｇ前面置以A"|>,
		"al" -> <|"Tag" -> "al", "Class" -> "形容词", "Label" -> Text["形容词性惯用语"], "Description" -> ""|>,
		"an" -> <|"Tag" -> "an", "Class" -> "形容词", "Label" -> Text["名形词"], "Description" -> "具有名词功能的形容词。形容词代码a和名词代码n并在一起"|>,
		"b" -> <|"Tag" -> "b", "Class" -> "区别词", "Label" -> Text["区别词"], "Description" -> "取汉字\"别\"的声母。"|>,
		"begin" -> <|"Tag" -> "begin", "Class" -> "区别词", "Label" -> Text["仅用于始##始"], "Description" -> ""|>,
		"bg" -> <|"Tag" -> "bg", "Class" -> "区别词", "Label" -> Text["区别语素"], "Description" -> "区别词性语素。区别词代码为b，语素代码ｇ前面置以B"|>,
		"bl" -> <|"Tag" -> "bl", "Class" -> "区别词", "Label" -> Text["区别词性惯用语"], "Description" -> ""|>,
		"c" -> <|"Tag" -> "c", "Class" -> "连词", "Label" -> Text["连词"], "Description" -> "取英语连词conjunction的第1个字母"|>,
		"cc" -> <|"Tag" -> "cc", "Class" -> "连词", "Label" -> Text["并列连词"], "Description" -> ""|>,
		"d" -> <|"Tag" -> "d", "Class" -> "副词", "Label" -> Text["副词"], "Description" -> "取adverb的第2个字母，因其第1个字母已用于形容词。"|>,
		"dg" -> <|"Tag" -> "dg", "Class" -> "副词", "Label" -> Text["辄、俱、复之类的副词"], "Description" -> "副词性语素。副词代码为d，语素代码ｇ前面置以D"|>,
		"dl" -> <|"Tag" -> "dl", "Class" -> "副词", "Label" -> Text["连语"], "Description" -> ""|>,
		"e" -> <|"Tag" -> "e", "Class" -> "叹词", "Label" -> Text["叹词"], "Description" -> "取英语叹词exclamation的第1个字母"|>,
		"end" -> <|"Tag" -> "end", "Class" -> "叹词", "Label" -> Text["仅用于终##终"], "Description" -> ""|>,
		"f" -> <|"Tag" -> "f", "Class" -> "方位词", "Label" -> Text["方位词"], "Description" -> "取汉字\"方\""|>,
		"g" -> <|"Tag" -> "g", "Class" -> "学术词汇", "Label" -> Text["学术词汇"], "Description" -> ""|>,
		"gb" -> <|"Tag" -> "gb", "Class" -> "学术词汇", "Label" -> Text["生物相关词汇"], "Description" -> ""|>,
		"gbc" -> <|"Tag" -> "gbc", "Class" -> "学术词汇", "Label" -> Text["生物类别"], "Description" -> ""|>,
		"gc" -> <|"Tag" -> "gc", "Class" -> "学术词汇", "Label" -> Text["化学相关词汇"], "Description" -> ""|>,
		"gg" -> <|"Tag" -> "gg", "Class" -> "学术词汇", "Label" -> Text["地理地质相关词汇"], "Description" -> ""|>,
		"gi" -> <|"Tag" -> "gi", "Class" -> "学术词汇", "Label" -> Text["计算机相关词汇"], "Description" -> ""|>,
		"gm" -> <|"Tag" -> "gm", "Class" -> "学术词汇", "Label" -> Text["数学相关词汇"], "Description" -> ""|>,
		"gp" -> <|"Tag" -> "gp", "Class" -> "学术词汇", "Label" -> Text["物理相关词汇"], "Description" -> ""|>,
		"h" -> <|"Tag" -> "h", "Class" -> "前缀", "Label" -> Text["前缀"], "Description" -> "取英语head的第1个字母"|>,
		"i" -> <|"Tag" -> "i", "Class" -> "成语", "Label" -> Text["成语"], "Description" -> "取英语成语idiom的第1个字母"|>,
		"j" -> <|"Tag" -> "j", "Class" -> "简称", "Label" -> Text["简称"], "Description" -> "简称略语 取汉字\"简\"的声母"|>,
		"k" -> <|"Tag" -> "k", "Class" -> "后缀", "Label" -> Text["后缀"], "Description" -> "后接成分"|>,
		"l" -> <|"Tag" -> "l", "Class" -> "习用语", "Label" -> Text["习用语"], "Description" -> "习用语尚未成为成语，有点\"临时性\"，取\"临\"的声母"|>,
		"m" -> <|"Tag" -> "m", "Class" -> "数词", "Label" -> Text["数词"], "Description" -> "取英语numeral的第3个字母，n，u已有他用"|>,
		"mg" -> <|"Tag" -> "mg", "Class" -> "数词", "Label" -> Text["数语素"], "Description" -> "数词性语素。数词代码为m，语素代码ｇ前面置以M"|>,
		"Mg" -> <|"Tag" -> "Mg", "Class" -> "M", "Label" -> Text["数词"], "Description" -> "甲乙丙丁之类的"|>,
		"mq" -> <|"Tag" -> "mq", "Class" -> "数词", "Label" -> Text["数量词"], "Description" -> ""|>,
		"n" -> <|"Tag" -> "n", "Class" -> "名词", "Label" -> Text["名词"], "Description" -> "取英语名词noun的第1个字母"|>,
		"nb" -> <|"Tag" -> "nb", "Class" -> "名词", "Label" -> Text["生物名"], "Description" -> ""|>,
		"nba" -> <|"Tag" -> "nba", "Class" -> "名词", "Label" -> Text["动物名"], "Description" -> ""|>,
		"nbc" -> <|"Tag" -> "nbc", "Class" -> "名词", "Label" -> Text["动物纲目"], "Description" -> ""|>,
		"nbp" -> <|"Tag" -> "nbp", "Class" -> "名词", "Label" -> Text["植物名"], "Description" -> ""|>,
		"nf" -> <|"Tag" -> "nf", "Class" -> "名词", "Label" -> Text["食品"], "Description" -> "比如\"薯片\""|>,
		"ng" -> <|"Tag" -> "ng", "Class" -> "名词", "Label" -> Text["名词性语素"], "Description" -> "名词性语素。名词代码为n，语素代码ｇ前面置以N。"|>,
		"nh" -> <|"Tag" -> "nh", "Class" -> "名词", "Label" -> Text["医药疾病等健康相关名词"], "Description" -> ""|>,
		"nhd" -> <|"Tag" -> "nhd", "Class" -> "名词", "Label" -> Text["疾病"], "Description" -> ""|>,
		"nhm" -> <|"Tag" -> "nhm", "Class" -> "名词", "Label" -> Text["药品"], "Description" -> ""|>,
		"ni" -> <|"Tag" -> "ni", "Class" -> "名词", "Label" -> Text["机构相关"], "Description" -> "（不是独立机构名）"|>,
		"nic" -> <|"Tag" -> "nic", "Class" -> "名词", "Label" -> Text["下属机构"], "Description" -> ""|>,
		"nis" -> <|"Tag" -> "nis", "Class" -> "名词", "Label" -> Text["机构后缀"], "Description" -> ""|>,
		"nit" -> <|"Tag" -> "nit", "Class" -> "名词", "Label" -> Text["教育相关机构"], "Description" -> ""|>,
		"nl" -> <|"Tag" -> "nl", "Class" -> "名词", "Label" -> Text["名词性惯用语"], "Description" -> ""|>,
		"nm" -> <|"Tag" -> "nm", "Class" -> "名词", "Label" -> Text["物品名"], "Description" -> ""|>,
		"nmc" -> <|"Tag" -> "nmc", "Class" -> "名词", "Label" -> Text["化学品名"], "Description" -> ""|>,
		"nn" -> <|"Tag" -> "nn", "Class" -> "名词", "Label" -> Text["工作相关名词"], "Description" -> ""|>,
		"nnd" -> <|"Tag" -> "nnd", "Class" -> "名词", "Label" -> Text["职业"], "Description" -> ""|>,
		"nnt" -> <|"Tag" -> "nnt", "Class" -> "名词", "Label" -> Text["职务职称"], "Description" -> ""|>,
		"nr" -> <|"Tag" -> "nr", "Class" -> "名词", "Label" -> Text["人名"], "Description" -> "名词代码n和\"人(ren)\"的声母并在一起。"|>,
		"nr1" -> <|"Tag" -> "nr1", "Class" -> "名词", "Label" -> Text["复姓"], "Description" -> ""|>,
		"nr2" -> <|"Tag" -> "nr2", "Class" -> "名词", "Label" -> Text["蒙古姓名"], "Description" -> ""|>,
		"nrf" -> <|"Tag" -> "nrf", "Class" -> "名词", "Label" -> Text["音译人名"], "Description" -> ""|>,
		"nrj" -> <|"Tag" -> "nrj", "Class" -> "名词", "Label" -> Text["日语人名"], "Description" -> ""|>,
		"ns" -> <|"Tag" -> "ns", "Class" -> "名词", "Label" -> Text["地名"], "Description" -> "名词代码n和处所词代码s并在一起。"|>,
		"nsf" -> <|"Tag" -> "nsf", "Class" -> "名词", "Label" -> Text["音译地名"], "Description" -> ""|>,
		"nt" -> <|"Tag" -> "nt", "Class" -> "名词", "Label" -> Text["机构团体名"], "Description" -> "\"团\"的声母为t，名词代码n和t并在一起。"|>,
		"ntc" -> <|"Tag" -> "ntc", "Class" -> "名词", "Label" -> Text["公司名"], "Description" -> ""|>,
		"ntcb" -> <|"Tag" -> "ntcb", "Class" -> "名词", "Label" -> Text["银行"], "Description" -> ""|>,
		"ntcf" -> <|"Tag" -> "ntcf", "Class" -> "名词", "Label" -> Text["工厂"], "Description" -> ""|>,
		"ntch" -> <|"Tag" -> "ntch", "Class" -> "名词", "Label" -> Text["酒店宾馆"], "Description" -> ""|>,
		"nth" -> <|"Tag" -> "nth", "Class" -> "名词", "Label" -> Text["医院"], "Description" -> ""|>,
		"nto" -> <|"Tag" -> "nto", "Class" -> "名词", "Label" -> Text["政府机构"], "Description" -> ""|>,
		"nts" -> <|"Tag" -> "nts", "Class" -> "名词", "Label" -> Text["中小学"], "Description" -> ""|>,
		"ntu" -> <|"Tag" -> "ntu", "Class" -> "名词", "Label" -> Text["大学"], "Description" -> ""|>,
		"nx" -> <|"Tag" -> "nx", "Class" -> "名词", "Label" -> Text["字母专名"], "Description" -> ""|>,
		"nz" -> <|"Tag" -> "nz", "Class" -> "名词", "Label" -> Text["其他专名"], "Description" -> "专\"的声母的第1个字母为z，名词代码n和z并在一起。"|>,
		"o" -> <|"Tag" -> "o", "Class" -> "拟声词", "Label" -> Text["拟声词"], "Description" -> "取英语拟声词onomatopoeia的第1个字母。"|>,
		"p" -> <|"Tag" -> "p", "Class" -> "介词", "Label" -> Text["介词"], "Description" -> "取英语介词prepositional的第1个字母"|>,
		"pba" -> <|"Tag" -> "pba", "Class" -> "介词", "Label" -> Text["介词\"把\""], "Description" -> ""|>,
		"pbei" -> <|"Tag" -> "pbei", "Class" -> "介词", "Label" -> Text["介词\"被\""], "Description" -> ""|>,
		"q" -> <|"Tag" -> "q", "Class" -> "量词", "Label" -> Text["量词"], "Description" -> "取英语quantity的第1个字母。"|>,
		"qg" -> <|"Tag" -> "qg", "Class" -> "量词", "Label" -> Text["量词语素"], "Description" -> ""|>,
		"qt" -> <|"Tag" -> "qt", "Class" -> "量词", "Label" -> Text["时量词"], "Description" -> ""|>,
		"qv" -> <|"Tag" -> "qv", "Class" -> "量词", "Label" -> Text["动量词"], "Description" -> ""|>,
		"r" -> <|"Tag" -> "r", "Class" -> "代词", "Label" -> Text["代词"], "Description" -> "取英语代词pronoun的第2个字母，因p已用于介词。"|>,
		"rg" -> <|"Tag" -> "rg", "Class" -> "代词", "Label" -> Text["代词性语素"], "Description" -> "代词性语素。代词代码为r，在语素的代码g前面置以R。"|>,
		"Rg" -> <|"Tag" -> "Rg", "Class" -> "R", "Label" -> Text["古汉语代词性语素"], "Description" -> ""|>,
		"rr" -> <|"Tag" -> "rr", "Class" -> "代词", "Label" -> Text["人称代词"], "Description" -> ""|>,
		"ry" -> <|"Tag" -> "ry", "Class" -> "代词", "Label" -> Text["疑问代词"], "Description" -> ""|>,
		"rys" -> <|"Tag" -> "rys", "Class" -> "代词", "Label" -> Text["处所疑问代词"], "Description" -> ""|>,
		"ryt" -> <|"Tag" -> "ryt", "Class" -> "代词", "Label" -> Text["时间疑问代词"], "Description" -> ""|>,
		"ryv" -> <|"Tag" -> "ryv", "Class" -> "代词", "Label" -> Text["谓词性疑问代词"], "Description" -> ""|>,
		"rz" -> <|"Tag" -> "rz", "Class" -> "代词", "Label" -> Text["指示代词"], "Description" -> ""|>,
		"rzs" -> <|"Tag" -> "rzs", "Class" -> "代词", "Label" -> Text["处所指示代词"], "Description" -> ""|>,
		"rzt" -> <|"Tag" -> "rzt", "Class" -> "代词", "Label" -> Text["时间指示代词"], "Description" -> ""|>,
		"rzv" -> <|"Tag" -> "rzv", "Class" -> "代词", "Label" -> Text["谓词性指示代词"], "Description" -> ""|>,
		"s" -> <|"Tag" -> "s", "Class" -> "处所词", "Label" -> Text["处所词"], "Description" -> "取英语space的第1个字母。"|>,
		"t" -> <|"Tag" -> "t", "Class" -> "时间词", "Label" -> Text["时间词"], "Description" -> "取英语time的第1个字母。"|>,
		"tg" -> <|"Tag" -> "tg", "Class" -> "时间词", "Label" -> Text["时间词性语素"], "Description" -> "时间词性语素。时间词代码为t，在语素的代码g前面置以T。"|>,
		"u" -> <|"Tag" -> "u", "Class" -> "助词", "Label" -> Text["助词"], "Description" -> "取英语助词auxiliary。"|>,
		"ud" -> <|"Tag" -> "ud", "Class" -> "助词", "Label" -> Text["助词"], "Description" -> ""|>,
		"ude1" -> <|"Tag" -> "ude1", "Class" -> "助词", "Label" -> Text["的 底"], "Description" -> ""|>,
		"ude2" -> <|"Tag" -> "ude2", "Class" -> "助词", "Label" -> Text["地"], "Description" -> ""|>,
		"ude3" -> <|"Tag" -> "ude3", "Class" -> "助词", "Label" -> Text["得"], "Description" -> ""|>,
		"udeng" -> <|"Tag" -> "udeng", "Class" -> "助词", "Label" -> Text["等"], "Description" -> "等等 云云"|>,
		"udh" -> <|"Tag" -> "udh", "Class" -> "助词", "Label" -> Text["的话"], "Description" -> ""|>,
		"ug" -> <|"Tag" -> "ug", "Class" -> "助词", "Label" -> Text["过"], "Description" -> ""|>,
		"uguo" -> <|"Tag" -> "uguo", "Class" -> "助词", "Label" -> Text["过"], "Description" -> ""|>,
		"uj" -> <|"Tag" -> "uj", "Class" -> "助词", "Label" -> Text["助词"], "Description" -> ""|>,
		"ul" -> <|"Tag" -> "ul", "Class" -> "助词", "Label" -> Text["连词"], "Description" -> ""|>,
		"ule" -> <|"Tag" -> "ule", "Class" -> "助词", "Label" -> Text["了 喽"], "Description" -> ""|>,
		"ulian" -> <|"Tag" -> "ulian", "Class" -> "助词", "Label" -> Text["连"], "Description" -> "（\"连小学生都会\"）"|>,
		"uls" -> <|"Tag" -> "uls", "Class" -> "助词", "Label" -> Text["来"], "Description" -> "来讲 来说 而言 说来"|>,
		"usuo" -> <|"Tag" -> "usuo", "Class" -> "助词", "Label" -> Text["所"], "Description" -> ""|>,
		"uv" -> <|"Tag" -> "uv", "Class" -> "助词", "Label" -> Text["连词"], "Description" -> ""|>,
		"uyy" -> <|"Tag" -> "uyy", "Class" -> "助词", "Label" -> Text["般"], "Description" -> "一样 一般 似的 xx般的"|>,
		"uz" -> <|"Tag" -> "uz", "Class" -> "助词", "Label" -> Text["着"], "Description" -> ""|>,
		"uzhe" -> <|"Tag" -> "uzhe", "Class" -> "助词", "Label" -> Text["着"], "Description" -> ""|>,
		"uzhi" -> <|"Tag" -> "uzhi", "Class" -> "助词", "Label" -> Text["之"], "Description" -> ""|>,
		"v" -> <|"Tag" -> "v", "Class" -> "动词", "Label" -> Text["动词"], "Description" -> "取英语动词verb的第一个字母。"|>,
		"vd" -> <|"Tag" -> "vd", "Class" -> "动词", "Label" -> Text["副动词"], "Description" -> "直接作状语的动词。动词和副词的代码并在一起。"|>,
		"vf" -> <|"Tag" -> "vf", "Class" -> "动词", "Label" -> Text["趋向动词"], "Description" -> ""|>,
		"vg" -> <|"Tag" -> "vg", "Class" -> "动词", "Label" -> Text["动词性语素"], "Description" -> "动词性语素。动词代码为v。在语素的代码g前面置以V。"|>,
		"vi" -> <|"Tag" -> "vi", "Class" -> "动词", "Label" -> Text["不及物动词（内动词）"], "Description" -> ""|>,
		"vl" -> <|"Tag" -> "vl", "Class" -> "动词", "Label" -> Text["动词性惯用语"], "Description" -> ""|>,
		"vn" -> <|"Tag" -> "vn", "Class" -> "动词", "Label" -> Text["名动词"], "Description" -> "指具有名词功能的动词。动词和名词的代码并在一起。"|>,
		"vshi" -> <|"Tag" -> "vshi", "Class" -> "动词", "Label" -> Text["动词\"是\""], "Description" -> ""|>,
		"vx" -> <|"Tag" -> "vx", "Class" -> "动词", "Label" -> Text["形式动词"], "Description" -> ""|>,
		"vyou" -> <|"Tag" -> "vyou", "Class" -> "动词", "Label" -> Text["动词\"有\""], "Description" -> ""|>,
		"w" -> <|"Tag" -> "w", "Class" -> "标点", "Label" -> Text["标点符号"], "Description" -> ""|>,
		"wb" -> <|"Tag" -> "wb", "Class" -> "标点", "Label" -> Text["百分号千分号"], "Description" -> "全角：％ ‰   半角：%"|>,
		"wd" -> <|"Tag" -> "wd", "Class" -> "标点", "Label" -> Text["逗号"], "Description" -> "全角：， 半角："|>,
		"wf" -> <|"Tag" -> "wf", "Class" -> "标点", "Label" -> Text["分号"], "Description" -> "全角：； 半角： ;"|>,
		"wh" -> <|"Tag" -> "wh", "Class" -> "标点", "Label" -> Text["单位符号"], "Description" -> "全角：￥ ＄ ￡  \[Degree]  ℃  半角：$"|>,
		"wj" -> <|"Tag" -> "wj", "Class" -> "标点", "Label" -> Text["句号"], "Description" -> "全角：。"|>,
		"wky" -> <|"Tag" -> "wky", "Class" -> "标点", "Label" -> Text["右括号"], "Description" -> "全角：） 〕  ］ ｝ 》  】 〗 〉 半角： ) ] { >"|>,
		"wkz" -> <|"Tag" -> "wkz", "Class" -> "标点", "Label" -> Text["左括号"], "Description" -> "全角：（ 〔  ［  ｛  《 【  〖 〈   半角：( [ { <"|>,
		"wm" -> <|"Tag" -> "wm", "Class" -> "标点", "Label" -> Text["冒号"], "Description" -> "全角：： 半角： :"|>,
		"wn" -> <|"Tag" -> "wn", "Class" -> "标点", "Label" -> Text["顿号"], "Description" -> "全角：、"|>,
		"wp" -> <|"Tag" -> "wp", "Class" -> "标点", "Label" -> Text["破折号"], "Description" -> "全角：\[LongDash]\[LongDash]   －－   \[LongDash]\[LongDash]－   半角：\[LongDash]  \[LongDash]-"|>,
		"ws" -> <|"Tag" -> "ws", "Class" -> "标点", "Label" -> Text["省略号"], "Description" -> "全角：\[Ellipsis]\[Ellipsis]  \[Ellipsis]"|>,
		"wt" -> <|"Tag" -> "wt", "Class" -> "标点", "Label" -> Text["叹号"], "Description" -> "全角：！"|>,
		"ww" -> <|"Tag" -> "ww", "Class" -> "标点", "Label" -> Text["问号"], "Description" -> "全角：？"|>,
		"wyy" -> <|"Tag" -> "wyy", "Class" -> "标点", "Label" -> Text["右引号"], "Description" -> "全角：\" ' 』"|>,
		"wyz" -> <|"Tag" -> "wyz", "Class" -> "标点", "Label" -> Text["左引号"], "Description" -> "全角：\" ' 『"|>,
		"x" -> <|"Tag" -> "x", "Class" -> "字符串", "Label" -> Text["字符串"], "Description" -> "非语素字只是一个符号，字母x通常用于代表未知数、符号。"|>,
		"xu" -> <|"Tag" -> "xu", "Class" -> "字符串", "Label" -> Text["网址URL"], "Description" -> ""|>,
		"xx" -> <|"Tag" -> "xx", "Class" -> "字符串", "Label" -> Text["非语素字"], "Description" -> ""|>,
		"y" -> <|"Tag" -> "y", "Class" -> "语气词", "Label" -> Text["语气词"], "Description" -> "取汉字\"语\"的声母。"|>,
		"yg" -> <|"Tag" -> "yg", "Class" -> "语气词", "Label" -> Text["语气语素"], "Description" -> "语气词性语素。语气词代码为y。在语素的代码g前面置以Y。"|>,
		"z" -> <|"Tag" -> "z", "Class" -> "状态词", "Label" -> Text["状态词"], "Description" -> "取汉字\"状\"的声母的前一个字母。"|>,
		"zg" -> <|"Tag" -> "zg", "Class" -> "状态词", "Label" -> Text["状态词"], "Description" -> ""|>
	|>
|>] // EntityRegister;
GrammaticalUnitCheck := Which[
	!AssociationQ@NaturalLanguageProcessing`PackageScope`TagNameAssoc,
	TextElement["Ready", <|"GrammaticalUnit" -> Entity["GrammaticalUnit", "Adjective"]|>];
	GrammaticalUnitCheck,
	
	Length@NaturalLanguageProcessing`PackageScope`TagNameAssoc > 200,
	GrammaticalUnitCheck = True,
	
	True,
	AssociateTo[
		NaturalLanguageProcessing`PackageScope`TagNameAssoc,
		# -> Style[#["Class"], 12]& /@ EntityList["HLP"]
	];
];

(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{ },
	{Protected, ReadProtected}
];
End[]
