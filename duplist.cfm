<cfscript>
/**
 * Case-sensitive function for removing duplicate entries in a list.
 * Based on dedupe by Raymond Camden
 * 
 * @param list 	 The list to be modified. 
 * @return Returns a list. 
 * @author Jeff Howden (jeff@members.evolt.org) 
 * @version 1, March 21, 2002 
 */
function ListDeleteDuplicates(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  for(i = 1; i LTE ArrayLen(list); i = i + 1)
    if(NOT ListFind(returnValue, list[i], delimiter))
      returnValue = ListAppend(returnValue, list[i], delimiter);
  return returnValue;
}
</cfscript>
<!--- 
 Example
<cfset myList = "apples,oranges,apples,bananas,ORANGES">

<cfoutput>
List before removing dupes: #myList#<br>
List after removing dupes: #ListDeleteDuplicates(myList)#
</cfoutput>

Output
List before removing dupes: apples,oranges,apples,bananas,ORANGES
List after removing dupes: apples,oranges,bananas,ORANGES 
--->
