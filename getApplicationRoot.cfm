<cfscript>
public function getApplicationRootPath(){
	arguments.base_path = ExpandPath(arguments.base_path);
	arguments.actual_path = ExpandPath(arguments.base_path);
	
	if FileExists(ExpandPath(arguments.base_path & "Application.cfc")){
		return arguments.actual_path;

	} else if (REFind(".*[/\\].*[/\\].*", arguments.actual_path) ){
		return getApplicationRootPath("../#arguments.base_path#");
	
	} else {
		throw(message="Unable to determine Application Root Path" detail="#arguments.actual_path#");
	}

}
</cfscript>