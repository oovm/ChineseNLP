ChineseNLP::usage = "";
Begin["`Private`"];
PackageLoadPacletDependency["JLink`"];
SetOptions[JLink`InstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetOptions[JLink`ReinstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetDirectory@FileNameJoin[{$UserBaseDirectory, "Applications", "ChineseNLP", "Resources"}];
JLink`ReinstallJava[JLink`ClassPath -> "JLink-ChineseNLP.jar"];
PackageExtendContextPath[
	{
		"JLink`"
	}
];
If[$CharacterEncoding =!= "UTF-8",
	$CharacterEncoding = "UTF-8";
	Print[{
		Style["$CharacterEncoding has been changed to UTF-8 to avoid problems.", Red],
		Style["Because ChineseNLP only works under UTF-8"]
	} // TableForm];
	st = OpenAppend[FindFile["init.m"]];
	WriteString[st, "$CharacterEncoding=\"UTF-8\";"];
	Close[st];
];
End[]
