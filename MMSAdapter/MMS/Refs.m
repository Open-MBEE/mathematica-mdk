BeginPackage["MMS`Refs`"];

ConstructRefs::usage = "ConstructRefs[] - Create an Association that represents the Refs model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructRefs[]:=(
association = <|"refs" -> {}|>;
Return[association];
);
End[];

EndPackage[];