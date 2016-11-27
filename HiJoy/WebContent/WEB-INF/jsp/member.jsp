<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="member_show">
  <c:forEach var="member" items="${members}">
  <div class="member_show_table">
  <table>
    <tr><td>${member.name}</td></tr>
    <tr><td>${member.password}</td></tr>
   </table>
  <button class="delete_member">删除记录</button>
  </div>
  </c:forEach>
   </div>
  <div id="add_member_input"></div>
  <div id="member_field">
	  <table>
	    <tr><td>name</td></tr>
	    <tr><td>password</td></tr>
	   </table>
  </div>
  <div id="excel_add_member">
  <button>excel表导入数据</button>
  </div>
  <div id="normal_add_member">
    <button>提交</button>
  </div>
  <div id="member_page"></div>
  
</body>
<script type="text/javascript">
$(document).ready(function(){
	if("${status}"!="1"){//注意改回!=1
		//发送要删除的数据到controller,成功后返回包括excel表集合和status==1
	}
	addMemberInputInit();
	deleteMember();
	addMember();
	setMemberPage();
});
function deleteMember(){
	$(".delete_member").click(function(){
		//发送要删除的数据到controller,成功后返回包括excel表集合和status==1
	});
}
function addMemberInputInit(){
		$("#add_member_input").html($("#member_show").find("table").eq(0).children().html()+"");
		$("#add_member_input").find("td").html("<input type='text'/>");
		$("#add_member_input").find("td").css({"height":parseInt($("#member_field").find("td").css("height"))+2});
}
function addMember(){
	$("#normal_add_member").click(function(){
		//发送要添加的数据到controller,成功后返回包括excel表集合和status==1
	});
}
function setMemberPage(){
	//注意js中除法的不同，比如7/4==2
	for(var i=0;i<parseInt("{fn:length(records)}");i++){
		$("#member_page").append("<a href='相应的${id}'>"+(i+1)+"</a>");
	}
}
</script>
</html>