BeginPackage["MMS`LoginResponse`"];

ConstructLoginResponse::usage = "ConstructLoginResponse[] - Create an Association that represents the LoginResponse model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructLoginResponse[]:=(
association = <|"data" -> Null|>;
Return[association];
);
End[];

EndPackage[];