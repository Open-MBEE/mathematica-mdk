BeginPackage["MMS`Mounts`"];

ConstructMounts::usage = "ConstructMounts[] - Create an Association that represents the Mounts model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructMounts[]:=(
association = <|"mounts" -> {}|>;
Return[association];
);
End[];

EndPackage[];