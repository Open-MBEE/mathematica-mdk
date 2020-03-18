BeginPackage["MMS`OtherApi`"];

GetDocuments::usage = "GetDocuments[projectId_String, refId_String, OptionsPattern[]] - Get documents";

Begin["`Private`"];

GetDocuments[projectId_String, refId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/documents";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
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

GetGroups::usage = "GetGroups[projectId_String, refId_String, OptionsPattern[]] - Get groups";

Begin["`Private`"];

GetGroups[projectId_String, refId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/groups";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
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

GetMounts::usage = "GetMounts[projectId_String, refId_String, OptionsPattern[]] - Get mounts";

Begin["`Private`"];

GetMounts[projectId_String, refId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/mounts";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
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

EndPackage[];