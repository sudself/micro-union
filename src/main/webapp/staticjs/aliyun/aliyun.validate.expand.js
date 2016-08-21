
(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "./jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

(function() {

	function stripHtml(value) {
		// remove html tags and space chars
		return value.replace(/<.[^<>]*?>/g, " ").replace(/&nbsp;|&#160;/gi, " ")
		// remove punctuation
		.replace(/[.(),;:!?%#$'\"_+=\/\-“”’]*/g, "");
	}

}());

/*验证必须为数字且小于100   创建虚机的  要创建的虚机数量字段*/
jQuery.validator.addMethod("virtualNumInput", function(value, element) {   
    var r = /^[1-9][0-9]?$/;
    return this.optional(element) || (r.test(value));
}, "虚机数量必须为小于100的整数");

/*验证必须为数字且小于100   创建虚机的  要创建的虚机数量字段*/
jQuery.validator.addMethod("selectType", function(value, element) {   
	if (value != -1) {
		return true;
	}else {
		return false;
	}
	alert(value);
}, "请选择云插件！");
}));
