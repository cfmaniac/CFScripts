<!---\\ Gets the Last Day of the Year
Easy Usage: #dateformat(lastDayOfTheYear(year=2015),'YYYY-MM-DD')# - That is it
J Harvey
//--->
<cfscript>
function LastDayofTheYear()
	{
	  Var TheYear=Year(Now());
	  if(ArrayLen(Arguments)) 
	    TheYear = Arguments[1];
	  return CreateDate(TheYear,12,31);
	}
</cfscript>	