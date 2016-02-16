<!---\\ Get ColdFusion Datasources
Easy Usage: #propercase(myString)# - That is it
            ACF and Railo
J Harvey
//--->
<cfscript>
//ProperCase Text:
function propercase(string){
	s=Replace(#string#, "/", ",","All");
	s=Replace(#s#, "&", ",","All");
	sArray = ListToArray(#s#);
	for(i=1; i LTE ArrayLen(sArray); i=i+1){
		s=Replace(#sArray[i]#, " ", ",","All");
		sArray[i]="";
		arr = ListToArray(#s#);	
		for(x=1; x LTE ArrayLen(arr); x=x+1){
			str=trim(arr[x]);
			str=UCase(Mid(str, 1, 1))&LCase(Mid(str, 2, Len(str)));
			sArray[i]=sArray[i]& " " & str;
		}
		sArray[i]=trim(sArray[i]);
	}
	s=ReReplace(ArrayToList(sArray, ", "), '(.*),', '\1 &');
	s=ReplaceAmps(s);
	
	return s;
}
</cfscript>
