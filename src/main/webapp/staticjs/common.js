$(function(){ 
	 
    $(".button_box .b_02").click(function() {
        $(this).parent().siblings().find("input").val(null);
        $(this).parent().siblings().find("select").val("-1");
    });
    
    $(".reset_btn").click(function() {
        $(this).parent().siblings().find("input").val(null);
        $(this).parent().siblings().find("select").val("-1");
        $(".search_table").find("input").val(null);
        $(".search_table").find("select").val("-1");
    });

    //公共搜索栏添加回车搜索功能
    $(".input_box input[type='text']").bind("keyup",function(event){
        if(event.keyCode==13) {
            var id="";
             id=$(event.target).parentsUntil('.search').parent().attr("id");
            if(typeof(id)=='undefined'){
                id=$(event.target).parentsUntil('.bg_white').parent().attr("id");
            }
            $("#"+id+" .button_box a").first().click();
        }
    });
    $(".input_box input[type='checkbox']").bind("keyup",function(event){
        if(event.keyCode==13) {
            var id="";
             id=$(event.target).parentsUntil('.search').parent().attr("id");
            if(typeof(id)=='undefined'){
                id=$(event.target).parentsUntil('.bg_white').parent().attr("id");
            }
            $("#"+id+" .button_box a").first().click();
        }
    });
    $(".input_box select").bind("keyup",function(event){
        if(event.keyCode==13) {
            var id="";
             id=$(event.target).parentsUntil('.search').parent().attr("id");
            if(typeof(id)=='undefined'){
                id=$(event.target).parentsUntil('.bg_white').parent().attr("id");
            }
            $("#"+id+" .button_box a").first().click();
        }
    });
});


var formatNum = function(srcNumber) {
	var txtNumber = '' + srcNumber;
	if (isNaN(txtNumber) || txtNumber == "") {
		alert("Oops!  That does not appear to be a valid number.  Please try again.");
		fieldName.select();
		fieldName.focus();
	} else {
		var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
		var arrNumber = txtNumber.split('.');
		arrNumber[0] += '.';
		do {
			arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');
		} while (rxSplit.test(arrNumber[0]));
		if (arrNumber.length > 1) {
			return arrNumber.join('');
		} else {
			return arrNumber[0].split('.')[0];
		}
	}
}

/**
 * closeHandler:窗口关闭时的回调函数
 */
var showWindow = function(id,titleName,closeHandler,isModel) {
	 
	var obj = $("#" + id);
	obj.css({"z-index":"1000","position":"fixed"});
 
	var title = $("#" + id + " .windowTitle");
	//标题
	title.html(titleName);
	//计算中心位置
	var setPosition = function(obj) {
		var screenWidth = $(window).width();
		var screenHeight = $(window).height(); 
		var scrolltop = $(document).scrollTop();// 获取当前窗口距离页面顶部高度
		var objLeft = (screenWidth - obj.width()) / 2;
		var objTop = (screenHeight - obj.height()) / 2;
		obj.css({
			left : objLeft + 'px',
			top :  '140px'
		});
	};
	
 
		 $("#" + id).parent().append("<div class='mask opacity' id='mask'></div>");	
		 $('.mask opacity').css('height',$(window).height());	
		 $('.mask opacity').css('width', $(window).width());
	 
	setPosition(obj);
	obj.fadeIn(200);
	
	//拖拽效果
	var isDraging = false;
	var x,y;//鼠标距离window左上角的偏移位置
	
	title.mousedown(function(e){
		isDraging = true;
		x=e.pageX-parseInt(obj.css("left"));
		y=e.pageY-parseInt(obj.css("top"));
	}); 
	$(document).mousemove(function(e){
		if(isDraging) {
			var minLeft = 0;
			var maxRight =  $("body").width();
			var maxHeight = $("body").height();
			var left = e.pageX - x;
			var top = e.pageY - y;
			left = left <= minLeft ? minLeft: (left+obj.width() >= maxRight ? maxRight-obj.width()-10 : left);
			top = top + obj.height() >= maxHeight ? maxHeight-obj.height() : top < 0 ? 0 : top;
			obj.css({"top":top,"left":left});
		}
	}).mouseup(function(){
		isDraging = false;
	});
	$("a.ball_btn_no,a.del").click(function(){
		//防止关闭窗口时候关闭上传窗口
		if(id!='fileUploadDialog'&&id!='fileUploadDialogMin'){
			closeWindow(id);	
		} 
		if($.isFunction(closeHandler)){
			closeHandler();
		}
	}); 
	$("img.winClose").click(function(){  
 
			closeWindow(id); 
		if($.isFunction(closeHandler)){
			closeHandler();
		}
	});
	
	
	
	
	//消息提示框
	$("#messageInfoWindow a.ball_btn_true").click(function(){
		closeWindow("messageInfoWindow");
	});
	
	//异常信息框
	$("#exceptionWindow a.ball_btn_true").click(function(){
		closeWindow("exceptionWindow");
	});
	
	//消息提示框
	$("#messageConfirmWindow a.ball_btn_true,#messageConfirmWindow a.ball_btn_no_cf").click(function(){
		closeWindow("messageConfirmWindow");
		$("#messageConfirmWindow a.ball_btn_true").unbind();
	});
	
	//添加ESC监听事件
	$("body").bind("keyup",function(event){
		if(event.keyCode==27) {
			closeWindow(id);
			$("#messageConfirmWindow a.ball_btn_true").unbind();
		}
	});
	
};

