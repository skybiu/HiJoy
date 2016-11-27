function welcome(width,height){
	$(".bg").mousedown(function(e){
		e.preventDefault();
	});
	$(".bg").css("width",width).css("height",height);
	$("#mian_logo").css("top",height/10);
	$("#main_logo").css("left",width/15);
	$("#main_logo").children().css("width",width/4);
	$("#main_logo").children().css("hight",height/10);
	$("#main").css("width",width*0.9);
	$("#main").css("top",height*0.2);
	$("#main").css("left",width*0.05);
	$("#bgm").css("left",width*0.3);
	$("#bgm").css("top",height*0.8);
	move();
	slideTogger("#source_post_button","#source_post_list","fast");
	chooseItem("#bg_list",500,width,height);
}
function chooseItem(list,time,width,height){//width,height不为百分比
	

	if($(list).children().length==1){
		//初始化图片廊
		var length=$(list).find("img").length;
		$(list).css({"position":"absolute","left":0,"top":0,"width":width,"height":height,"overflow":"hidden"});
		$(list).children().css({"position":"absolute","left":0,"top":0,"width":"inherit","height":"inherit"});
		for(var i=0;i<length;i++){
			$(list).find("img").eq(i).css({"position":"absolute","left":100*i+"%","top":0,"width":"inherit","height":"inherit"});
		}
		//初始化控制按钮
		var button_width=width/parseFloat((length+1));
		var left_space=(width-length*button_width)/2;
		for(var i=0;i<length+2;i++){
			$(list).children().first().before("<button>"+(length+2-i)+"</button>");//创建length+2个按钮,规定前length个为焦点获取按钮,剩余两个为左右或上下移动按钮
		}
		for(var i=0;i<length+2;i++){
			if(i<length){
				$(list).children().eq(i).css({"position":"absolute","left":left_space+button_width*i,"top":height*0.75,
				"width":button_width,"height":height*0.1,"z-index":999});
			}
			else if(i==length){
				$(list).children().eq(i).css({"position":"absolute","left":0,"top":(height)*1.0/3,
				"width":30,"height":(height)*1.0/3,"z-index":999});
			}
			else{
				$(list).children().eq(i).css({"position":"absolute","right":0,"top":(height)*1.0/3,
				"width":30,"height":(height)*1.0/3,"z-index":999});
			}
		}
	}
	//焦点获取按钮的焦点获取
	$(list).children(":lt("+length+")")
	.click(function(e){
		$(this).focus();
	})
	.keydown(function(e){//左：37 上：38 右：39 下：40
		if(e.keyCode==39){
			if($(this).index()==length-1){
				$(list).children().eq(0).focus();
			}
			else{
				$(this).next().focus();
			}
		}
		if(e.keyCode==37){
			if($(this).index()==0){
				$(list).children().eq(length-1).focus();
			}
			else{
				$(this).prev().focus();
			}
		}
	})
	//焦点获取按钮的焦点获取与失去处理
	.focus(function(){
		$(list).children().attr("disabled","disabled");
		$(this).css({"background-color":"blue"});
		$(list).children().last().animate({
			"left":($(this).index())*(-width)
		},time);
		setTimeout(function(){
			$(list).children().removeAttr("disabled");
		},time);
	})
	.blur(function(){
		$(this).css({"background-color":"red"});
	});
	//移动按钮的点击处理
	$(list).children().eq(length).click(function(){
		$(list).children().attr("disabled","disabled");
		if(parseInt($(list).children().last().css("left"))==0){
			$(list).children().last().animate({
				"left":-(width*(length-1))
			},time);
		}
		else{
			$(list).children().last().animate({
			"left":"+="+width
			},time);
		}
		setTimeout(function(){
			$(list).children().removeAttr("disabled");
		},time);
	});
	$(list).children().eq(length+1).click(function(){
		$(list).children().attr("disabled","disabled");
		if(parseInt($(list).children().last().css("left"))==-(width*(length-1))){
			$(list).children().last().animate({
				"left":0
			},time);
		}
		else{
			$(list).children().last().animate({
			"left":"-="+width
			},time);
		}
		setTimeout(function(){
			$(list).children().removeAttr("disabled");
		},time);
	});
	//图片移动时的处理(注意焦点获取按钮获取焦点的情况)
}
/*function chooseItem(list,time){//卡顿bug
	var count=1,pre,next,now,time_space,now_to_count;
	var length=($(list).children().length-2)/2;
	var button_pre=$(list).children(".button_pre").children();
	var button_next=$(list).children(".button_next").children();
	now=parseInt($(list).children(".button_ch1").attr("class").match(/\d+/));
	var button_ch=$(list).children(".button_ch2").children();//
	for(var i=1;i<length;i++)
	$(list).children(".item"+(i+1)).css("display","none");
	button_next.click(function(){
		$(list).children().not(".bg").children().attr("disabled","disabled");
		next=(count==length?1:count+1);
		$(list).children(".item"+next).css({"display":"block"});
		$(list).children(".item"+count).children().css({"animation-name":"translation_left"});
		$(list).children(".item"+next).children().css({"animation-name":"translation_right_to_middle"});
		$(list).children(".item"+count).children().css({"animation-play-state":"running"});
		$(list).children(".item"+next).children().css({"animation-play-state":"running"});
		if(count<length) count++;
		else count=1;
		setTimeout(function(){
			$(list).children().not(".bg").children().removeAttr("disabled");
			},time);
	});
	button_pre.click(function(){
		$(list).children().not(".bg").children().attr("disabled","disabled");
		pre=(count==1?length:count-1);
		$(list).children(".item"+pre).css({"display":"block"});
		$(list).children(".item"+count).children().css({"animation-name":"translation_right"});
		$(list).children(".item"+pre).children().css({"animation-name":"translation_left_to_middle"});
		$(list).children(".item"+count).children().css({"animation-play-state":"running"});
		$(list).children(".item"+pre).children().css({"animation-play-state":"running"});
		if(count>1) count--;
		else count=length;
		setTimeout(function(){
			$(list).children().not(".bg").children().removeAttr("disabled");
			},time);
	});
	button_ch.click(function(){
		count=parseInt($(this).parent().attr("class").match(/\d+/));
		$(list).children().not(".bg").children().attr("disabled","disabled");
		if(now<count){
			now_to_count=count-now;
			time_space=parseInt(time*(1/(float)(now_to_count)));
			$(list).children(".item"+now).css({"display":"block"});
			$(list).children(".item"+now).children().css({
				"animation-name":"translation_left","animation-duration":time_space+"ms","animation-delay":0,		  "animation-play-state":"running"});
			$(list).children(".item"+now+1).css({"display":"block"});
			$(list).children(".item"+now+1).children().css({
				"animation-name":"translation_right_to_middle","animation-duration":time_space+"ms","animation-delay":0,		  "animation-play-state":"running"});
			now++;
			while(now<count){
				$(list).children(".item"+now).css({"display":"block"});
				$(list).children(".item"+now).children().css({
				"animation-name":"translation_left","animation-duration":time_space+"ms","animation-delay":time_space+"ms","animation-play-state":"running"});
				$(list).children(".item"+now+1).css({"display":"block"});
				$(list).children(".item"+now+1).children().css({
				"animation-name":"translation_right_to_middle","animation-duration":time_space+"ms","animation-delay":time_space+"ms","animation-play-state":"running"});
				now++;//此时now与count相等，注意获取焦点以及时至当前now的按钮
			}
			
		}
		if(now>count){
			now_to_count=now-count;
			time_space=parseInt(time*(1/(float)(now_to_count)));
			$(list).children(".item"+now).css({"display":"block"});
			$(list).children(".item"+now).children().css({
				"animation-name":"translation_right","animation-duration":time_space+"ms","animation-delay":0,		  "animation-play-state":"running"});
			$(list).children(".item"+now-1).css({"display":"block"});
			$(list).children(".item"+now-1).children().css({
				"animation-name":"translation_left_to_middle","animation-duration":time_space+"ms","animation-delay":0,		  "animation-play-state":"running"});
			now--;
			while(now>count){
				$(list).children(".item"+now).css({"display":"block"});
				$(list).children(".item"+now).children().css({
				"animation-name":"translation_right","animation-duration":time_space+"ms","animation-delay":time_space+"ms","animation-play-state":"running"});
				$(list).children(".item"+now-1).css({"display":"block"});
				$(list).children(".item"+now-1).children().css({
				"animation-name":"translation_left_to_middle","animation-duration":time_space+"ms","animation-delay":time_space+"ms","animation-play-state":"running"});
				now--;
			}
			
		}
		
		for(var i=0;i<length;i++)
		$(list).children(".item"+i+1).children().css({"animation":"translation_left 1s ease 0s 1 normal forwards paused"});
		
		setTimeout(function(){
			$(list).children().not(".bg").children().removeAttr("disabled");
			},time_space);
	});
}*/
function slideTogger(slideButton,slideList,time){
	$(slideButton).click(function(){
		$(slideList).slideToggle(time);
	});
}
function move(){//卡顿bug
	var isDown=false,isOut=false;
	var x1,y1,x2,y2;
	var top,left;

	$(".move").mousedown(function(e){
		if($(this).attr("id")!="main_bgm")
		e.preventDefault();
        top=parseInt($(this).css("top"));
		left=parseInt($(this).css("left"));
		x1=e.clientX;
		y1=e.clientY;
		isDown=true;
	});
	$(".move").mouseup(function(){
		isDown=false;
	});
	$(".move").mouseout(function(){
		isDown=false;
		isOut=true;
	});
	$(".move").mouseover(function(){
		isOut=false;
	});
	$(".move").mousemove(function(e){
		if(isDown&&!isOut){
			$(this).css("left",left+(e.clientX-x1));
			$(this).css("top",top+(e.clientY-y1));
		}
	});
}