BeginPackage["MMS`TicketApi`"];

GetTicket::usage = "GetTicket[ticketId_String, OptionsPattern[]] - Get ticket";

Begin["`Private`"];

GetTicket[ticketId_String, OptionsPattern[]]:=(
relativePath="/mms/login/ticket/{ticket_id}";
If[ticketId =!= Null, relativePath=StringReplace[relativePath, "{" <> "ticket_id" <> "}" -> ticketId]];
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

PostTicket::usage = "PostTicket[body_Association, OptionsPattern[]] - Create ticket";

Begin["`Private`"];

PostTicket[body_Association, OptionsPattern[]]:=(
relativePath="/api/login";
path=MMS`Private`basePath <> relativePath;
url=URLParse[path];
queryParams=<||>;
url=URLBuild[url, queryParams];
request=<||>;
request["Method"]="POST";
request["Body"]=ExportString[body, "RawJSON", "Compact" -> True];
request["ContentType"]="application/json";
headers=<||>;
request["Headers"]=headers;
Return[ImportString[ExportString[URLExecute[HTTPRequest[url, request, "Interactive" -> MMS`interactive]], "JSON", "Compact" -> True], "RawJSON"]];
);
End[];

EndPackage[];