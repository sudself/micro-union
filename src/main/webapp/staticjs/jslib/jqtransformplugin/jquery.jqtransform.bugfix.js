/**
 * 修改jqTransSelect方法：
 *    1. 增加zIndexNum初始值参数（默认1000），如果$("select").jqTransSelect_fix();这样调用，所有select的zindex依次减一；
 *    2. select每个选项（li>a）增加title属性以显示tooltip
 * @param {} zIndexNum zIndexNum初始值
 * @return {}
 */
$.fn.jqTransSelect_fix=function(zIndexNum){
    $(this).jqTransSelect();
    
    if(!zIndexNum){
        zIndexNum = 1000;
    }
    this.each(function(index){
        var $select = $(this);
        $select.parent().css("zIndex", zIndexNum-index);
        
        $select.parent().find('ul li a').each(function(){
            $(this).attr('title',$(this).text());
            $(this).bind("click",function(){
                $select.parent().find('div span:first').attr('title',$(this).text());
            });
        });
        $select.parent().find('div span:first').each(function(){
            $(this).attr('title',$(this).text());
        });
    });
};

/**
 * 美化select后，又动态更新下拉框选项值，需调用次方法重置zIndex
 * 如updateSelectValue("#seachcity");
 * 
 * @param {} selector select
 */
var updateSelectValue=function(selector){
    $(selector).each(function(){
        var i=$(this).parent().css('zIndex');
        $(this).parent().find('div,ul').remove();
        $(this).unwrap().removeClass('jqTransformHidden').jqTransSelect_fix(i);
        /*$(this).parent().css('zIndex', i);*/
    });
};

/**
 * 代替$(selector).val(text)
 * changejqTransSelectValue("#seachcity","北京市");
 * 
 * @param {} selector 值如"#proId"
 * @param {} text
 */
changejqTransSelectValue = function(selector,text){
    var thiz = $(selector);
    var ul = thiz.prev('ul');
    ul.find('a[title="' + text + '"]').click();
};
