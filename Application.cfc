<CFCOMPONENT OUTPUT="NO">

	<cfparam name="url.appReInit" default="0">
	<CFSET THIS.name = "doctorX">
	<CFSET THIS.sessionManagement = "Yes">
	<cfif url.appReInit EQ 1>
		<CFSET THIS.applicationTimeOut = "#createTimeSpan(0,0,0,0)#">
		<CFSET THIS.sessionTimeout = "#createTimeSpan(0,0,0,0)#">
	<cfelse>
		<CFSET THIS.applicationTimeOut = "#createTimeSpan(1,0,0,0)#">
		<CFSET THIS.sessionTimeout = "#createTimeSpan(0,1,0,0)#">
	</cfif>
	<CFSET THIS.loginStorage = "Session">	
	<cfsetting showdebugoutput="No">
	
	

<!--- APPLICATION METHODS --->
	<CFFUNCTION NAME="onApplicationStart" RETURNTYPE="BOOLEAN" OUTPUT="NO">
		<cfset var AESkey="H8kGbBFk9ppXPBpmzb1DZg==">
		<cffile action="READ" file="#expandPath('doctorXDevConfig.txt')#" variable="configValues">
		<cfset application.config = DeserializeJSON(variables.configValues)>
		
		<cfset application.adminEmail = Decrypt(application.config.adminEmails[1],AESkey,"AES")>
		<cfset application.errorEmail = arrayToList(application.config.errorEmails)>
	
		
		<!--- DIAGNOSTICS --->
		<!---
		<cfdump var="#application.config#">
		<cfabort>
		--->

		<CFRETURN TRUE>
	</CFFUNCTION>
	
	<CFFUNCTION NAME="onApplicationEnd" RETURNTYPE="VOID" OUTPUT="NO">
		
	</CFFUNCTION>
<!---/ APPLICATION METHODS --->	
	

<!--- SESSION METHODS --->	
	<CFFUNCTION NAME="onSessionStart" RETURNTYPE="BOOLEAN" OUTPUT="NO">
		<cfset session.cfcToken = randRange(10000,1000000)>
		<CFRETURN TRUE>
	</CFFUNCTION>

	<CFFUNCTION NAME="onSessionEnd" RETURNTYPE="VOID" OUTPUT="NO">
		
	</CFFUNCTION>
<!---/ SESSION METHODS --->


<!--- REQUEST METHODS --->
	<CFFUNCTION NAME="onRequestStart" RETURNTYPE="BOOLEAN" OUTPUT="NO">
				
			
		<CFRETURN TRUE>
	</CFFUNCTION>
		
	<CFFUNCTION NAME="onRequestEnd" RETURNTYPE="VOID" OUTPUT="NO">
		<!--- Close the request  for scriptWriter.--->

	
	</CFFUNCTION>
<!---/ REQUEST METHODS --->
	
	
	
	
	<cffunction name="onError" returntype="any" output="yes">	
		<CFARGUMENT NAME="exception" REQUIRED="true">		
		
				
		<!--- show the error --->
		<cfif application.config.showError EQ true OR (isDefined("url.error") AND url.error EQ "show")>
			<cfoutput>#arguments.exception#</cfoutput>
			<br/>
			<cfdump var="#arguments#">
			<br/>
			<cfdump var="#session#">
			<cfdump var="#cookie#">
			<cfdump var="#cgi#">
		<cfelse>
			<cflocation url="http://#CGI.SERVER_NAME#/index.cfm?" addtoken="no">
		</cfif>

		<CFRETURN true>
	</cffunction>
	
	<cffunction name="onMissingTemplate" returntype="any" output="yes">
		Missing TEMPLATE:
	</cffunction>
	

</CFCOMPONENT>