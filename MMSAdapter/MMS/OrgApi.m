BeginPackage["MMS`OrgApi`"];

DeleteOrg::usage = "DeleteOrg[orgId_String, OptionsPattern[]] - Delete org";

Begin["`Private`"];

DeleteOrg[orgId_String, OptionsPattern[]]:=(
relativePath="/orgs/{org_id}";
If[orgId =!= Null, relativePath=StringReplace[relativePath, "{" <> "org_id" <> "}" -> orgId]];
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

GetOrg::usage = "GetOrg[orgId_String, OptionsPattern[]] - Get org";

Begin["`Private`"];

GetOrg[orgId_String, OptionsPattern[]]:=(
relativePath="/orgs/{org_id}";
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

GetOrgs::usage = "GetOrgs[OptionsPattern[]] - Get all orgs";

Begin["`Private`"];

GetOrgs[OptionsPattern[]]:=(
relativePath="/orgs";
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

PostOrgs::usage = "PostOrgs[body_Association, OptionsPattern[]] - Create and/or update org(s)";

Begin["`Private`"];

PostOrgs[body_Association, OptionsPattern[]]:=(
relativePath="/orgs";
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