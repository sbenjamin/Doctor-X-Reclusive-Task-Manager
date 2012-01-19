<cfcomponent>
	<cffunction name="updateTaskById" access="remote" returntype="any" returnformat="json" output="no">
		<cfargument name="taskId" type="numeric" required="yes">
		<cfargument name="name" type="string" required="no" default="">
		<cfargument name="details" type="string" required="no" default="">
		<cfargument name="status" type="any" required="no" default="">
		<cfargument name="type" type="any" required="no" default="">
	

	

			<cfquery name="updTaskDetails" datasource="#application.config.dsn#">
				
				<cfif arguments.status NEQ "">
					UPDATE `tbl_Tasks` SET
					`taskImportance` = <cfqueryparam value="#arguments.status#" cfsqltype="CF_SQL_TINYINT">,
					`lastUpdated` = <cfqueryparam value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">
					WHERE `idTask` = #VAL(arguments.taskId)#;
				<cfelseif arguments.type NEQ "">	
					UPDATE `tbl_Tasks` SET
					`taskType` = <cfqueryparam value="#arguments.type#" cfsqltype="CF_SQL_TINYINT">,
					`lastUpdated` = <cfqueryparam value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">
					WHERE `idTask` = #VAL(arguments.taskId)#;
				<cfelseif arguments.name NEQ "">	
					UPDATE `tbl_Tasks` SET
				`taskName` = <cfqueryparam value="#MID(arguments.name,1,100)#" cfsqltype="CF_SQL_VARCHAR">,
				`lastUpdated` = <cfqueryparam value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">
				WHERE `idTask` = #VAL(arguments.taskId)#;
				<cfelseif arguments.details NEQ "">	
					UPDATE `tbl_Tasks` SET
					`taskDetails` = <cfqueryparam value="#MID(arguments.details,1,500)#" cfsqltype="CF_SQL_VARCHAR">,
					`lastUpdated` = <cfqueryparam value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">
					WHERE `idTask` = #VAL(arguments.taskId)#;
				<cfelse>
					SELECT idTask
					FROM tbl_Tasks
					WHERE 1 = 2;
				</cfif>	
				
			</cfquery>
			

	</cffunction>
</cfcomponent>		