//重写消息提示框
$.messager={alert:function(title,info,type){
	if($("#messageInfoWindow .ball_layer_pointout03").is(":visible")){
		$("#messageInfoWindow .ball_layer_pointout03").append(info);
	}else{
		showWindow("messageInfoWindow","提示");
		$("#messageInfoWindow .ball_layer_pointout03").text(info);
	} 
	
},confirm:function(title,info,fn){
    showWindow("messageConfirmWindow","提示");
    $("#messageConfirmWindow .ball_layer_pointout02").text(info);
    $("#messageConfirmWindow a.ball_btn_true").click(function(){
        if(fn){
            fn(true);
            return false;
            }
    }); 
    $("#messageConfirmWindow a.ball_btn_no_cf").click(function(){
    	$("#messageConfirmWindow a.ball_btn_true").unbind();
    	  if(fn){
              fn(false);
              return false;
              }
    }); 
}
};
var messageInfo = function(msg){
	showWindow("commonInfoWindow","提示"); 
	$("#commonInfoWindow .ball_layer_pointout04").text(msg);
	setTimeout('closeCommonInfoWindow()',1000);
	
};

var showExceptionInfo = function(msg){
	showWindow("exceptionWindow","错误提示");
 
 $("#exceptionWindow .ball_layer_pointout06").text("系统服务异常，异常信息："+msg); 

};

var closeCommonInfoWindow = function(){
	closeWindow("commonInfoWindow");
};


 
function formatLabel(label){
	if(label!=null){
		label = label.replace("：","");
		label = label.replace(":","");
	}
	return label;
}

function appendErrorInfo(errorInfo){
	$(".ball_layer_pointout").css("display","");
    $(".ball_layer_pointout").append(errorInfo);	 
}
function appendErrorInfo2(errorInfo){
	$(".ball_layer_pointout").text("");
	$(".ball_layer_pointout").css("display","");
    $(".ball_layer_pointout").append(errorInfo);	 
}

var closeWindow = function(id) {
	$("#"+id).hide();
	$("#" + id + " .w_clear").each(function(){
		//解决IE报错的问题
		if($(this)[0].nodeName == "INPUT") {
			$(this).val("");
		} 
/*		else {
			$(this).text("");
		}*/
	});
	$('#mask').remove();
	//取消body所有监听
	$("body").unbind();
};
var highlight = function(title) {
	$('.page-sidebar-menu li a[name=' + title + ']').first().parent().addClass("start active");
};
var generateNav = function() {
	for ( var i = 0; i < arguments.length; i++) {
		if (i < arguments.length - 1) {
			$(".public_nav_info").append("<span style=\"display:inline-block;float:left\">"+arguments[i]+"&nbsp;&gt;&nbsp;</span>");
		} else {
			$(".public_nav_info").append("<span class=\"main_nav\">"+arguments[i]+"</span>");
		}
	}
	$(".public_nav_info").show();
};

