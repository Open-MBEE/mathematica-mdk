BeginPackage["MMS`Project`"];

ConstructProject::usage = "ConstructProject[] - Create an Association that represents the Project model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructProject[]:=(
association = <|"id" -> Null, "name" -> Null, "orgId" -> Null, "type" -> "Project"|>;
Return[association];
);
End[];

EndPackage[];