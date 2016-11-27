<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="refer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校友信息管理系统</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/main.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/main.js"></script>
<script src="${js}/ajaxfileupload.js"></script>
<body class="main_body">
  <div id="main_left" class="main_left">
	  <c:if test="${status=='1'}">
		  <div class="center"><button id="member">增删改除用户</button></div>
	  </c:if>
	  	  <div class="center"><button id="record">增删改除信息</button></div>
  </div>
  <div id="main_top" class="center">
    <span>校友信息管理系统</span>
  </div>
  <div id="main_logo">
    <img alt="无法显示图片" src="${pageContext.request.contextPath}/logo.png">
  </div>
  <div id="main_right">
    <c:choose>
      <c:when test="${jspStatus=='1'}">
         <jsp:include page="member.jsp"></jsp:include>
      </c:when>
      <c:otherwise>
         <jsp:include page="record.jsp"></jsp:include>
      </c:otherwise>
    </c:choose>
  </div>
</body>
<script type="text/javascript">
$(document).ready(function(){

	if("${pageload}"==1)
		location="${ctx}/upload2.do";
	setPageCurrent(parseInt("${id}"),5,parseInt("${count}"));
	main(screen.width*0.99,screen.height*0.9,0.1,0.3,0.03);
	member_record();
	$("#excel_add_record").click(function(){ajaxFileUpload();});
});
function member_record(){
	$("#member").click(function(){
		location="${ctx}/welcome.do";
	});
	$("#record").click(function(){
		location="${ctx}/upload2.do";
	});
}
function ajaxFileUpload() {
	  var filename = $("#file").val();
	  if(filename!=null&&filename!="")
	{$.ajaxFileUpload({
	    //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	    url: "${ctx}/upload.do",
	    enctype: "multipart/form-data",
	    secureuri: false,                       //是否启用安全提交,默认为false
	    fileElementId: 'file',
	    success:function(){
	    	location="${ctx}/upload2.do";
	    }
	    //文件选择框的id属性               //服务器返回的格式,可以是json或xml等
	  });}
	}
function setPage(start,end){
	for(var i=start-1;i<end;i++){
		if(i<end){
			$("#record_page").append("<a href=\"${ctx}/upload/"+(i+1)+"\">"+(i+1)+"</a>");
		}
	}
}
function setPageCurrent(id,space,count){
	var start=id-space;
	if(id-space<1) start=1;
	var end=id+space;
	if(id+space>count) end=count;
	setPage(start,end);
}
</script>
</html>