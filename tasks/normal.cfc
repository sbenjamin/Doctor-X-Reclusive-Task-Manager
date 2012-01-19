<cfcomponent>
	<cffunction name="getTasksByImpId" access="remote" returntype="any" returnformat="json" output="no">
	
			<cfquery name="getTasks" datasource="#application.config.dsn#">
				SELECT
				`tbl_Tasks`.`idTask` taskId,
				`tbl_Tasks`.`taskName`
				FROM `tbl_Tasks`
				WHERE `tbl_Tasks`.`taskImportance` = 1
				ORDER BY dateCreated desc;
			</cfquery>
			
			<cfset var htmlAry = arrayNew(1)>
			<cfset var thisHTMLItem = "">
			<cfloop query="getTasks">
				<cfset thisHTMLItem = '<div id="normal_#getTasks.taskId#" class="link">#getTasks.taskName#</div>'>
				<cfset temp = ArrayAppend( htmlAry, thisHTMLItem )>
			</cfloop>
			
			<cfset var returnObj = structNew()>
			<cfset returnObj["name"] = "task.normal.success">
			<cfset returnObj["status"] = "success">
			<cfset returnObj["display"] = "true">
			<cfset returnObj["displayContents"] = htmlAry>
			
			<cfreturn returnObj>

	</cffunction>
</cfcomponent>		