//生成当前位置
var generateWebMap = function() {
	$(".web_map").text("");
	$(".web_map").append("<span>&lt;&lt;<a href=\"javascript:history.back()\" title=\"点击可返回到上次浏览页面\" >返回</a> </span>系统路径：系统");
	for ( var i = 1; i < arguments.length; i=i+2) {
		if(arguments[i] == '#'){
			$(".web_map").append("&nbsp;>&nbsp;"+arguments[i-1]+"");
		}else{
			$(".web_map").append("&nbsp;>&nbsp;<a href="+basePath+arguments[i]+">"+arguments[i-1]+"</a>");
		}
	}
};

var reGenerateNav = function() {
	$(".common_nav").text("");
	$(".common_nav").append("<img src='"+basePath+"/themes/blue/images/ico_arrow_right.gif' />&nbsp;&nbsp;");
	for ( var i = 0; i < arguments.length; i++) {
		if (i < arguments.length - 1) {
			$(".common_nav").append("<span>"+arguments[i]+"</span>&nbsp;&gt;&nbsp;");
		} else {
			$(".common_nav").append("<span>"+arguments[i]+"</span>");
		}
	}
};
var hideNav = function() {
	$(".common_nav").hide();
}; 
$(function () {
	if($.messager!=undefined){
		$.messager.defaults = { ok: "确定", cancel: "取消" };
	}
});


//比较日期大小，格式yyyy-mm-dd   a>b 返回true
function dayDateCompare(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = b.split("-");
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();

    if (starttimes > lktimes) {
        return true;
    }
    else
        return false;

}

//时间比较(yyyy-mm-dd hh:mi:ss)
function dateCompare(beginTime,endTime) {
    var beginTimes = beginTime.substring(0, 10).split('-');
    var endTimes = endTime.substring(0, 10).split('-');

    beginTime = beginTimes[1] + '/' + beginTimes[2] + '/' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
    endTime = endTimes[1] + '/' + endTimes[2] + '/' + endTimes[0] + ' ' + endTime.substring(10, 19);

    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
    if (a < 0) {
       return true;
    } else if (a >= 0) {
       return false;
    } else {
        return 'exception';
    }
}

 
 


//格式yyyy-mm-dd  与当前日期比较，大于则返回true
function dayCompareCurrent(a) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();
    var currentTimes = (new Date()).getTime();
    if (starttimes > currentTimes) {
        return true;
    }
    else
        return false;

}

//格式yyyy-mm-dd hh:mi:ss  与当前日期比较，大于则返回true
function timeCompareCurrent(beginTime) {
	  var beginTimes = beginTime.substring(0, 10).split('-'); 
	  beginTime = beginTimes[1] + '/' + beginTimes[2] + '/' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
      var a = (Date.parse(beginTime) - (new Date()).getTime());
	    if (a < 0) {
	       return false;
	    } else if (a >= 0) {
	       return true;
	    } else {
	        return 'exception';
	    }
}
//加br换行
function addBrs(strContent,intLen){
	var strTemp="";
	while(strContent.length>intLen){
	strTemp+=strContent.substr(0,intLen)+"<br />";  
	strContent=strContent.substr(intLen,strContent.length);  
	}
	strTemp+=strContent;
	return strTemp;
}

//-- 消除空格 --//
//去左空格;
//去左空格;
function ltrim(s) {
  s=s.replace(/^　*/g,"");
  return s.replace(/^\s*/, "");
}
//去右空格;
function rtrim(s) {
  s=s.replace(/　*$/g,"");
  return s.replace(/\s*$/, "");
}
//去左右空格;
function trim(s) {
  return rtrim(ltrim(s));
}
//-- 消除空格END --//

