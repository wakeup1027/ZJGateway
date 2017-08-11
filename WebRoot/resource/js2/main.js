function wlCommonInit(){


}

function login(){
	var name = $("#user").val();
	var pass = $("#password").val();	
		cordova.exec(loginSuccess, loginFailure, "ZCMobiPlugin", "login", [name,pass]);		
}

function loginSuccess(data){
	// WL.Logger.debug(data);
	$.mobile.changePage("home.html", {
		transition : "slide"
	});

}

function loginFailure(data){
   
	alert("你的用户名和密码错误！");
}



function getMyAuditList(){

	
		cordova.exec(getMyAuditListSuccess, getMyAuditListFailure, "ZCMobiPlugin", "getMyAuditList", []);	
	
}

function getMyAuditListSuccess(data){
	
	document.getElementById("num1").innerHTML="待办("+data.data.length+")";
	var html = "";
	for(var i=0;i<data.data.length;i++){
	 var test = data.data[i].process_name ;
	 var test2 = encodeURIComponent(test) ;
	 console.log(test2);
		html += '<li class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-first-child ui-btn-up-c" data-theme="c" data-iconpos="right" data-icon="false" data-wrapperels="div" data-iconshadow="true" data-shadow="false" data-corners="false"><div class="ui-btn-inner ui-li"><div class="ui-btn-text">';
		html += '<a class="ui-link-inherit" href="loadData.html?id='+data.data[i].docid+'&name='+test2+'" data-ajax="false">';
		html += '<h4 class="ui-li-heading">'+ data.data[i].process_name +'</h4> <p class="ui-li-desc">';
		html += data.data[i].create_time +'</p> </a></div></div></li>';
		
	}
	$("#thelist_xietong").html(html);
	 
}

function getMyAuditListFailure(data){
	// WL.Logger.debug("Failure:");
	alert("你没有要审核的数据");
}




function getMyCreatedList(){

	
		cordova.exec(getMyCreatedListSuccess, getMyCreatedListFailure, "ZCMobiPlugin", "getMyCreatedList", []);	
	
}

function getMyCreatedListSuccess(data){
	var html = "";
	for(var i=0;i<data.data.length;i++){
	 var test = data.data[i].process_name ;
	 var test2 = encodeURIComponent(test) ;
	 console.log(test2);
		html += '<li class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-first-child ui-btn-up-c" data-theme="c" data-iconpos="right" data-icon="false" data-wrapperels="div" data-iconshadow="true" data-shadow="false" data-corners="false"><div class="ui-btn-inner ui-li"><div class="ui-btn-text">';
		html += '<a class="ui-link-inherit" href="loadData.html?id='+data.data[i].docid+'&name='+test2+'" data-ajax="false">';
		html += '<h4 class="ui-li-heading">'+ data.data[i].process_name +'</h4> <p class="ui-li-desc">';
		html += data.data[i].create_time +'</p> </a></div></div></li>';
	}
	$("#thelist_myCreated").html(html);
}

function getMyCreatedListFailure(data){
   alert("没有你创建的用户");
   
}



function getMainDocDetails(docid){
    //var name = $("#NameInput").val();
	//var pass = $("#password").val();
	
		cordova.exec(getMainDocDetailsSuccess, getMainDocDetailsFailure, "ZCMobiPlugin", "getMainDocDetails", [docid]);	
	
}

function getMainDocDetailsSuccess(data){
	var html = "";
	  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.INITIATOROS.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.INITIATOROS.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.UserDept.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.UserDept.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.ACTIVITYOS.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.ACTIVITYOS.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.ActivityOwnerOS.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.ActivityOwnerOS.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.INSTANCEOS.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.INSTANCEOS.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.ContactPhone.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.ContactPhone.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.JobStartedOS.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.JobStartedOS.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.head1.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.head1.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.mydept.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.mydept.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.AppType.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.AppType.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.AppUnit.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.AppUnit.value+'</h5></div>';
  html+='<div class="ui-block-a" style="border:1px solid black;height: 65px;width: 20%;background-color: aliceblue;"><h5>'+data.data.BuyIdea.name+'</h5></div>';
  html+='<div class="ui-block-b" style="border:1px solid black;height: 65px;width: 80%;"><h5>'+data.data.BuyIdea.value+'</h5></div>';
  
		$("#table").html(html);
}

function getMainDocDetailsFailure(data){
	WL.SimpleDialog.show(
		"Response from plug-in", data, 
		[{text: "OK", handler: function() {WL.Logger.debug("Ok button pressed");}
		}]
	);
}



function getApprovalOptions(docid){
	//var name = $("#NameInput").val();
	//var pass = $("#password").val();
	
		cordova.exec(getApprovalOptionsSuccess, getApprovalOptionsFailure, "ZCMobiPlugin", "getApprovalOptions", [docid]);	
	
}

function getApprovalOptionsSuccess(data){

}

function getApprovalOptionsFailure(data){
	
}


function setApprovalOption(docid,appopt){
	//var name = $("#NameInput").val();
	//var pass = $("#password").val();
	
		cordova.exec(setApprovalOptionSuccess, setApprovalOptionFailure, "ZCMobiPlugin", "setApprovalOption", [docid,appopt]);	
	
}

function setApprovalOptionSuccess(data){
	alert(data);
}

function setApprovalOptionFailure(data){
	WL.SimpleDialog.show(
		"Response from plug-in", data, 
		[{text: "OK", handler: function() {WL.Logger.debug("Ok button pressed");}
		}]
	);
}



function claimJob(docid){
//	var name = $("#NameInput").val();
//	var pass = $("#password").val();
	
		cordova.exec(claimJobSuccess, claimJobFailure, "ZCMobiPlugin", "claimJob", [docid]);	
	
}

function claimJobSuccess(data){
	alert(data);
}

function claimJobFailure(data){
	WL.SimpleDialog.show(
		"Response from plug-in", data, 
		[{text: "OK", handler: function() {WL.Logger.debug("Ok button pressed");}
		}]
	);
}


function submitJob(docid,comment){
	//var name = $("#NameInput").val();
	//var pass = $("#password").val();
	
		cordova.exec(submitJobSuccess, submitJobFailure, "ZCMobiPlugin", "submitJob", [docid,comment]);	
	
}

function submitJobSuccess(data){
	alert(data);
}

function submitJobFailure(data){
	alert("提交没有成功");
}





