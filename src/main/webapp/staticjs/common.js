function chooseImgClass(event,tg){
	var url=$(event).attr("src");
	var choose=url.lastIndexOf("1.png")<0?true:false;
	if(tg==0&&!choose){
		url=url.replace("1.png",".png");
	}else if(tg==1&&choose){
		url=url.replace(".png","1.png");
	}
	$(event).attr("src",url);
}