var alertSuccessInfo = function(){
	$.messager.alert("提示", "操作成功！", "info");
};
var alertInfo = function(info){
	$.messager.alert("提示", info, "info");
};
var alertFailInfo = function(){
	$.messager.alert("提示", "操作失败！", "warning");
};

//数据格式化  s为需要格式化的数据 整数格式 小数格式会去掉小数部分的数据 
//n为格式化的长度
//例：fnumber(1234567,3)=1,234,567; fnumber(1234567.8901,3)=1,234,567 
function fnumber(s, n)  
{  
   n = n > 0 && n <= 20 ? n : 2;  
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
   var l = s.split(".")[0].split("").reverse(),  
   //r = s.split(".")[1];  
   t = "";  
   for(i = 0; i < l.length; i ++ )  
   {  
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
   }  
   return t.split("").reverse().join("");  
} 
//获取当前时间yyyy-mm-dd
function getCurentTime()
{ 
    var now = new Date();
   
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
   
    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分
   
    var clock = year + "-";
   
    if(month < 10)
        clock += "0";
   
    clock += month + "-";
   
    if(day < 10)
        clock += "0";
       
    clock += day + " ";
   
    return(clock); 
} 
function isIP(strIP) { 
    var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g; //匹配IP地址的正则表达式 
    if(re.test(strIP)) 
    { 
       if( RegExp.$1 <256 &&RegExp.$1>=0 && RegExp.$2<256 &&RegExp.$2>=0 && RegExp.$3<256 &&RegExp.$3>=0 && RegExp.$4<256 &&RegExp.$4>=0) return true; 
      } 
   return false; 
}  
 


/**
 * 过滤特殊字符的正则表达式（added by zhaojinhua）
 */
var stripscript= function(s)
{
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
	var rs = "";
	for (var i = 0; i < s.length; i++) {
	rs = rs+s.substr(i, 1).replace(pattern, '');
	}
	return $.trim(rs);
}; 
//检查特殊字符
var checkHasSpecChar = function(s){
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
	 if(pattern.test(s))
     {
         return true;
     }
     return false;
}


/**
 * 获取昨天时间 
 */
var getYesterdayDate = function(){
	var yday = new Date(); 
	var yesterday_milliseconds=yday.getTime()-1000*60*60*24; //昨天 时间毫秒数
	yday.setTime(yesterday_milliseconds); //昨天  时间
	var year = yday.getFullYear();
	var month = yday.getMonth()+1;
	var day = yday.getDate();
	
	var clock = year + "-";
	   
    if(month < 10)
        clock += "0";
   
    clock += month + "-";
   
    if(day < 10)
        clock += "0";
       
    clock += day;
	return clock;
};
 

//组装当前时间
function CurentTime()
{ 
	 var now = new Date();
	   
	    var year = now.getFullYear();       //年
	    var month = now.getMonth() + 1;     //月
	    var day = now.getDate();            //日
	   
	    var hh = now.getHours();            //时
	    var mm = now.getMinutes();          //分
	   
	    var clock = year + "";
	   
	    if(month < 10)
	        clock += "0";
	   
	    clock += month + "";
	   
	    if(day < 10)
	        clock += "0";
	       
	    clock += day + " ";
	  
	    return(clock); 
}
 
 
function formatNumber(num){  
	 if(!/^(\+|-)?(\d+)(\.\d+)?$/.test(num)){  
	  return num;  
	 }  
	 var a = RegExp.$1,b = RegExp.$2,c = RegExp.$3;  
	 var re = new RegExp();  
	 re.compile("(\\d)(\\d{3})(,|$)");
	 while(re.test(b)){  
	  b = b.replace(re,"$1,$2$3");  
	 }
	 return a +""+ b +""+ c;  
	}

