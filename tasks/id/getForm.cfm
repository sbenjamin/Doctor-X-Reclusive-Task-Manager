<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

	<cfparam name="taskId" default=0>
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
			WHERE `tbl_Tasks`.`idTask` = #VAL(url.taskId)#;
		</cfquery>


<html>
<head>
	<title>Get Editing Form</title>
	<link rel="STYLESHEET" type="text/css" href="../../css/home.css">
	<link rel="STYLESHEET" type="text/css" href="../../css/style.css">
</head>

<body>

<cfoutput>
	<div class="formWrapper">
		<div class="formRow">
			<div class="formtTitle">Name:</div>
			<div class="formElement"><input type="text" id="taskName_input" class="formElements" value="#getTaskDetails.taskName#"></div>
		</div>
		<div class="formRow">
			<div class="formtTitle">Details:</div>
			<div class="formElement"><textarea cols="" rows="" id="taskDetail_input" class="formElements">#getTaskDetails.taskDetails#</textarea></div>
		</div>
		<div class="formRow">
			<div class="taskTypeWrapper">
				<div class="formRadio"><input type="radio" name="taskType" id="Social" value="0" <cfif getTaskDetails.taskType EQ 0>checked</cfif>> <label for="Social">Social</label></div>
				<div class="formRadio"><input type="radio" name="taskType" id="business" value="1" <cfif getTaskDetails.taskType EQ 1>checked</cfif>> <label for="business">business</label></div>
			</div>
			<div class="taskImportWrapper">
				<div class="formRadio"><input type="radio" name="taskImportance" id="priority" value="0" <cfif getTaskDetails.taskImportance EQ 0>checked</cfif>> <label for="priority">Priority</label></div>
				<div class="formRadio"><input type="radio" name="taskImportance" id="normal" value="1" <cfif getTaskDetails.taskImportance EQ 1>checked</cfif>> <label for="normal">Normal</label></div>
				<div class="formRadio"><input type="radio" name="taskImportance" id="someday" value="2" <cfif getTaskDetails.taskImportance EQ 2>checked</cfif>> <label for="someday">Someday...</label></div>
			</div>
			<div class="helpIcon" onclick="alert('Help Menu:\nComing Soon.');">
				<img src="../../img/helpIcon.jpg" alt="help" width="30" height="30" border="0">
			</div>
			<div class="submitFormWrapper">
				[ <span class="submitForm" id="submitForm">Submit</span> ]
			</div>
		</div>
	</div>
</cfoutput>
</body>
</html>


