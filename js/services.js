function getTasksByImportanceId(impId){
		
	if(typeof(impId) != 'number'){
		return false;
	};
	
	var targetDiv = getPanelNameById(impId);
	
	jQuery.ajax({
 		url		: globals.serviceAPI,
		type	: 'GET',
		data	: {
					cfcToken : globals.cfcToken,
					impId	 : impId,
					method	 : 'getTasksByImpId'
				  },
		dataType: 'json',
 		success	: function(data) {
				clearPanelById(impId);
				doAccordianSlide(impId);
				jQuery("#tmp_Tasks").tmpl(data.ROWS).appendTo(targetDiv);
 				}
	});
}; //getTasksByImportanceId


function getTasksDetailsById(taskId){
		
	if(typeof(taskId) != 'number'){
		return false;
	};
		
	jQuery.ajax({
 		url		: globals.serviceAPI,
		type	: 'GET',
		data	: {
					cfcToken : globals.cfcToken,
					taskId	 : taskId,
					method	 : 'getTasksDetailsById'
				  },
		dataType: 'json',
 		success	: function(data) {
				//update form.
				jQuery("#taskName_input").val(data.ROWS[0].taskname);
				jQuery("#taskDetail_input").val(data.ROWS[0].taskdetails);
				setTaskTypeForm(data.ROWS[0].tasktype);
				setTaskImportanceForm(data.ROWS[0].taskimportance);
				jQuery("#submitForm").html('Update');
				globals.taskId = data.ROWS[0].idtask;
 				}
	});
}; //getTasksDetailsById


function doFormSubmit(){
	jQuery.ajax({
 		url		: globals.serviceAPI,
		type	: 'GET',
		data	: {
					cfcToken 	: globals.cfcToken,
					taskId	 	: globals.taskId,
					taskName 	: jQuery("#taskName_input").val(),
					taskDetails : jQuery("#taskDetail_input").val(),
					taskType	: jQuery('input:radio[name=taskType]:checked').val(),
					taskImprt	: jQuery('input:radio[name=taskImportance]:checked').val(),
					method	 	: 'updateInsertTask'
				  },
		dataType: 'json',
 		success	: function(data) {
					var importId = parseInt(jQuery('input:radio[name=taskImportance]:checked').val());
					doHeaderClickEvent(importId);
 				}
	});
}; //doFormSubmit

