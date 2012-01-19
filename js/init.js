//init.js Steven Benjamin 1/18/2012

function init(){

	console.info('INIT');
	//debug settings:
	//if(displayConsole
	displayConsole = false; //all debugging
	debugAccordian = false;
	clearForm();


	//instanciate click listeners.
	jQuery("#priorityHeader").click(function(){doHeaderClickEvent(0)});
	jQuery("#normalHeader").click(function(){doHeaderClickEvent(1)});
	jQuery("#somedayHeader").click(function(){doHeaderClickEvent(2)});
	jQuery("#submitForm").click(function(){doFormSubmit()});
	jQuery("#newTask").click(function(){clearForm()});
}; //init