//display Load
function displayProgress($container) {
	var scrolltop = $(document).scrollTop(),
		maskHeight = 0,
		maskWidth = 0;
		appendTo = null;
	var offset = null;
	if($container){
		maskHeight = $container.height();
		maskWidth = $container.width();
		appendTo = $container;
		offset = $container.offset();
	}else{
		maskHeight =   document.documentElement.clientHeight;
		maskWidth =  document.documentElement.clientWidth;
		appendTo = $('body').get(0);
	}
	//$(document.body).css('overflow','hidden').css('padding-right','17px');
    $("<div id=\"updateProgressBar\" class=\"datagrid-mask\" style=\"z-index: 1000000;\"></div>").
    css({ display: "block", width: maskWidth, height: maskHeight }).appendTo(appendTo);
    $("<div id=\"updateProgressBarMsg\" class=\"datagrid-mask-msg\" style=\"z-index: 1000000;color:#000\"></div>").html("正在处理，请稍候")
    .appendTo(appendTo).css('display',"block");
    var $temp = $("#updateProgressBarMsg"),
    	$mask = $('#updateProgressBar'),
    	$win = $container || $(window);
    if(offset){
    	var maskPos = {
    			left : offset.left,
    			top : offset.top + parseInt($win.css('paddingTop'))
    	},
    	msgPos = {
    		left : maskPos.left + ($win.width() - $temp.width()) / 2,
    		top : 	maskPos.top + ($win.height() - $temp.height()) / 2
    	};
    	
    	$mask.css(maskPos);
    	$temp.css(msgPos);
    }else{
    	var viewWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
    		viewHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    	$temp.css({
    		left : (viewWidth - $temp.width()) / 2,
    		top: (viewHeight - $temp.height()) / 2  + scrolltop
    	});
    }
   $("#updateProgressBarMsg").dblclick(function(){
        unDisplayProgress();
    });
   //为云管平台嵌入出错，增加的代码，理论应自动计算高度
   $("div#updateProgressBarMsg").css("top","200px");
}

//hidden Load
function unDisplayProgress() {
	//$(document.body).css('overflow','auto').css('padding-right',0);
    $("#updateProgressBar").remove();
    $("#updateProgressBarMsg").remove();
}

//获取元素的绝对左位置
function getElementLeft(element){
	var actualLeft = element.offsetLeft;
	var current = element.offsetParent;
	while (current !== null){
		actualLeft += current.offsetLeft;
		current = current.offsetParent;
	}
	return actualLeft;
}

//获取元素的绝对上位置
function getElementTop(element){
	var actualTop = element.offsetTop;
	var current = element.offsetParent;
	while (current !== null){
		actualTop += current.offsetTop;
		current = current.offsetParent;
	}
	return actualTop;
}
//将时间yyyy-mm-dd hh:mm:ss转换为一串数字
function getTimeToNum(time){
	var result='';
	var year=time.split('-')[0];
	result+=year;
	var month=time.split('-')[1];
	if(month.length==1){
		month+='0'+month;
	}
	result+=month;
	var date=time.split(' ')[0].split('-')[2];
	if(date.length==1){
		date+='0'+date;
	}
	result+=date+"_";
	var hh=time.split(' ')[1].split(':')[0];
	if(hh.length==1){
		hh+='0'+hh;
	}
	result+=hh;
	var min=time.split(' ')[1].split(':')[1];
	if(min.length==1){
		min+='0'+min;
	}
	result+=min;
	var second=time.split(' ')[1].split(':')[2];
	if(second.length==1){
		second+='0'+second;
	}
	result+=second;
	return result;
}
 
 
 
/**
 * 表格那弹出浮动窗口
 */
