<!---\\ Capitalizes the First Letter of a String
Easy Usage: #AutoCap(myString)# - That is it
J Harvey
//--->
<cfscript>
function AutoCap(str) {
var result = Trim(str);
var wordCount = ListLen(result," ");
var ProperString = "";

for(i=1;i LTE wordCount;i=i+1) {
ProperString = ProperString & " " & UCase(Left(ListGetAt(result,i,""),1)) & LCase(RemoveChars(ListGetAt(result,i," "),1,1));
}
ProperString = Trim(ProperString);
return ProperString;
}
</cfscript>