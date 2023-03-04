<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Assets/Template/Login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="Assets/Template/Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="Assets/Template/Login/css/main.css">
<!--===============================================================================================-->
</head>

<%

if(request.getParameter("btn_save")!=null)
{
    String email = request.getParameter("txt_email");
    String password = request.getParameter("txt_password");
    String selQry = "select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
    ResultSet rs = con.selectCommand(selQry);
    if(rs.next())
    {
        session.setAttribute("aid", rs.getString("admin_id"));
        session.setAttribute("aname", rs.getString("admin_name"));
        response.sendRedirect("Admin/HomePage.jsp");
    }
    String selQry1 = "select * from tbl_user where (user_email_1='"+email+"' or user_email_2='"+email+"') and user_pasword='"+password+"' and user_status='1'";
    ResultSet rs1 = con.selectCommand(selQry1);
    if(rs1.next())
    {
        session.setAttribute("uid", rs1.getString("user_id"));
        session.setAttribute("uname", rs1.getString("user_name"));
        response.sendRedirect("User/HomePage.jsp");
    }
}


%>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
                            <form class="login100-form validate-form" method="post">
					<span class="login100-form-title p-b-70">
						Welcome
					</span>
					<span class="login100-form-avatar">
						<img src="Assets/Template/Login/images/avatar-01.jpg" alt="AVATAR">
					</span>

					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter E-mail">
						<input class="input100" type="email" name="txt_email">
						<span class="focus-input100" data-placeholder="E-Mail"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                         title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" type="password" name="txt_password">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
                                            <button type="submit" name="btn_save" class="login100-form-btn">
							Login
						</button>
					</div>

					<ul class="login-more p-t-190">

						<li>
							<span class="txt1">
								Don?t have an account?
							</span>

                                                    <a href="Registartion.jsp" class="txt2">
								Sign up
							</a>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
<script src="Assets/Template/Login/Assets/Template/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Assets/Template/Login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Assets/Template/Login/vendor/bootstrap/js/popper.js"></script>
	<script src="Assets/Template/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Assets/Template/Login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Assets/Template/Login/vendor/daterangepicker/moment.min.js"></script>
	<script src="Assets/Template/Login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Assets/Template/Login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Assets/Template/Login/js/main.js"></script>

</body>
</html>