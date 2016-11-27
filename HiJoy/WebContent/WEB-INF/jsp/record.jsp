<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="refer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/main.js"></script>
<script src="${js}/ajaxfileupload.js"></script>
</head>
<body>
  <div id="record_show">
  ${excel.id}dsadassadasds
  <c:forEach var="excel" items="${excels}" varStatus="count">
	  <div class="record_show_table">
	  <table>
	    <tr><td>${excel.backornot}1</td></tr>
	    <tr><td>${excel.id}1</td></tr>
<%-- 	    <tr><td>${excel.department}</td></tr> --%>
<%-- 	    <tr><td>${excel.contectMan}</td></tr> --%>
<%-- 	    <tr><td>${excel.connectPhone}</td></tr> --%>
<%-- 	    <tr><td>${excel.name}</td></tr> --%>
<%-- 	    <tr><td>${excel.type}</td></tr> --%>
<%-- 	    <tr><td>${excel.connectPhone}</td></tr> --%>
<%-- 	    <tr><td>${excel.userclass}</td></tr> --%>
<%-- 	    <tr><td>${excel.faculty}</td></tr> --%>
<%-- 	    <tr><td>${excel.specialty}</td></tr> --%>
<%-- 	    <tr><td>${excel.workplace}</td></tr> --%>
<%-- 	    <tr><td>${excel.job}</td></tr> --%>
<%-- 	    <tr><td>${excel.phone}</td></tr> --%>
<%-- 	    <tr><td>${excel.address}</td></tr> --%>
<%-- 	    <tr><td>${excel.sendTime}</td></tr> --%>
<%-- 	    <tr><td>${excel.contectType}</td></tr> --%>
<%-- 	    <tr><td>${excel.contectMan}</td></tr> --%>
<%-- 	    <tr><td>${excel.schoolLeader}</td></tr> --%>
<%-- 	    <tr><td>${excel.congress}</td></tr> --%>
<%-- 	    <tr><td>${excel.celebrationCeremony}</td></tr> --%>
<%-- 	    <tr><td>${excel.forum}</td></tr> --%>
<%-- 	    <tr><td>${excel.concert}</td></tr> --%>
<%-- 	    <tr><td>${excel.request}</td></tr> --%>
<%-- 	    <tr><td>${excel.accommodation}</td></tr> --%>
<%-- 	    <tr><td>${excel.localMeeting}</td></tr> --%>
<%-- 	    <tr><td>${excel.advice}</td></tr> --%>
	   </table>
	  <button class="delete_record">删除记录</button>
	  </div>
  </c:forEach>
   </div>
  <div id="add_record_input"></div>
  <div id="record_field">
	  <table>
	    <tr><td>excel.backornot</td></tr>
	    <tr><td>excel.id</td></tr>
	    <tr><td>excel.department</td></tr>
	    <tr><td>excel.contectMan</td></tr>
	    <tr><td>excel.connectPhone</td></tr>
	    <tr><td>excel.name</td></tr>
	    <tr><td>excel.type</td></tr>
	    <tr><td>excel.connectPhone</td></tr>
	    <tr><td>excel.userclass</td></tr>
	    <tr><td>excel.faculty</td></tr>
	    <tr><td>excel.specialty</td></tr>
	    <tr><td>excel.workplace</td></tr>
	    <tr><td>excel.job</td></tr>
	    <tr><td>excel.phone</td></tr>
	    <tr><td>excel.address</td></tr>
	    <tr><td>excel.sendTime</td></tr>
	    <tr><td>excel.contectType</td></tr>
	    <tr><td>excel.contectMan</td></tr>
	    <tr><td>excel.schoolLeader</td></tr>
	    <tr><td>excel.congress</td></tr>
	    <tr><td>excel.celebrationCeremony</td></tr>
	    <tr><td>excel.forum</td></tr>
	    <tr><td>excel.concert</td></tr>
	    <tr><td>excel.request</td></tr>
	    <tr><td>excel.accommodation</td></tr>
	    <tr><td>excel.localMeeting</td></tr>
	    <tr><td>excel.advice</td></tr>
	   </table>
  </div>
  <div id="excel_add_record">
  <button>excel表导入数据</button>
  </div>
  <div id="normal_add_record">
    <button>添加</button>
  </div>
  <div id="record_page"></div>
    <div class="center"><input type="file" id="file" name="file" accept=".xls,.xlsx" multiple="multiple">
      </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	if("${sta}"!="1"){//注意改回!=1
		//发送要删除的数据到controller,成功后返回包括excel表集合和status==1
	}
	addRecordInputInit();
	deleteRecord();
	addRecord();
});
function deleteRecord(){
	$(".delete_record").click(function(){
		//发送要删除的数据到controller,成功后返回包括excel表集合和status==1
	});
}
function addRecordInputInit(){
		$("#add_record_input").html($("#record_field").find("table").eq(0).children().html()+"");
		$("#add_record_input").find("td").html("<input type='text'/>");
		$("#add_record_input").find("td").css({"height":parseInt($("#record_field").find("td").css("height"))+2});
}
function addRecord(){
	$("#normal_add_record").click(function(){
		//发送要添加的数据到controller,成功后返回包括excel表集合和status==1
	});
}

</script>
</html>