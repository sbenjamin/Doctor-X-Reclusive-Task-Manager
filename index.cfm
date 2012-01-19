<!doctype html>

<!--- Steven Benjamin 1/18/2012.--->
<!--- steven@stevenbenjamin.com 480.399.4959--->

<!--- Resource: http://html5boilerplate.com/ --->

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<!--[if gte IE 9]>
  <style type="text/css">
    .gradient {
       filter: none;
    }
  </style>
<![endif]-->

-->-->

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title><cfoutput>#application.config.title#</cfoutput></title>
  <meta name="description" content="">
  <meta name="author" content="Steven Benjamin | steven@stevenbenjamin.com">
  <meta name="viewport" content="width=device-width,initial-scale=1">

  <!-- CSS concatenated and minified via ant build script (production only)-->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/home.css">
  
  <!-- end CSS-->

  <!--- removed because I don't know if Modernizr is permitted for this test. Steven Benjamin 1/18/2012--->
  <!--- <script src="js/libs/modernizr-2.0.6.min.js"></script> --->
  
  
</head>

<body>

  <div id="container">
    <header>

    </header>
    <div id="main" role="main">
		
	<div class="taskMgr">
		<div class="tasks">
			<!--- note: there is a dependency on the naming of xxxHeader and xxxBody --->
			<div class="taskHeader" id="priorityHeader">Priority Plans</div>
			<div class="taskBody" id="priorityBody"></div>
			
			<div class="taskHeader" id="normalHeader">Normal Plans</div>
			<div class="taskBody" id="normalBody"></div>
			
			<div class="taskHeader" id="somedayHeader">Someday</div>
			<div class="taskBody" id="somedayBody"></div>
		</div>
		<div class="details">
			<div class="detailsHeader gradientBG">
				<div style="float:left;">Planner Entry Info</div>
				<div class="newWrapper">[<span class="newTask" id="newTask">New</span>]</div>
			</div>
			<div class="formWrapper">
				<div class="formRow">
					<div class="formtTitle">Name:</div>
					<div class="formElement"><input type="text" id="taskName_input" class="formElements"></div>
				</div>
				<div class="formRow">
					<div class="formtTitle">Details:</div>
					<div class="formElement"><textarea cols="" rows="" id="taskDetail_input" class="formElements"></textarea></div>
				</div>
				<div class="formRow">
					<div class="taskTypeWrapper">
						<div class="formRadio"><input type="radio" name="taskType" id="Social" value="0"> <label for="Social">Social</label></div>
						<div class="formRadio"><input type="radio" name="taskType" id="business" value="1"> <label for="business">business</label></div>
					</div>
					<div class="taskImportWrapper">
						<div class="formRadio"><input type="radio" name="taskImportance" id="priority" value="0"> <label for="priority">Priority</label></div>
						<div class="formRadio"><input type="radio" name="taskImportance" id="normal" value="1"> <label for="normal">Normal</label></div>
						<div class="formRadio"><input type="radio" name="taskImportance" id="someday" value="2"> <label for="someday">Someday...</label></div>
					</div>
					<div class="helpIcon" onclick="alert('Help Menu:\nComing Soon.');">
						<img src="img/helpIcon.jpg" alt="help" width="30" height="30" border="0">
					</div>
					<div class="submitFormWrapper">
						[ <span class="submitForm" id="submitForm">Submit</span> ]
					</div>
					
				</div>
			</div>
			
		</div>
	</div>	
	
    </div>
    <footer>

    </footer>
  </div> <!--! end of #container -->


  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <!--- failover to our own copy of jQuery if the google CDN fails --->
  <script language="JavaScript">window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js"><\/script>')</script>
  <script src="js/libs/jquery.tmpl.min.js" type="text/javascript"></script>
 <script src="js/services.js" type="text/javascript"></script> 
  <script src="js/accordian.js" type="text/javascript"></script>
  
  <script src="js/utils.js" type="text/javascript"></script>
  <script src="js/init.js" type="text/javascript"></script>
  <script src="js/form.js" type="text/javascript"></script>
  <script id="tmp_Tasks" type="text/x-jQuery-tmpl">
	<div class="templateTaskName" onclick="getTasksDetailsById(${taskid})">
		${taskname}
	</div>	
  </script>
  
  <script language="JavaScript">
  	var globals = {};
	<cfoutput>
		globals.cfcToken = #session.cfcToken#;
		globals.serviceAPI = '#application.config.servicesAPI#';
		globals.taskId = 0;
	</cfoutput>
  	//end globals.
  
  	jQuery(document).ready(function(){
		init();
	}); //ready  
  </script>






  <!--[if lt IE 7 ]>
    <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
    <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
  <![endif]-->
  
</body>
</html>
