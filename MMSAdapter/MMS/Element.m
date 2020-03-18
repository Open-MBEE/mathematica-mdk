BeginPackage["MMS`Element`"];

ConstructElement::usage = "ConstructElement[] - Create an Association that represents the Element model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructElement[]:=(
association = <|"id" -> Null, "name" -> Null|>;
Return[association];
);
End[];

EndPackage[];