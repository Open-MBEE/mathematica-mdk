BeginPackage["MMS`Commits`"];

ConstructCommits::usage = "ConstructCommits[] - Create an Association that represents the Commits model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructCommits[]:=(
association = <|"commits" -> {}|>;
Return[association];
);
End[];

EndPackage[];