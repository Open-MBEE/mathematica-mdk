BeginPackage["MMS`ProjectApi`"];

DeleteProject::usage = "DeleteProject[projectId_String, OptionsPattern[]] - Delete project";

Begin["`Private`"];

DeleteProject[projectId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}";
If[projectId =!= Null, relativePath=StringReplace[relativePath, "{" <> "project_id" <> "}" -> projectId]];
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

GetProject::usage = "GetProject[projectId_String, OptionsPattern[]] - Get project";

Begin["`Private`"];

GetProject[projectId_String, OptionsPattern[]]:=(
relativePath="/projects/{project_id}";
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

GetProjects::usage = "GetProjects[OptionsPattern[]] - Get all projects";

Begin["`Private`"];

GetProjects[OptionsPattern[]]:=(
relativePath="/projects";
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

GetProjectsByOrg::usage = "GetProjectsByOrg[orgId_String, OptionsPattern[]] - Get all projects in org";

Begin["`Private`"];

GetProjectsByOrg[orgId_String, OptionsPattern[]]:=(
relativePath="/orgs/{org_id}/projects";
If[orgId =!= Null, relativePath=StringReplace[relativePath, "{" <> "org_id" <> "}" -> orgId]];
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

PostProjects::usage = "PostProjects[body_Association, OptionsPattern[]] - Create and/or update project(s)";

Begin["`Private`"];

PostProjects[body_Association, OptionsPattern[]]:=(
relativePath="/projects";
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

PostProjectsByOrg::usage = "PostProjectsByOrg[orgId_String, body_Association, OptionsPattern[]] - Create and/or update project(s) in org";

Begin["`Private`"];

PostProjectsByOrg[orgId_String, body_Association, OptionsPattern[]]:=(
relativePath="/orgs/{org_id}/projects";
If[orgId =!= Null, relativePath=StringReplace[relativePath, "{" <> "org_id" <> "}" -> orgId]];
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