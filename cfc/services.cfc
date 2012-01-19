<cfcomponent extends="utils" hint="service layer">

	<!--- template function --->
	<cffunction name="xxx" access="remote" returntype="any" returnformat="json" output="no">
		<cfargument name="cfcToken" type="numeric" default="0">
		
		<cfset var result = structNew()>
		<cfset result["success"] = false>
		
		<cfif jsonSecurity(arguments.cfcToken)>
			<cfset result["success"] = false>
		</cfif>
	
	</cffunction>
	
	
	<cffunction name="getTasksByImpId" access="remote" returntype="any" returnformat="json" output="no">
		<cfargument name="cfcToken" type="numeric" default="0">
		<cfargument name="impId" type="numeric" required="yes">
		
		<cfset var result = structNew()>
		<cfset result["success"] = false>
		<!--- development use only --->
		<cfset result["cfcToken"] = session.cfcToken>
		
		<cfif jsonSecurity(arguments.cfcToken)>
			<cfquery name="getTasks" datasource="#application.config.dsn#">
				SELECT
				`tbl_Tasks`.`idTask` taskId,
				`tbl_Tasks`.`taskName`
				FROM `tbl_Tasks`
				WHERE `tbl_Tasks`.`taskImportance` = #arguments.impId#
				ORDER BY dateCreated desc;
			</cfquery>
			<cfreturn qry2json(querySet=getTasks,lcase=true)>
		</cfif>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="getTasksDetailsById" access="remote" returntype="any" returnformat="json" output="no">
		<cfargument name="cfcToken" type="numeric" default="0">
		<cfargument name="taskId" type="numeric" required="yes">
		
		<cfset var result = structNew()>
		<cfset result["success"] = false>
		<!--- development use only --->
		<cfset result["cfcToken"] = session.cfcToken>
		
		<cfif jsonSecurity(arguments.cfcToken)>
			<cfquery name="getTaskDetails" datasource="#application.config.dsn#">
				SELECT
				`tbl_Tasks`.`idTask`,
				`tbl_Tasks`.`taskImportance`,
				`tbl_Tasks`.`taskType`,
				`tbl_Tasks`.`taskName`,
				`tbl_Tasks`.`taskDetails`,
				`tbl_Tasks`.`dateCreated`,
				`tbl_Tasks`.`lastUpdated`
				FROM `tbl_Tasks`
				WHERE `tbl_Tasks`.`idTask` = #arguments.taskId#;
			</cfquery>
			<cfreturn qry2json(querySet=getTaskDetails,lcase=true)>
		</cfif>
		<cfreturn result>
	</cffunction>
	
	
	<cffunction name="updateInsertTask" access="remote" returntype="any" returnformat="json" output="no">
		<cfargument name="cfcToken" type="numeric" default="0">
		<cfargument name="taskId" type="numeric" required="yes">
		<cfargument name="taskName" type="string" required="yes">
		<cfargument name="taskDetails" type="string" required="yes">
		<cfargument name="taskType" type="numeric" required="yes">
		<cfargument name="taskImprt" type="numeric" required="yes">

		
		<cfset var result = structNew()>
		<cfset result["success"] = false>
		<!--- development use only --->
		<cfset result["cfcToken"] = session.cfcToken>
		
		<cfif jsonSecurity(arguments.cfcToken)>
		
			<!--- update existing task --->
			<cfif arguments.taskId NEQ 0>
				<cfquery name="updTaskDetails" datasource="#application.config.dsn#">
					UPDATE `tbl_Tasks`
					SET
					`taskImportance` = <cfqueryparam value="#arguments.taskImprt#" cfsqltype="CF_SQL_TINYINT">,
					`taskType` = <cfqueryparam value="#arguments.taskType#" cfsqltype="CF_SQL_TINYINT">,
					`taskName` = <cfqueryparam value="#MID(arguments.taskname,1,100)#" cfsqltype="CF_SQL_VARCHAR">,
					`taskDetails` = <cfqueryparam value="#MID(arguments.taskDetails,1,500)#" cfsqltype="CF_SQL_VARCHAR">,
					`lastUpdated` = <cfqueryparam value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">
					WHERE `idTask` = #arguments.taskId#;
				</cfquery>
				
				<cfset result["success"] = true>
				<cfset result["action"] = "update">
			</cfif>	
			
			<!--- insert Task --->
			<cfif arguments.taskId EQ 0>
				<cfquery name="insTaskDetails" datasource="#application.config.dsn#">
					INSERT INTO `doctorx`.`tbl_Tasks`
						(
						`taskImportance`,
						`taskType`,
						`taskName`,
						`taskDetails`)
						VALUES
						(
						<cfqueryparam value="#arguments.taskImprt#" cfsqltype="CF_SQL_TINYINT">,
						<cfqueryparam value="#arguments.taskType#" cfsqltype="CF_SQL_TINYINT">,
						<cfqueryparam value="#MID(arguments.taskname,1,100)#" cfsqltype="CF_SQL_VARCHAR">,
						<cfqueryparam value="#MID(arguments.taskDetails,1,500)#" cfsqltype="CF_SQL_VARCHAR">
						);

				</cfquery>
				<cfset result["success"] = true>
				<cfset result["action"] = "insert">
			</cfif>	

		</cfif>
		<cfreturn result>
	</cffunction>


</cfcomponent>