var AlertFloat = (function($){
	var model = {};
	model = $.extend(model,{
		bindAlertFloatEvent:bindAlertFloatEvent
	});
	
	/**
	 * 
	 * @param id
	 * @param colObj {targetCol:触发事件的col的name（String）,
	 * 				urlCol:(String),
	 * 				postUrl:{
	 * 					colName:col的name（String）,
	 * 					titleCol:海报tile col的name（String）
	 * 				}
	 * 				cols:额外显示的col的name（Array）}
	 */
	function bindAlertFloatEvent(id,colObj){
		$('#'+id).find('td[aria-describedby='+getDesc(id,colObj.targetCol)+'] a[name="grid_program_name"]').mouseover(function(e){
			var $this = $(this);
			var $layer = $(".ball_layer");
			var parent = $this.parent(),liList = [];
			var $tr = $($this.parents('tr')[0]);
			//var url = $(parent.siblings('[aria-describedby='+getDesc(id,colObj.urlCol)+']')[0]).text();
			$layer.empty();
			$layer.append("<em></em>");
			$layer.css('z-index','10000000');
			
			var postUrl = colObj.postUrl;
			if (postUrl) {
				$layer.css('width','420px');
				var posterurl = '',postUrlTitle='';
				if(postUrl.colName){
					posterurl = getTdVal($tr,id,postUrl.colName);
					if(posterurl==='-'){posterurl='';}
				}
				if(postUrl.titleCol){
					postUrlTitle = getTdVal($tr,id,postUrl.titleCol);
				}
				if(posterurl == ''){
					posterurl = basePath+"/themes/blue/images/nopic.gif";
				}
				$layer.append("<a href='' target='_BLANK'><img src='"+posterurl+"' title='"+postUrlTitle+"' width='147' height='165' onError=\"this.src=\'"+basePath+"/themes/blue/images/nopic.gif\';this.onerror=null;\"/></a>");
				$(".ball_layer a").attr("href",getTdVal($tr,id,colObj.urlCol));
			} else {
				$layer.css('width','280px');
			}
			$layer.append("<dl></dl>");
			liList.push(getDefineHTML1(id,colObj.targetCol,colObj.urlCol,$tr));
			if(colObj.urlCol){
				liList.push(getDefineHTML1(id,colObj.urlCol,colObj.urlCol,$tr));
			}
			if(colObj.cols){
				$.each(colObj.cols,function(i,item){
					liList.push(getDefineHTML(id,item,$tr));
				});
			}
			$layer.find('dl').append(liList.join(''));
			
			if (id == 'gridTable3U' || id == 'gridTable5U'||id=='gridTableUser') {
				$(".ball_layer").hide().css("left",e.pageX+20).css("top",e.pageY-90).show(200);
			} else {
				if(e.pageY<=630) {
					$(".ball_layer").hide().css("left",e.pageX+20).css("top",e.pageY-90-190).show(200);
				} else {
					$(".ball_layer").hide().css("left",e.pageX+20).css("top",e.pageY-150-190).show(200);
					$(".ball_layer em").css("top","140px");
				}
			}
			if(getOs()==='Safari'){
				$(".ball_layer dd").css("white-space","pre");
			}
			
		});
		if(parent && parent.jquery){
			$("td").not(parent.get(0)).hover(function(e){
				$(".ball_layer").hide();
			});
		}
		$("#"+id).mouseout(function(){
			$(".ball_layer").hide();
		});
		$(".ball_layer").mouseover(function(){
			$(".ball_layer").show();
		});
		$("html").click(function(){
			$(".ball_layer").hide();
		});
	}
	function getDefineHTML(id,col,$tr){
		return '<dd><i>'+getTitle(id,col)+':</i>'+getTdVal($tr,id,col)+'</dd>';
	}
	function getDefineHTML1(id,colname,colurl,$tr){
		if(colurl){
			var url = getTdVal($tr,id,colurl);
			if(!/^http.*/.test(url)){
				url = 'http://' + url;
			}
			turl = getTdVal1($tr,id,colname) == '-' ? url : getTdVal1($tr,id,colname);
			return '<dd><i>'+getTitle(id,colname)+':</i><a target="_black" href="'+turl+'">'+turl+'</a></dd>';
		}
		return getDefineHTML(id,colname,$tr);
	}
	function getDesc(id,col){
		return id+"_"+col;
	}
	function getTdVal($tr,id,col){
		return $tr.find('[aria-describedby='+getDesc(id,col)+']').attr('title') ? $tr.find('[aria-describedby='+getDesc(id,col)+']').attr('title') : '-';
	}
	function getTdVal1($tr,id,col){
		return $tr.find('[aria-describedby='+getDesc(id,col)+'] a').text() ? $tr.find('[aria-describedby='+getDesc(id,col)+'] a').text() : '-';
	}
	/**
	 * 获取表格中的标题
	 */
	function getTitle(id,col){
		return $("#jqgh_" + getDesc(id,col)).text();
	}
	return model;
})(window.jQuery);


