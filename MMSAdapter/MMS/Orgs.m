BeginPackage["MMS`Orgs`"];

ConstructOrgs::usage = "ConstructOrgs[] - Create an Association that represents the Orgs model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructOrgs[]:=(
association = <|"orgs" -> {}|>;
Return[association];
);
End[];

EndPackage[];