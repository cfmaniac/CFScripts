<!---\\ Runs a Query - Shorthand
Easy Usage: runQry(SQL) - That is it
J Harvey
//--->
<cfscript>
   function runQry(sql){
   Qry = new Query(); 
   Qry.setDataSource(sitewide_datasource);
   Qry.setSQL(sql);
   if(Left(trim(sql), 6)=='INSERT'){
      try {return Qry.Execute().getPrefix().generatedkey; /*returns generated key */}
      catch(any e){return 0;}
   }else{
      return Qry.Execute().getResult(); 
   }
}
</cfscript>