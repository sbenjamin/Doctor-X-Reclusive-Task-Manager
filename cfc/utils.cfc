<cfcomponent>
	<cffunction name="jsonSecurity" access="private" returntype="any" returnFormat="json">
		<cfargument name="cfctoken" required="no" default=0>
		<cfset var result = false>
		<cfif arguments.cfctoken EQ session.cfctoken>
			<cfset result = true>
		</cfif>
		
		<cfreturn result>
	</cffunction>	
	
		<!--- make sure the request is coming from our website. --->
	<cffunction name="checkHost" access="remote" output="no" returntype="boolean">
		<cfset var thisRequest = GetHttpRequestData()>
		<cfif ListFindNoCase(application.hostList,thisRequest.headers.Host)>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>


<cffunction name="qry2json" access="public" returntype="any" output="Yes">
        <cfargument name="querySet" type="query" required="yes">
        <cfargument name="convertLineBreaksForJSON" default="false" required="no">
		<cfargument name="escSpecChar" default="false" required="no">
        <cfargument name="startRow" required="no" default="1">
        <cfargument name="endRow" required="yes" default="#arguments.querySet.recordCount#">
		<cfargument name="lcase" type="boolean" default="false">
		<cfargument name="additionalAttributes" type="struct">
        
        <cfset returnedRecordCount = (arguments.endRow-arguments.startRow)+1>
        <cfset  result = structNew()>
		
		<!--- if the querySet is not empty --->
        <cfif querySet.recordCount GT 0>
		<!--- Create an "ROWS" Array to hold the row objects --->
		<cfset ROWS = arrayNew(1)>
				<!---loop through each row in the record set--->
                <cfloop query="querySet" startrow="#arguments.startRow#" endrow="#arguments.endRow#">
					<!--- create an object for each row --->
					<cfset jsonObjItem = structNew()>
					<!--- loop for each column in the datasset --->
                    <cfloop index="columnName" list="#querySet.columnList#" delimiters=",">
						<cfset var thisValueItem = evaluate("querySet."&columnName)>
						<cfif arguments.escSpecChar>
							<cfset thisValueItem = cleanStringForJSON(thisValueItem)>
						</cfif>
						
						<!--- Handle Line Breaks in the value item --->
						<cfif convertLineBreaksForJSON EQ false>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItem,"#chr(13)##chr(10)#","<br>","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(13),"<br>","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(10),"<br>","all")>        
			            <cfelse>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItem,"#chr(13)##chr(10)#","\n\r","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(13),"\n","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(10),"\r","all")>
			            </cfif>
						
						<!---populate the object with a name:value pair for each column --->
						<cfif arguments.lcase EQ true>
							<cfset jsonObjItem["#lcase(columnName)#"] = thisValueItemLB>
						<cfelse>
							<cfset jsonObjItem["#columnName#"] = thisValueItemLB>
						</cfif>
						
						<!--- add the object to the ROWS array --->
						<cfset ROWS[querySet.currentRow] = jsonObjItem>
                    </cfloop>  
            	</cfloop>
				
			<cfset result.ROWS = ROWS>
			<cfset result.DATASET = INT(variables.returnedRecordCount)>
			<cfset result.RECORDSET = querySet.recordCount> 
			<cfset result["success"] = true>
			<!--- loop over the additionalAttributes and add them to the JSON packet. --->
			<cfif isDefined("additionalAttributes")>
				<cfloop collection="#additionalAttributes#" item="attrItem">
					<cfset result["#attrItem#"] = Evaluate("additionalAttributes.#attrItem#")>
				</cfloop>
			</cfif>
			
			
        <cfelse>
			<!--- no reocrds found --->
			<cfset result.ROWS = arrayNew(1)>
			<cfset result.DATASET = 0> 
			<cfset result.RECORDSET = querySet.recordCount> 
			<cfset result["success"] = false>
			<cfset result["msg"] = "No records found">
        </cfif>
            
       <cfreturn result>
    </cffunction>
    
    <!--- cleanStringForJSON--->    
    <cffunction name="cleanStringForJSON" access="private" returntype="any" output="No" >
        <cfargument name="rawString" required="Yes" type="string">
    	
		<cfset var specialCharList = "*,-,+">	
		<cfloop index="specChar" list="#specialCharList#">
			<cfset arguments.rawString = replaceNoCase(arguments.rawString,specChar," "&specChar,"all")>
		</cfloop>
	
        <cfreturn arguments.rawString>
    </cffunction>
</cfcomponent>		