BeginPackage["MMS`RefApi`"];

DeleteRef::usage = "DeleteRef[projectId_String, refId_String, OptionsPattern[]] - Delete ref";

Begin["`Private`"];

DeleteRef[projectId_String, refId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
If[refId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ref_id" <> "}" -> refId]];
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

GetRef::usage = "GetRef[projectId_String, refId_String, OptionsPattern[]] - Get ref";

Begin["`Private`"];

GetRef[projectId_String, refId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}";
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

GetRefHistory::usage = "GetRefHistory[projectId_String, refId_String, OptionsPattern[]] - Get ref history";

Begin["`Private`"];

GetRefHistory[projectId_String, refId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs/{ref_id}/history";
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

GetRefs::usage = "GetRefs[projectId_String, OptionsPattern[]] - Get all refs in project";

Begin["`Private`"];

GetRefs[projectId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
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

PostRefs::usage = "PostRefs[projectId_String, body_Association, OptionsPattern[]] - Create and/or update ref(s)";

Begin["`Private`"];

PostRefs[projectId_String, body_Association, OptionsPattern[]]:=(
relativePath="/projects/{project_id}/refs";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
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