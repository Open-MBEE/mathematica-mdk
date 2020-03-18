BeginPackage["MMS`LoginRequest`"];

ConstructLoginRequest::usage = "ConstructLoginRequest[] - Create an Association that represents the LoginRequest model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructLoginRequest[]:=(
association = <|"username" -> Null, "password" -> Null|>;
Return[association];
);
End[];

EndPackage[];