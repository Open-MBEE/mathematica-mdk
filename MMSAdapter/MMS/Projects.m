BeginPackage["MMS`Projects`"];

ConstructProjects::usage = "ConstructProjects[] - Create an Association that represents the Projects model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructProjects[]:=(
association = <|"projects" -> {}|>;
Return[association];
);
End[];

EndPackage[];