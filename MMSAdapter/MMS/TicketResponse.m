BeginPackage["MMS`TicketResponse`"];

ConstructTicketResponse::usage = "ConstructTicketResponse[] - Create an Association that represents the TicketResponse model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructTicketResponse[]:=(
association = <|"username" -> Null, "first" -> Null, "last" -> Null|>;
Return[association];
);
End[];

EndPackage[];