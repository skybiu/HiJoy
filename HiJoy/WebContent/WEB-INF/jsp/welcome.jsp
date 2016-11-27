<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="refer.jsp"%>
<%@ include file="../../html/welcome-head.html"%>
<%@ include file="../../html/welcome-body.html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${css}/welcome.css">
<title>welcome</title>
</head>
<body>
<c:choose>
	<c:when test="${status==1}">
	  <jsp:include page="welcomeLoginInHead.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
	  <jsp:include page="welcomeLoginOutHead.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
</body>
<script src="${js}/jquery-3.1.1.min.js"></script>
<script src="${js}/welcome.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	welcome(screen.width,screen.height);
	loginStatus();
// 	document.write(
// 			"屏幕分辨率为："+screen.width+"*"+screen.height
// 			+"<br />"+
// 			"屏幕可用大小："+screen.availWidth+"*"+screen.availHeight
// 			+"<br />"+
// 			"网页可见区域宽："+document.body.clientWidth
// 			+"<br />"+
// 			"网页可见区域高："+document.body.clientHeight
// 			+"<br />"
// 			);
// });
});
function loginStatus(){
	var status = "${status}";
	if(status=="1"){
		$("#login_status").html("<a href='${ctx}/loginOut.do'><button id='login_out'>登出</button></a>");
	}	
	else{
		$("#login_status").html("<a href='${ctx}/loginIn.do'><button id='login_in'>登录</button></a>");
	}
}
</script>
</html>