BeginPackage["MMS`Documents`"];

ConstructDocuments::usage = "ConstructDocuments[] - Create an Association that represents the Documents model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructDocuments[]:=(
association = <|"documents" -> {}|>;
Return[association];
);
End[];

EndPackage[];