<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="refer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>login</title>
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
                            <form  action="${pageContext.request.contextPath }/loginCheck/loginIn.do" autocomplete="on" method="post"> 
                                <h1>登录</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" >邮箱或用户名</label>
                                    <input id="username_login" required="required" type="text" placeholder="用户名"/>
                                </p>
								<p id="check_username_result" style="color: red"></p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p">密码</label>
                                    <input id="password_login" required="required" type="password" placeholder="密码" /> 
                                </p>
                                <p id="check_login_result" style="color:red "></p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">记住我</label>
								</p>
								<a href="/HiJoy/register.do">没有账号？注册</a>
                                <p class="login button"> 
                                    <input id="check_login" type="button" value="登录"/> 
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
$(document).ready(function(){
	$("#check_login").click(function(){
		var username = $("#username_login").val();
		var password = $("#password_login").val();
		var reg1 = /^\s*\w{1,16}\s*$/;
		var reg2 = /^\w{1,16}$/;
		if(username.trim()==""||password==""){
			$("#check_username_result").html("");
			$("#check_login_result").html("用户名或密码不能为空");
		}
		else if(!reg1.test(username)){
			$("#check_login_result").html("");
			$("#check_username_result").html("用户名中含非法字符");
		}
		else if(!reg2.test(password)){
			$("#check_username_result").html("");
			$("#check_login_result").html("密码中含非法字符");
		}
		else{
			username=username.match(/\w{1,16}/);
		$.ajax({
			type:"post",
			url:"${ctx}/loginCheck/loginIn.do",
			contentType:"application/json",
            data:JSON.stringify({
            	username: username+"",
            	password: password
            	}),
			success:function(check){
				if(check.result==1){
					location="${ctx}/welcome.do";
				}
				else if(check.result==0){
					$("#check_username_result").html("");
					$("#check_login_result").html("密码错误");
				}
				else{
					$("#check_username_result").html("");
					$("#check_login_result").html("用户名不存在");
				}
			}
		});
		}
	});
});
</script>
</html>