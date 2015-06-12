<cfscript>
public string function getWebPath(){
      arguments.url = "#getPageContext().getRequest().getRequestURI()#";
      arguments.ext = "\.(cfml?.*|html?.*|[^.]+)";
      
      var sPath = trim(arguments.url);
      var sEndDir = reFind("/[^/]+#arguments.ext#$", sPath);
      return left(sPath, sEndDir);
   }
</cfscript>