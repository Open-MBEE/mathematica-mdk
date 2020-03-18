BeginPackage["MMS`Commit`"];

ConstructCommit::usage = "ConstructCommit[] - Create an Association that represents the Commit model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructCommit[]:=(
association = <|"id" -> Null|>;
Return[association];
);
End[];

EndPackage[];