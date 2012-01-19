// Steven Benjamin  1/18/2012.
// a plain jQuery accordian utility.


function doHeaderClickEvent(headerId){
	getTasksByImportanceId(headerId)
};

function doAccordianSlide(ui){
	//diagnostics.
	if(displayConsole || debugAccordian){console.info('doAccordianSlide: ',ui)};
	
	//overlaod this function to accept integers.
	
	if(typeof(ui) === 'number'){
		var targetName;
		switch(ui)
		{
		case 0:
		  targetName = "priority";
		  break;
		case 1:
		   targetName = "normal";
		  break;
		case 2:
		   targetName = "someday";
		  break; 
		};
	}
	else{ // an object was passed in.
		var targetName = ui.currentTarget.id.split('Header')[0];
	};


	
	// get a collection of all the task bodies.
	var allTaskBodyDivs = jQuery(".taskBody");
	
	//get a reference to the body of the taskHeader that was clicked.
	
	var targetBody = targetName+'Body';
	
	//cache the loop until parameter for performance.
	var loopMax = allTaskBodyDivs.length;
	
	//remove active css class from all headers.
	jQuery(".taskHeader").removeClass("headerHighLight");
	jQuery("#"+targetName+"Header").addClass("headerHighLight");
	//loop over the collection of taskBodies.
	var accordianAction = false;
	for(var i=0; i<loopMax; i++){
		//if we find the body that is expanded (display:block) then close that body and expand the target body asynchronously.
		if(jQuery(allTaskBodyDivs[i]).css("display") === 'block'){
			if(!isPanelActive(allTaskBodyDivs[i],targetName)){ //Only move according if user clicked on the header of an inactive panel.
				jQuery(allTaskBodyDivs[i]).slideUp(500);
				jQuery("#"+targetBody).slideDown(500);	
				accordianAction = true;
				break;
			}; //if panel is not active.
		}; //if a panel is open.
	};//loop
	
	
	//check if none of the panels where opened when we started.
	//in which case, just slide open the body of the panel that was clicked.
	if(!accordianAction){
		jQuery("#"+targetBody).slideDown(500);	
	};


}; //doAccordianSlide()

//this function is used to prevent the accordian from sliding when the header of an active panel is click again.
function isPanelActive(body,headerName){
	if(displayConsole || debugAccordian){console.info('isPanelActive: ',body.id.split('Body')[0],headerName)};
	var bodyName = body.id.split('Body')[0];
	if(bodyName === headerName){
		return true;
	}
	else{
		return false;
	};
};

function clearPanelById(impId){
	var targetDiv = getPanelNameById(impId);
	targetDiv.html('');
};


function getPanelNameById(ImpId){
	var targetDiv = false;
	switch(ImpId)
	{
		case 0:
		  targetDiv = jQuery("#priorityBody");
		  break;
		case 1:
		   targetDiv = jQuery("#normalBody");
		  break;
		case 2:
		   targetDiv = jQuery("#somedayBody");
		  break; 
	};
	
	return targetDiv;
};
