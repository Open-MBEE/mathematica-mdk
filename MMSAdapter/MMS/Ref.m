BeginPackage["MMS`Ref`"];

ConstructRef::usage = "ConstructRef[] - Create an Association that represents the Ref model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructRef[]:=(
association = <|"id" -> Null, "name" -> Null, "parentRefId" -> Null, "type" -> "Branch"|>;
Return[association];
);
End[];

EndPackage[];