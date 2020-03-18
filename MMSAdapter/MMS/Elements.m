BeginPackage["MMS`Elements`"];

ConstructElements::usage = "ConstructElements[] - Create an Association that represents the Elements model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructElements[]:=(
association = <|"elements" -> {}|>;
Return[association];
);
End[];

EndPackage[];