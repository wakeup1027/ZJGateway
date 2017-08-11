/*!
 * 之前的那个public/js/popbox.js对其它js（public/js/common/common.js）有依赖，
 * 因此在此重新定义一个无依赖性的popbox.js
 * （直接引入当前js和相应的css，即可调用showTreeBox方法）
 * @author wxw 2013.06.08
 */

/**
 * 弹出树形选择面板
 * @param {Object} url
 * @param {Object} el
 */
function showTreeBox(url, el){
	if(url.indexOf("?")==-1){
		url+="?rnd=1";
	}
	var ev = event || window.event;
	var obj = (el==null?ev.srcElement:el);
	var height     = 250;//obj.getAttribute("H");
	var width      = 300;//obj.getAttribute("W");
	var id         = obj.getAttribute("id");
	var returnName = obj.getAttribute("returnName");
	var returnId   = obj.getAttribute("returnId");
	if(!isEmpty(returnName)){
		url+="&returnName="+returnName;
	}
	if(!isEmpty(returnId)){
		url+="&returnId="+returnId;
	}
	fPopBox(ev,obj,1,url,width,height,'buttom',0,id+"_Event");
}

/**
 * 弹出树形选择面板（使用数据字典生成树）
 * @param {Object} url
 * @param {Object} el
 */
function showTreeBoxComponent(path, el, language){
	if(language==null || language==""){
	  language = "zh"
	}
	 var url = path+"/"+language+"/component/component-treebox.jsp?r=1";
	 var ev = event || window.event; 
	 var obj = (el==null?ev.srcElement:el);  
	 var dictData =   obj.getAttribute("dictData");	 
	 var returnName = obj.getAttribute("returnName");
	 var returnId   = obj.getAttribute("returnId");
     var whereCls   = obj.getAttribute("whereCls");	 
     var id         = obj.getAttribute("id");
     var param      = obj.getAttribute("param");
     var ntype      = obj.getAttribute("ntype");     
     var disabledIds= obj.getAttribute("disabledIds");
     var height     = isEmpty(obj.getAttribute("H"))==true?250:obj.getAttribute("H");
	 var width      = isEmpty(obj.getAttribute("W"))==true?300:obj.getAttribute("W");	 
	 if(!isEmpty(returnName)){url+="&returnName="+returnName;}
	 if(!isEmpty(returnId)){url+="&returnId="+returnId;}
	 if(!isEmpty(dictData)){url+="&dictData="+dictData;}
	 if(!isEmpty(whereCls)){url+="&whereCls="+whereCls;}
	 if(!isEmpty(param)){url+="&param="+param;}
	 if(!isEmpty(ntype)){url+="&ntype="+ntype;}
	 if(!isEmpty(disabledIds)){url+="&disabledIds="+disabledIds;}
	 fPopBox(ev,obj,1,url,width,height,'buttom',0,id+"_Event");
}


function getObj(d) {
	var obj=document.getElementById(d);
	if(obj) return obj;
}
	
//获取触发对象的位置坐标
function fGetXY(aTag){
	var oTmp=aTag;
	var pt=new Point(0,0);
	do{
		pt.x+=oTmp.offsetLeft;
		pt.y+=oTmp.offsetTop;
		oTmp=oTmp.offsetParent;
		
		if(oTmp==null){break;}
		if(oTmp.tagName.toUpperCase()=="HTML") {break};
	}while(oTmp.tagName.toUpperCase()!="BODY");
	return pt;
}