//查看详情窗口
function queryDetail(data,dialogTitle){
	 $('.ball_layer').css("display","none");
	showWindow('checkBatchDialog',dialogTitle);
			$("#checkBatch").html("");
			$.each(eval(data), function(i, item) {
				$("#checkBatch").append("<div style='margin-top:5px;width:370px;'>"+item+"<br/></div>"
				);
			});
}

var BOMOper = (function(){
	/**
	*	非ie下判断是否含有某个插件
	*/
	function hasPlugin(name){
		//navigator.plugins.refresh(true);
		var plugins = navigator.plugins,
			name = name.toLowerCase();
		for(var i = 0,l = plugins.length;i < l;i++){
			if(plugins[i].name.toLowerCase().indexOf(name) != -1){
				return true;
			}
		}
		
		return false;;
	}
	/**
	**判断ie下是否含有某个插件
	**@param name 插件对应的COM标示符
	*/
	function hasIEPlugin(name){
		try{
			new ActiveXObject(name);
			return true;
		}catch(e){
			return false;
		}
	}
	var operCollect = {
		hasFlash: function(){
			var result = hasPlugin('Flash');
			if(!result){
				result = hasIEPlugin('ShockwaveFlash.ShockwaveFlash');
			}
			return result;
		}
		
	};
	return operCollect;
})();
 
//获取url参数
function GetRequest() {
	   var url = location.search; 
	   var theRequest = new Object();
	   if (url.indexOf("?") != -1) {
	      var str = url.substr(1);
	      strs = str.split("&");
	      for(var i = 0; i < strs.length; i ++) {
	         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
	      }
	   }
	   return theRequest;
	}
  
 
 
//验证URL
function isURL(str_url) {// 验证url 
	var strRegex="^((https|http|ftp|rtsp|mms){1}://)(.*)";
	var re = new RegExp(strRegex);
	return re.test(str_url);
	}

$(function(){
/*	WindowHeightCss();
	function WindowHeightCss() {
		var a1 = $(".main_content").width()-50;
		$('.monitor').css('width',a1/4);
		$('.main_content').css('min-height', $(window).height()-130);
		}
	$(window).resize(WindowHeightCss);*/
	 
 
});

