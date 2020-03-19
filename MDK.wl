(* ::Package:: *)

Needs["MMS`"]


BeginPackage["MDK`"];
MMSUtils::usage="Functions to read/write to MMS";
MMS`SetInteractive[False];


Login::usage="Login[server_String] - Logs in to a specific server";


Begin["`Private`"];
Login[server_String]:=(
MMS`SetBasePath[StringJoin[server,"/alfresco/service"]];
If[CheckLogin[],Return["Logged in"],DoLogin[server]];
)
End[];


Logout::usage="Logout[] - Logs out of current session";


Begin["`Private`"];
Logout[]:=(
MMS`TicketAuth=Null;
)
End[];


Begin["`Private`"];
CheckLogin[]:=(
ticket=MMS`TicketAuth;
If[ticket==Null,Return[False]];
ticketResponse=MMS`TicketApi`GetTicket[ticket];
Return[KeyExistsQ[ticketResponse,"username"]];
)
End[];


Begin["`Private`"];
DoLogin[server_String]:=(
ticketRequest=MMS`LoginRequest`ConstructLoginRequest[];
dialogResponse=AuthenticationDialog["UsernamePassword"];

If[TrueQ[dialogResponse == $Canceled], FrontEndTokenExecute["EvaluatorAbort"],
	ticketRequest["username"]=dialogResponse["Username"];
	ticketRequest["password"]=dialogResponse["Password"];
	ticketResponse=MMS`TicketApi`PostTicket[ticketRequest];
	MMS`SetTicketAuth[ticketResponse["data"]["ticket"]];
	ClearAll[ticketRequest, dialogResponse]
	];
)
End[];


UpdatePresentationElementDocumentation::usage="Given a presentation element, it updates the documentation field";


Begin["`Private`"];
UpdatePresentationElementDocumentation[server_String, project_String, ref_String, id_String, content_String]:=(
Login[server];
elem=<|"id"->id,"documentation"->content|>;
MMS`ElementApi`PostElements[project,ref,<|"elements"->{elem}|>];
)
End[];


GetPresentationElement::usage="Gets a presentation element by ID.";


Begin["`Private`"];
GetPresentationElement[server_String, project_String, ref_String, id_String]:=(
Login[server];
results=MMS`ElementApi`GetElement[project,ref,id];
elem=results["elements"][[1]];
If[TrueQ[elem=="KeyAbsent"],Return[results],Return[elem]];
)
End[];


PublishTableToPresentationElement::usage="Publishes a table to a presentation element";


Begin["`Private`"];
PublishTableToPresentationElement[server_String, project_String, ref_String, id_String, grid_Grid]:=(
Login[server];
htmlString=ExportString[grid,"HTMLFragment"];
UpdatePresentationElementDocumentation[server,project,ref,id,htmlString]
)
End[];


PublishImageToPresentationElement::usage="Publishes an image to a presentation element";


Begin["Private`"];
PublishImageToPresentationElement[server_String,project_String,ref_String,presentationID_String,artifactName_String,artifactFile_File]:=(
Login[server];
artifactResponse=UploadFile[server,project,ref,artifactName,artifactFile];
artifact=artifactResponse["artifacts"][[1]];
artifactURL=StringJoin["https://",server,"/alfresco",artifact["artifactLocation"]];
PublishImageURLToPresentationElement[server,project,ref,presentationID,artifactURL];
)
End[];


PublishImageURLToPresentationElement::usage="Publishes a URL to a presentation element that will render an image";


Begin["Private`"];
PublishImageURLToPresentationElement[server_String,project_String,ref_String,id_String,url_String]:=(
Login[server];
imageHTML=StringJoin["<img src=\"",url,"\" />"];
UpdatePresentationElementDocumentation[server,project,ref,id,imageHTML];
)
End[];


UploadFile::usage="Uploads a file to the artifacts endpoint";


Begin["`Private`"];
UploadFile[server_String, project_String, ref_String, id_String, file_File]:=(
Login[server];
response=MMS`ArtifactApi`PostArtifact[project,ref,id,file];
Return[response];
)
End[];


CreateBranch::usage="Create a new branch from a parent branch";


Begin["`Private`"];
CreateBranch[server_String, project_String, parentBranch_String,branchName_String]:=(
Login[server];
getRefResponse=MMS`RefApi`GetRef[project, parentBranch];
parent=getRefResponse["refs"][[1]];
parentID=parent["id"];
branch=MMS`Ref`ConstructRef[];
branch["parentRefId"]=parentID;
branch["name"]=branchName;
response=MMS`RefApi`PostRefs[project,<|"refs"->{branch}|>];
Return[response];
)
End[];


EndPackage[]
