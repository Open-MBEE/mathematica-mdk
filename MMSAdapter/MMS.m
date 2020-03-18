BeginPackage["MMS`"];

Needs["MMS`ElementApi`"];
Needs["MMS`OrgApi`"];
Needs["MMS`OtherApi`"];
Needs["MMS`ProjectApi`"];
Needs["MMS`RefApi`"];
Needs["MMS`TicketApi`"];
Needs["MMS`Commit`"];
Needs["MMS`Commits`"];
Needs["MMS`Documents`"];
Needs["MMS`Element`"];
Needs["MMS`Elements`"];
Needs["MMS`Groups`"];
Needs["MMS`LoginRequest`"];
Needs["MMS`LoginResponse`"];
Needs["MMS`LoginResponseData`"];
Needs["MMS`Mounts`"];
Needs["MMS`Org`"];
Needs["MMS`Orgs`"];
Needs["MMS`Project`"];
Needs["MMS`Projects`"];
Needs["MMS`Ref`"];
Needs["MMS`Refs`"];
Needs["MMS`TicketResponse`"];

Begin["`Private`"];
basePath="https://localhost/alfresco/service";
End[];

SetBasePath::usage = "SetBasePath[path_String] - Set base path.";

Begin["`Private`"];
SetBasePath[path_String]:=(
basePath=path;
);
End[];

Begin["`Private`"];
interactive=True;
End[];

SetInteractive::usage = "SetInteractive[i_Boolean] - Set whether user interactivity for requests is enabled.";

Begin["`Private`"];
SetInteractive[i_]:=(
interactive=i;
);
End[];

Begin["`Private`"];
BasicAuth=Null;
End[];

SetBasicAuth::usage = "SetBasicAuth[username_String, password_String] - Set basic authentication method named Basic.";

Begin["`Private`"];
SetBasicAuth[username_String, password_String]:=(
BasicAuth="Basic " <> ExportString[username <> ":" <> password, "Base64"];
);
End[];

Begin["`Private`"];
TicketAuth=Null;
End[];

SetTicketAuth::usage = "SetTicketAuth[username_String, password_String] - Set apiKey authentication method named Ticket.";

Begin["`Private`"];
SetTicketAuth[ticket_String]:=(
TicketAuth=ticket;
);
End[];

EndPackage[];