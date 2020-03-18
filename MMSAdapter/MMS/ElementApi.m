BeginPackage["MMS`ElementApi`"];

DeleteElement::usage = "DeleteElement[projectId_String, refId_String, elementId_String, OptionsPattern[]] - Delete element";

Begin["`Private`"];

DeleteElement[projectId_String, refId_String, elementId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/elements/{element_id}";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
If[elementId =!= Null, relativePath=StringReplace[relativePath, "{" <> "element_id" <> "}" -> elementId]];
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
If[MMS`TicketAuth =!= Null, queryParams["alf_ticket"]=MMS`TicketAuth];
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="DELETE";
request["ContentType"]="application/json";
headers=<||>;
If[ValueQ[MMS`BasicAuth] && MMS`BasicAuth =!= Null, headers["Authorization"]=MMS`BasicAuth];
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

DeleteElementsInBatch::usage = "DeleteElementsInBatch[projectId_String, refId_String, body_Association, OptionsPattern[]] - Delete element(s) in batch";

Begin["`Private`"];

DeleteElementsInBatch[projectId_String, refId_String, body_Association, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/elements";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
If[MMS`TicketAuth =!= Null, queryParams["alf_ticket"]=MMS`TicketAuth];
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="DELETE";
request["Body"]=ExportString[body, "RawJSON", "Compact" -> True];
request["ContentType"]="application/json";
headers=<||>;
If[ValueQ[MMS`BasicAuth] && MMS`BasicAuth =!= Null, headers["Authorization"]=MMS`BasicAuth];
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

GetElement::usage = "GetElement[projectId_String, refId_String, elementId_String, OptionsPattern[depth_Real, extended_Boolean, commitId_String]] - Get element";

Begin["`Private`"];
options={};
AppendTo[options, depth -> Null];
AppendTo[options, extended -> Null];
AppendTo[options, commitId -> Null];
Options[GetElement]=options;

GetElement[projectId_String, refId_String, elementId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/elements/{element_id}";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
If[elementId =!= Null, relativePath=StringReplace[relativePath, "{" <> "element_id" <> "}" -> elementId]];
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
If[OptionValue[depth] =!= Null, queryParams["depth"]=OptionValue[depth]];
If[OptionValue[extended] =!= Null, queryParams["extended"]=OptionValue[extended]];
If[OptionValue[commitId] =!= Null, queryParams["commitId"]=OptionValue[commitId]];
If[MMS`TicketAuth =!= Null, queryParams["alf_ticket"]=MMS`TicketAuth];
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="GET";
request["ContentType"]="application/json";
headers=<||>;
If[ValueQ[MMS`BasicAuth] && MMS`BasicAuth =!= Null, headers["Authorization"]=MMS`BasicAuth];
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

GetElementHistory::usage = "GetElementHistory[projectId_String, refId_String, elementId_String, OptionsPattern[]] - Get element history";

Begin["`Private`"];

GetElementHistory[projectId_String, refId_String, elementId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/elements/{element_id}/history";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
If[elementId =!= Null, relativePath=StringReplace[relativePath, "{" <> "element_id" <> "}" -> elementId]];
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
If[MMS`TicketAuth =!= Null, queryParams["alf_ticket"]=MMS`TicketAuth];
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="GET";
request["ContentType"]="application/json";
headers=<||>;
If[ValueQ[MMS`BasicAuth] && MMS`BasicAuth =!= Null, headers["Authorization"]=MMS`BasicAuth];
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

GetElements::usage = "GetElements[projectId_String, refId_String, OptionsPattern[extended_Boolean, commitId_String]] - Get elements";

Begin["`Private`"];
options={};
AppendTo[options, extended -> Null];
AppendTo[options, commitId -> Null];
Options[GetElements]=options;

GetElements[projectId_String, refId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/elements";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
If[OptionValue[extended] =!= Null, queryParams["extended"]=OptionValue[extended]];
If[OptionValue[commitId] =!= Null, queryParams["commitId"]=OptionValue[commitId]];
If[MMS`TicketAuth =!= Null, queryParams["alf_ticket"]=MMS`TicketAuth];
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="GET";
request["ContentType"]="application/json";
headers=<||>;
If[ValueQ[MMS`BasicAuth] && MMS`BasicAuth =!= Null, headers["Authorization"]=MMS`BasicAuth];
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

GetElementsInBatch::usage = "GetElementsInBatch[projectId_String, refId_String, body_Association, OptionsPattern[depth_Real, extended_Boolean, commitId_String]] - Get element(s) in batch";

Begin["`Private`"];
options={};
AppendTo[options, depth -> Null];
AppendTo[options, extended -> Null];
AppendTo[options, commitId -> Null];
Options[GetElementsInBatch]=options;

GetElementsInBatch[projectId_String, refId_String, body_Association, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/elements";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
If[OptionValue[depth] =!= Null, queryParams["depth"]=OptionValue[depth]];
If[OptionValue[extended] =!= Null, queryParams["extended"]=OptionValue[extended]];
If[OptionValue[commitId] =!= Null, queryParams["commitId"]=OptionValue[commitId]];
If[MMS`TicketAuth =!= Null, queryParams["alf_ticket"]=MMS`TicketAuth];
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="PUT";
request["Body"]=ExportString[body, "RawJSON", "Compact" -> True];
request["ContentType"]="application/json";
headers=<||>;
If[ValueQ[MMS`BasicAuth] && MMS`BasicAuth =!= Null, headers["Authorization"]=MMS`BasicAuth];
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

PostElements::usage = "PostElements[projectId_String, refId_String, body_Association, OptionsPattern[]] - Create and/or update element(s)";

Begin["`Private`"];

PostElements[projectId_String, refId_String, body_Association, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/elements";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
If[MMS`TicketAuth =!= Null, queryParams["alf_ticket"]=MMS`TicketAuth];
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="POST";
request["Body"]=ExportString[body, "RawJSON", "Compact" -> True];
request["ContentType"]="application/json";
headers=<||>;
If[ValueQ[MMS`BasicAuth] && MMS`BasicAuth =!= Null, headers["Authorization"]=MMS`BasicAuth];
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

EndPackage[];