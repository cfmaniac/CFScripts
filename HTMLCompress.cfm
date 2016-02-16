<cfscript>
function HtmlCompressFormat(sInput)
{
   var level = 2;
   if( arrayLen( arguments ) GTE 2 AND isNumeric(arguments[2]))
   {
      level = arguments[2];
   }
   // just take off the useless stuff
   sInput = trim(sInput);
   switch(level)
   {
      case "3":
      {
         //   extra compression can screw up a few little pieces of HTML, doh         
         sInput = reReplace( sInput, "[[:space:]]{2,}", " ", "all" );
         sInput = replace( sInput, "> <", "><", "all" );
         sInput = reReplace( sInput, "<!--[^>]+>", "", "all" );
         break;
      }
      case "2":
      {
         sInput = reReplace( sInput, "[[:space:]]{2,}", chr( 13 ), "all" );
         break;
      }
      case "1":
      {
         // only compresses after a line break
         sInput = reReplace( sInput, "(" & chr( 10 ) & "|" & chr( 13 ) & ")+[[:space:]]{2,}", chr( 13 ), "all" );
         break;
      }
   }
   return sInput;
}
</cfscript>

How to Use:
<cfoutput>
<cfsavecontent variable="html">
<table cellspacing="2" cellpadding="2" border="0">
<tr>
    <td colspan="2">
        <b>Table Title</b>
    </td>
</tr>
<tr>
    <td>
        Column 1
    </td>
    <td>
        Column 2
    </td>
</tr>
</table>
</cfsavecontent>
<b>Before:</b><br>
  #HtmlCodeFormat(html)#
<p>
<b>After:</b><br>
 #HtmlCodeFormat(htmlCompressFormat(html, 2))#

</cfoutput>