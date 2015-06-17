This Code should go in your Application.cfc:
<cfscript>
function onRequestStart() {

  //Creates an RC Scope from the Request Context;
  var rc = {};
  structAppend( rc, url );
  structAppend( rc, form ); 
  getPageContext( ).getFusionContext( ).hiddenScope.rc = rc;
  
  //Generates a Root BaseRef:
  rc.fullpath = getDirectoryFromPath(getCurrentTemplatePath());
  rc.root = listlast(rc.fullpath, "\/");
  rc.basehref = CGI.HTTPS eq "on" ? "https://" : "http://";
  rc.basehref &= CGI.HTTP_HOST&"/"&rc.root;
}  
</cfscript>