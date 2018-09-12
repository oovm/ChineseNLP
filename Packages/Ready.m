(* ::Package:: *)
(* ::Title:: *)
(*Ready!*)
(* ::Subchapter:: *)
(*Package Introduce*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-09-09*)
(*Copyright: Mozilla Public License Version 2.0*)
(* ::Program:: *)
(*Keep this License, thanks.*)
Ready::offline = "The Wolfram Language is currently configured not to use the Internet. To allow Internet use, check the \"Allow the Wolfram Language to use the Internet\" box in the Help \[FilledRightTriangle] Internet Connectivity dialog.";
Ready::usage = "Ready for File!";
(* ::Subsection::Closed:: *)
(*Main*)
Begin["`Ready`"];
Version$Ready = "V1.1.2";
Updated$Ready = "2018-09-11";
(* ::Subsubsection:: *)
(*Functions*)
(*Ready /: Set[x_, Ready[y__]] := SetReady[y, Symbol -> x];*)
(*Ready /: SetDelayed[x_, Ready[y__]] := SetReady[y, Symbol -> x];*)
(*Message[NeuralNetworks`Private`NetModel`head::offline]*)
Options[Ready] = {Format -> True, Echo -> False};
Ready[url_String, ops : OptionsPattern[]] := Block[
	{fmt, print},
	{fmt, print} = OptionValue[{Format, Echo}];
	If[FileExistsQ@URL2Local[url], Return@CheckImport[Ready[url, ops], URL2Local[url], fmt]];
	SetReadyDownload[url, URL2Local[url], Echo -> print];
	Return@Missing["NotAvailable"]
];
Ready[url_String, local_String, ops : OptionsPattern[]] := Block[
	{fmt, print},
	{fmt, print} = OptionValue[{Format, Echo}];
	If[FileExistsQ@local, Return@CheckImport[Ready[url, local, ops], local, fmt]];
	CheckDirectory@local;CheckInternet;
	SetReadyDownload[url, local, Echo -> print];
	Return@Missing["NotAvailable"]
];
URL2Local[url_String, OptionsPattern[]] := Block[
	{file = Last@StringSplit[url, "/"]},
	FileNameJoin[{$UserBaseDirectory, "ApplicationData", "WaifuX", file}]
];
CheckDirectory[dir_] := If[!DirectoryQ@dir, CreateDirectory[dir]];
CheckInternet := If[
	!PacletManager`$AllowInternet,
	Message[Ready::offline];
	Return[$Failed]
];
SetAttributes[CheckImport, HoldFirst];
CheckImport[var_, f_, fmt_] := var = If[TrueQ@fmt, Import[f], Import[f, fmt]];
Options[SetReadyDownload] = {Echo -> True};
SetReadyDownload[url_String, local_String, OptionsPattern[]] := Module[
	{manifest},
	manifest = <||>;
	downloadStart[manifest][url, local];
	If[TrueQ@OptionValue[Echo], Echo[FileNameTake[local], "Downloading: "]];
	downloadVisualize[manifest]
];
SetAttributes[{downloadProgress, downloadFinished, downloadStart, downloadVisualize}, HoldFirst];
downloadProgress[manifest_][event_] := manifest = <|manifest, event["Task"] -> event|>;
downloadFinished[manifest_][event_] := manifest = {};
Options[downloadStart] = {Symbol -> Null};
downloadStart[manifest_][src_String, dest_String, OptionsPattern[]] := URLDownloadSubmit[
	HTTPRequest[src, FollowRedirects -> True],
	CreateFile@dest,
	HandlerFunctions -> <|
		"ConnectionFailed" -> connectionFailed[manifest],
		"CookiesReceived" -> cookiesReceived[manifest],
		"HeadersReceived" -> headersReceived[manifest],
		"TaskFinished" -> downloadFinished[manifest],
		"TaskProgress" -> downloadProgress[manifest],
		"TaskStatusChanged" -> taskStatusChanged[manifest]
	|>,
	HandlerFunctionsKeys -> {
		"Task", "TaskStatus", "File",
		"ByteCountTotal", "ByteCountDownloaded", "FractionComplete"
	}
];
downloadVisualize[manifest_] := Print@Dynamic@Which[
	manifest === <||>,
	GeneralUtilities`ProgressPanel[Style["Checking the connection...", 14]],
	
	!AssociationQ[manifest],
	GeneralUtilities`ProgressPanel[Style["Download Success!", 14]],
	
	True,
	GeneralUtilities`ProgressPanel[
		Style[StringJoin[FileNameTake[#File], " Downloading..."], 14],
		StringJoin[ToString /@ {
			Floor[#ByteCountTotal / 2^20, 0.001], "MB/",
			Floor[#ByteCountDownloaded / 2^20, 0.001], "MB"
		}],
		#FractionComplete
	]&[First@Values[manifest]]
];
(* ::Subsection::Closed:: *)
(*Additional*)
End[];
SetAttributes[
	{Ready},
	{ReadProtected}
]
