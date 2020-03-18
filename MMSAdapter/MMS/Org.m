BeginPackage["MMS`Org`"];

ConstructOrg::usage = "ConstructOrg[] - Create an Association that represents the Org model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructOrg[]:=(
association = <|"id" -> Null, "name" -> Null|>;
Return[association];
);
End[];

EndPackage[];