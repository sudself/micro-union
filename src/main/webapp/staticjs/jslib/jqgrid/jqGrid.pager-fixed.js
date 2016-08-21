(function($) {
	$.extend( {
		jqGridajaxPager : {}
	});
	$.jqGridajaxPager.pager = function(jqGridId,callback, pagerContainer) {
		var pageCount=$("#"+jqGridId).getGridParam("lastpage");
		var pageNum=$("#"+jqGridId).getGridParam("page");
		var pageSize=$("#"+jqGridId).getGridParam("rowNum");
		$("#"+pagerContainer).html("");
		if (pageNum && pageCount >= 1) {
			var _pager;
			if (pagerContainer) {
				_pager = $('#' + pagerContainer);
			} else {
				_pager = $("#defaultPager");
			}
			_pager.pager( {
				pagenumber : pageNum,
				pagecount : pageCount,
				buttonClickCallback : function(clickNum, clickBtn) {
					var offset = (clickNum - 1) * pageSize + 1;
					callback.call(this,clickNum,offset, clickBtn);
				}
			});
		}
	};
	
	$.jqGridajaxPager.getUrl=function(param, val, url){
        if (!url) {
            url = window.location.href;
        }
        val = encodeURIComponent(val);
        var reg = new RegExp("(\\?|&)" + param + "=([^&]*)(&|$)", "gi");
        var pst = url.match(reg);
        if ((pst == undefined) || (pst == null)) {
            return url + ((url.indexOf("?") == -1) ? "?" : "&") + param + "=" + val;
        }
        var t = pst[0];
        var retxt = t.substring(0, t.indexOf("=") + 1) + val;
        if (t.charAt(t.length - 1) == '&') {
            retxt += "&";
        }
        return url.replace(reg, retxt);
    };
})(jQuery);