//触发函数
//evt:触发的事件
//obj:触发事件的对象
//ctype:弹出的类型,0为字符串,1为iframe
//str:当ctype为0时，str为字符串;当ctype为1时，str为网址
//DivPosition:相对于对象的位置,left,right,top,bottom
//offset:弹出窗体的偏移量
function fPopBox(evt,obj,ctype,str,DivWidth,DivHeight,DivPosition,DivOffset,eventName){	
	evt.cancelBubble=true;
	try{
		if(eventName!=null && ""!=eventName){
		 var pn =eventName.substring(0,eventName.indexOf('_Event'));
		 var pn_en="preparePopEvent" ;//testfun();
		 if(testfun(pn_en)==true){
			 if(eval(pn_en+"('"+pn+"')")==false){
				 return false;
			 }
		 }
		}
	}catch(e){}	
	
	var point=fGetXY(obj);   //获取触发对象的位置坐标
	with(getObj("popBoxDiv").style){   //设置弹出对象的style属性，默认居触发对象下方
		left=point.x+"px";
		if(DivOffset) {
			top=(point.y+obj.offsetHeight+DivOffset)+"px";
		}else{
			top=(point.y+obj.offsetHeight+1)+"px";
		}
		if(DivWidth) width=DivWidth+"px";
		if(DivHeight) height=DivHeight+"px";
		display='block';
		zIndex='999';
		position='absolute';
		
		if(DivPosition == 'left') {
			left=(point.x-DivWidth-DivOffset)+"px";
			top=point.y+"px";
		}else if(DivPosition == 'right') {
			left=(point.x+obj.offsetWidth+DivOffset)+"px";
			top=point.y+"px";
		}else if(DivPosition == 'top') {
			left=point.x+"px";
			top=(point.y-DivHeight-DivOffset)+"px";
		}
	}
	getObj("popBoxDiv").focus();
	if(ctype==0) {
		getObj("BoxDiv_Content").innerHTML = str;   //载入内容到弹出窗体
	}else{
		getObj("BoxDiv_Content").innerHTML = "<IFRAME id='Frame_BoxDiv' name='Frame_BoxDiv' width='100%' height='"+DivHeight+"' src='"+str+"' frameBorder=0  scrolling=no></IFRAME>"
	}
	
	if(parent.document.getElementById('Main_Show') && document.documentElement.scrollHeight) {
		parent.document.getElementById('Main_Show').height = document.documentElement.scrollHeight; //调整父窗口的高度,当盒子显示时用documentElement
	}
	var EN = getObj("popBoxDiv").getAttribute("eventName");
	if(EN!=null && ""!=EN){
		getObj("popBoxDiv").setAttribute("eventName","");
		if(testfun(EN)==true){
		   try{eval(EN+"();");}catch(e){}
		}
	}	
	if(eventName!=null){
		getObj("popBoxDiv").setAttribute("eventName",eventName);
	}
	
	
}
//测试有无方法定义2012.8.21 guwen
function testfun(fn){
	var tif = false;
	try{
	 tif = eval('typeof '+ fn+ "== 'function'");
	}catch(e){ tif= false;}
	return tif;
}

function fHideBoxDiv(){
	//fFocusBoxDiv();
	getObj("popBoxDiv").style.display="none";
	if(parent.document.getElementById('Main_Show') && document.body.scrollHeight) {
		parent.document.getElementById('Main_Show').height = document.body.scrollHeight; //调整父窗口的高度，当盒子隐藏时用body
	}
	var eventName = getObj("popBoxDiv").getAttribute("eventName");
	if(eventName!=null && ""!=eventName){
		getObj("popBoxDiv").setAttribute("eventName","");
		

		var pn =eventName.substring(0,eventName.indexOf('_Event'));
		var pn_en="popEvent('"+pn+"')";
		if(testfun("popEvent")==true){
			try{eval(pn_en);}catch(e){}				 
		}
		if(testfun(eventName)==true){
			try{eval(eventName+"();");}catch(e){}
		}	
				
	}
	getObj("BoxDiv_Content").innerHTML="";
}

function Point(iX,iY){this.x=iX;this.y=iY;}

//内容盒子的结构
function getBoxDiv(){
	var BoxDiv="";
	BoxDiv+="<div id='popBoxDiv' onclick='event.cancelBubble=true' style='position:absolute;z-index:999;display:none;'>";
	BoxDiv+="<table class='popBoxDiv_table' cellpadding='0' cellspacing='0' width='100%' border='0'>";
	BoxDiv+="<tr>";
	BoxDiv+="<td id=BoxDiv_Content></td>";
	BoxDiv+="</tr>";
	BoxDiv+="</table></div>";
	return BoxDiv;
}
with(document){  //设置文档的onclick事件，并把内容盒子代码写到页面
	onclick=fHideBoxDiv;
	write(getBoxDiv());
}

function isEmpty(vm){
	if(vm==null || vm=='undefine'){
		return true;
	}
	return false;
};


function __firefox(){
   
	HTMLElement.prototype.__defineGetter__("runtimeStyle", __element_style);
    window.constructor.prototype.__defineGetter__("event", __window_event);
    Event.prototype.__defineGetter__("srcElement", __event_srcElement);
}
function __element_style(){
    return this.style;
}
function __window_event(){
    return __window_event_constructor();
}
function __event_srcElement(){
    return this.target;
}
function __window_event_constructor(){
    if(document.all){
        return window.event;
    }
    var _caller = __window_event_constructor.caller;
    while(_caller!=null){
        var _argument = _caller.arguments[0];
        if(_argument){
            var _temp = _argument.constructor;
            if(_temp.toString().indexOf("Event")!=-1){
                return _argument;
            }
        }
        _caller = _caller.caller;
    }
    return null;
}

if(window.XMLHttpRequest){
	try{ __firefox();}catch(e){}
   
}

