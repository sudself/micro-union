$(function() {
        function _fix() {
            var h = $(window).height();
            var w = $(window).width();
            $(".bd").css({
                width: w + "px",
                height: (h - 50) + "px"
            });
        }
        _fix();
        $(window).resize(function() {
            _fix();
        });
        
        var location = (window.location+'').split('/');  
        var basePath = location[0]+'//'+location[2]+'/'+location[3];  
        
        var _parent_flad=true;
        $(".treeview").click(function(){
        	var _parent=$(this);
        	if(_parent_flad){
        		$(this).find(".treeview-menu").find("li").css({background:"#2c3849"});
        		$(".treeview").css({background:"#2c3849"}).find(".fa-angle-left img")
        		.attr("src","/aliyun-gui/images/icn_arrow_r.png")
        		.end().children(".treeview-menu").stop().slideUp(500);
        		$(this).css({background:"#E8B41E"}).find(".fa-angle-left img")
        		.attr("src","/aliyun-gui/images/icn_arrow_b.png")
        		.end().children(".treeview-menu").stop().slideDown(500);
        	}else{
        		_parent_flad=true;
        	}
        	$(this).find(".treeview-menu").find("li").click(function(){
        		$(_parent).find(".treeview-menu").find("li").css({background:"#2c3849"});
        		_parent_flad=false;
        		$(".treeview").css({background:"#2c3849"});
        		$(this).css({background:"#E8B41E"});
        		var liId= parseInt($(this).attr("id"));
        		switch(liId){
        		case 0://申请信息  后期去除
        			
//        			if ($("#iframe1",parent.document).length>0){
//        				var url = window.parent.location.href;
//        				if (url.indexOf("resource_audit")>0){
//        					url = url.replace("resource_audit","user_management");
//        				}
//        				else if (url.indexOf("open_audit")>0){
//        					url = url.replace("open_audit","user_management");
//        				}
//        				window.parent.location.href=url;
//        			}
//        			else{
//        				window.location.href=basePath+"/userManageAction/toUserList.action";
//        				
//        			}
        			window.location.href=basePath+"/dashboardAction/index.action";
        			break;
        		case 1://实例
        			window.location.href=basePath+"/instancesAction/index.action";
        			break;
        		case 2://集群
        			window.location.href=basePath+"/clusterAction/index.action";
        			break;
        		case 3://虚机组
        			window.location.href=basePath+"/vmGroupAction/index.action";
        			break;
        		case 4://镜像
        			window.location.href=basePath+"/imageAction/index.action";
        		    break;
        		case 5://安全组
        			window.location.href= basePath+"/securityGroup/init.action";
        			break;
        		case 6://虚拟机
        			window.location.href= basePath+"/virtualAction/index.action";
        			break;
        		case 7://虚机模板
        			window.location.href= basePath+"/templateAction/index.action";
        			break;
        		case 8://云账号管理
        			window.location.href= basePath+"/accountAction/index.action";
        			break;
        		case 9://监控告警
        			window.location.href= basePath+"/monitorAlarm/index.action";
        			break;
        		}
        		
        	});
        	
	     }); 
	     
		 $(".btn-box-tool li").click(function(){
			 var  $index=$(this);
			 var index=$(this).index();
			 if($index.hasClass("on")){
			   return false;
			 }
			 
			 $(".on").removeClass("on");
			 $index.addClass("on")
			 $(".description-block").eq(index).show().siblings().hide();
	    });
	    
//	    $(".content-header").find("a").click(function(){
//	    	var value=$(this)[0].innerHTML;
//	    	$(".treeview").find("a").find("span").each(function(){
//	    		var thisValue=$(this)[0].innerHTML;
//	    		if(value==thisValue){
//	    			$(this).parent().parent().click();
//	    		}else{
//	    			$(".treeview").find(".treeview-menu").find("li").each(function(){
//	    				var _value=$(this)[0].innerHTML.substring(1);
//	    				if(value==_value){
//	    					$(this).parent().parent().click();
//	    					$(this)[0].click();
//	    				}
//	    			})
//	    		}
//	    	})
//	    });
	    
	    
	    
	})