function initTablePager(data){
	var pagebar="";
	 var nowpage=data.currentPageNum;
	 var totalpages=Math.ceil(data.totalSize/data.pageSize);
 
	 var endPage=totalpages;
 
	 if(nowpage<=1){pagebar+="<b>上一页</b>";}
	 if(nowpage>1){pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+(nowpage-1)+")'>上一页</a>"}
	 
	 if(nowpage-1>4){
		 pagebar+="<a href='javascript:void(0);' onclick='loadTableData(1)'>"+1+"</a>";
		 pagebar+="<span>...</span>"
		 for(var i=nowpage-4;i<=nowpage;i++){
			 if(nowpage==i){pagebar+="<span class='page_index'>"+nowpage+"</span>"}
			 else {pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>"} 
		 }
	 }else{
		 for(var i=1;i<=nowpage;i++){
			 if(nowpage==i){pagebar+="<span  class='page_index'>"+nowpage+"</span>"}
			 else {pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>"} 
		 }
	 } 
	 
	 if(nowpage+4<endPage){
		 for(var i=nowpage+1;i<=nowpage+4;i++){
			 pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>";
		 }
		 pagebar+="<span>...</span>"
	     pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+endPage+")'>"+endPage+"</a>";
	 }
	 else{
		 for(var i=nowpage+1;i<=endPage;i++){
			 pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>";
		 }
	 }

	if(nowpage>=totalpages){pagebar+="<b>下一页</b>"}
	if(nowpage<totalpages){pagebar+="<a class='next' href='javascript:void(0);' onclick='loadTableData("+(nowpage+1)+")'>下一页</a>"}
 
	$("#new_page").html(pagebar);

    var pagebar='<ul class="pagination">';
//            var pagebar='';
    var nowpage=data.currentPageNum;
    var totalpages=Math.ceil(data.totalSize/data.pageSize);

    var endPage=totalpages;

//            if(nowpage<=1){pagebar+="<b>上一页</b>";}
    if(nowpage<=1){pagebar+=
        '<li class="disabled">' +
        '<a href="javascript:void(0)">上一页</a>' +
        '</li>';}
//            if(nowpage>1){pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+(nowpage-1)+")'>上一页</a>"}
    if(nowpage>1){
        pagebar+='<li>' +
        '<a href="javascript:void(0)" onclick="loadTableData('+(nowpage-1)+')">上一页</a>' +
        '</li>';
    }

    if(nowpage-1>4){
//                pagebar+="<a href='javascript:void(0);' onclick='loadTableData(1)'>"+1+"</a>";
        pagebar+='<li>' +
        '<a href="javascript:void(0)" onclick="loadTableData(1);">1</a>' +
        '</li>';
//                pagebar+="<span>...</span>";
        pagebar+="<li>...</li>";
        for(var i=nowpage-4;i<=nowpage;i++){
            if(nowpage==i){
//                        pagebar+="<span class='page_index'>"+nowpage+"</span>";
                pagebar+='<li class="active">' +
                '<a href="javascript:void(0)">'+nowpage+'</a>' +
                '</li>';
            }
            else {
//                        pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>"
                pagebar+='<li>' +
                '<a href="javascript:void(0)" onclick="loadTableData('+i+')">'+i+'</a>' +
                '</li>';
            }
        }
    }else{
        for(var i=1;i<=nowpage;i++){
            if(nowpage==i){
//                        pagebar+="<span  class='page_index'>"+nowpage+"</span>";
                pagebar+='<li class="active">' +
                '<a href="javascript:void(0)">'+nowpage+'</a>' +
                '</li>';
            }
            else {
//                        pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>"
                pagebar+='<li>' +
                '<a href="javascript:void(0)" onclick="loadTableData('+i+')">'+i+'</a>' +
                '</li>';
            }
        }
    }

    if(nowpage+4<endPage){
        for(var i=nowpage+1;i<=nowpage+4;i++){
//                    pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>";
            pagebar+='<li>' +
            '<a href="javascript:void(0)" onclick="loadTableData('+i+')">'+i+'</a>' +
            '</li>';
        }
//                pagebar+="<span>...</span>";
        pagebar+="<li>...</li>";
//                pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+endPage+")'>"+endPage+"</a>";
        pagebar+='<li>' +
        '<a href="javascript:void(0)" onclick="loadTableData('+endPage+')">'+endPage+'</a>' +
        '</li>';
    }
    else{
        for(var i=nowpage+1;i<=endPage;i++){
//                    pagebar+="<a href='javascript:void(0);' onclick='loadTableData("+i+")'>"+i+"</a>";
            pagebar+='<li>' +
            '<a href="javascript:void(0)" onclick="loadTableData('+i+')">'+i+'</a>' +
            '</li>';
        }
    }

    if(nowpage>=totalpages){
//                pagebar+="<b>下一页</b>";
        pagebar+='<li class="disabled">' +
        '<a href="javascript:void(0)">下一页</a>' +
        '</li>';;
    }
    if(nowpage<totalpages){
//                pagebar+="<a class='next' href='javascript:void(0);' onclick='loadTableData("+(nowpage+1)+")'>下一页</a>";
        pagebar+='<li>' +
        '<a href="javascript:void(0)" onclick="loadTableData('+(nowpage+1)+')">下一页</a>' +
        '</li>';
    }

    $("#new_page1").html(pagebar);
}
 
//空处理
function formatNull(str){
	if(str==null||str=="null"){
		return "";
	}else{
		return str;
	}
}
 
function selectAction(value){
	$(".treeview").find(".treeview-menu").find("li").each(function(){
		var liId= parseInt($(this).attr("id"));
		if(liId==value){
			$(this).parent().parent().click();
			$(".treeview").css({background:"#2c3849"});
    		$(this).css({background:"#E8B41E"});
		}
	});
}