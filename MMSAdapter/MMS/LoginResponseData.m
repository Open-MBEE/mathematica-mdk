BeginPackage["MMS`LoginResponseData`"];

ConstructLoginResponseData::usage = "ConstructLoginResponseData[] - Create an Association that represents the LoginResponseData model with keys defined and defaults populated.";

Begin["`Private`"];
ConstructLoginResponseData[]:=(
association = <|"ticket" -> Null|>;
Return[association];
);
End[];

EndPackage[];