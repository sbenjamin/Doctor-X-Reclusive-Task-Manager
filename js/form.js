
function clearForm(){
	jQuery("#taskName_input").val('');
	jQuery("#taskDetail_input").val('');
	setTaskTypeForm(0);
	setTaskImportanceForm(0);
	jQuery("#submitForm").html('Submit');
	globals.taskId = 0;
};

function setTaskTypeForm(typeId){
	switch(typeId)
	{
	case 0:
	  jQuery('#Social').prop('checked', true);
	  break;
	case 1:
	  jQuery('#business').prop('checked', true);
	  break;
	};
};

function setTaskImportanceForm(importId){
	switch(importId)
	{
	case 0:
	  jQuery('#priority').prop('checked', true);
	  break;
	case 1:
	  jQuery('#normal').prop('checked', true);
	  break;
	case 2:
	  jQuery('#someday').prop('checked', true);
	  break; 
	};
};