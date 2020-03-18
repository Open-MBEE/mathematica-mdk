BeginPackage["MMS`Groups`"];

ConstructGroups::usage = "ConstructGroups[] - Create an Association that represents the Groups model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructGroups[]:=(
association = <|"groups" -> {}|>;
Return[association];
);
End[];

EndPackage[];