This Code should go in your Application.cfc:
<cfscript>
/* ORM HIBERNATE */
	setOrm(schema='dbo', catalog='Procare', cfcLocation='models', datasource='Procare');
/* end: ORM HIBERNATE - SEE Function BELOW */

//I Create and Set the ORM Config
    public any function setOrm() {
    if(!structKeyExists(this, "ormSettings"))
				this.ormSettings = structNew();

			if(structKeyExists(arguments, "datasource"))
				this.ormSettings.datasource = arguments.datasource;

			if(structKeyExists(arguments, "catalog"))
				this.ormSettings.catalog = arguments.catalog;

			if(structKeyExists(arguments, "schema"))
				this.ormSettings.schema = arguments.schema;

			if(structKeyExists(arguments, "dbcreate"))
				this.ormSettings.dbCreate = arguments.dbcreate;

			if(structKeyExists(arguments, "cfcLocation"))
			{
				if(structKeyExists(this.ormSettings, "cfcLocation") AND isSimpleValue(this.ormSettings.cfcLocation))
					this.ormSettings.cfcLocation = [this.ormSettings.cfcLocation];//any existing string definition needs to start array

				if(!structKeyExists(this.ormSettings, "cfcLocation"))
					this.ormSettings.cfcLocation=[];

				arrayAppend(this.ormSettings.cfcLocation, arguments.cfcLocation);//append the set argument
			}

			if(structKeyExists(arguments, "logSQL") AND arguments.logSQL)
				this.ormSettings.logSQL = true;

			this.ormEnabled = true;

			return this;
     
	 }
</cfscript>