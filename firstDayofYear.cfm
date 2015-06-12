<!---\\ Gets the First Day of the Year
Easy Usage: #dateformat(firstDayOfTheYear(year=2015),'YYYY-MM-DD')# - That is it
J Harvey
//--->
<cfscript>
function FirstDayofTheYear()
	{
	  Var TheYear=Year(Now());
	  if(ArrayLen(Arguments)) 
	    TheYear = Arguments[1];
	  return CreateDate(TheYear,1,1);
	}
</cfscript>	