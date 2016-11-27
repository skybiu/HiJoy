<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="refer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>register</title>
<link rel="stylesheet" type="text/css" href="${css }/demo.css" />
<link rel="stylesheet" type="text/css" href="${css }/style.css" />
<link rel="stylesheet" type="text/css" href="${css }/animate-custom.css" />
<script src="${js}/jquery-3.1.1.min.js" >
</script>
</head>
<body>
	<div class="content">
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <section>
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="${pageContext.request.contextPath }/registerCheck/check.do" autocomplete="on" method="post"> 
                                <h1>注册</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" >用户名</label>
                                    <input id="username_register" required="required" type="text" placeholder="用户名"/>
                                </p>
								<p id="check_username_result" style="color: red"></p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p">密码</label>
                                    <input id="password_register" required="required" type="password" placeholder="密码" /> 
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p">确认密码</label>
                                    <input id="rePassword_register" required="required" type="password" placeholder="再次输入密码" /> 
                                </p>
                                <p id="check_register_result" style="color:red "></p>
                                <p class="register button"> 
                                    <input id="check_register" type="button" value="注册"/> 
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
      </div>
</body>
<script type="text/javascript">
$(function(){
	$("#check_register").click(function(){
		var username = $("#username_register").val();
		var password = $("#password_register").val();
		var repassword = $("#rePassword_register").val();
		var reg1 = /^\s*\w{1,16}\s*$/;
		var reg2 = /^\w{1,16}$/;
		if(username.trim()==""||password==""){
			$("#check_username_result").html("");
			$("#check_register_result").html("用户名或密码不能为空");
		}
		else if(!reg1.test(username)){
			$("#check_register_result").html("");
			$("#check_username_result").html("用户名中含非法字符");
		}
		else if(!reg2.test(password)){
			$("#check_username_result").html("");
			$("#check_register_result").html("密码中含非法字符");
		}
		else if(password != repassword){
			$("#check_username_result").html("");
			$("#check_register_result").html("两次输入密码不同");
		}
		else{
			username=username.match(/\w{1,16}/);
			$.ajax({
				type:"POST",
				url:"${ctx}/registerCheck/check.do",
				contentType:"application/json",
	            data:JSON.stringify({
	            	username: username+"",
	            	password: password
	            	}),
				success:function(check){
					if(check.result==0){
						location="${ctx}/loginIn.do";
					}
					else{
						$("#check_username_result").html("");
						$("#check_register_result").html("用户名已存在");
					}
	             },
			});
		}
	});
});
</script>
</html>