<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Griny - single & multi page theme</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="css/colorbox.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800,700,300,600,400italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
		
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

		<% String toDate = new java.text.SimpleDateFormat("yyyy.MM.dd     HH:mm:ss").format(new java.util.Date()); %>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					 <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand goTop" href="#">Griny</a>
					<div class="nav-collapse pull-right">
						<ul class="nav">
							<li><a href="index.jsp">Home</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages  <b class="caret"></b></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="about.html">About Us</a></li>
									<li><a href="services.html">Services</a></li>
									<li><a href="price.html">Price</a></li>
									<li><a href="login.html">Login</a></li>
									<li class="active"><a href="register.html">Register</a></li>
									<li><a href="faq.html">F.A.Q.</a></li>
									<li><a href="contacts.html">Contact</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="blog-right.html">Blog right sidebar</a></li>
									<li><a href="blog-left.html">Blog left sidebar</a></li>
									<li><a href="blog-full.html">Blog full</a></li>
									<li class="divider"></li>
									<li><a href="blog-single.html">Blog single one</a></li>
									<li><a href="blog-single2.html">Blog single two</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">My groups <b class="caret"></b></a>
								<ul class="dropdown-menu" role="menu">
									<c:forEach items="${grouplist}" var="group">
									<li><a href="groupshare.do?groupId=${group.groupId}">${group.groupName}</a></li>
									</c:forEach>
								</ul>
							</li>
							<li><a href="shortcodes.html">Shortcodes</a>
							</li>
						</ul>
					</div>	
				</div>	
			</div>
		</div>
		
		<div class="parallax no-animate large-view form-page" style="background-image: url(images/bg1.jpg);">	
			<div class="text no-animate">
				<h1>Register</h1><br>
			<form:form commandName="newgroup" action="groupadd.do" method="post" id="groupadd">
	        <form:input path="groupName" class="input-block-level" id="groupName" placeholder="Group Name"/>
	        <form:hidden path="founder" value="${userInfo.email}"/>
	        <form:hidden path="groupDate" value="${toDate}"/>
        	</form:form>
	         <button type="button" id="duplcheck" class="btn btn-large btn-block">
	          		  중복확인
	         </button>
        </div>
        </div>
				

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
		<script src="js/placeholder.js"></script>
		<script src="js/jquery.colorbox-min.js"></script>
		<script src="http://malsup.github.com/jquery.form.js"></script> 
        <script src="js/main.js"></script>
    </body>

                    
                        
                       <%--  <div class="form-group input-group">
                        <form>
                            <input type="text" class="form-control" id="emailName">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button" id="idSearch"><i class="fa fa-search"></i></button>
                            </span>
                            
                        </form>
                        </div> --%>
						<%-- <c:forEach var="item" items="${newgroup.groupMembers}" varStatus="status">
							<div>
							<input name="groupMembers[${status.index}]" value="">
							</div>
						</c:forEach> --%>
						<!-- //<input type="submit" value="g"> -->
                
                <!-- <div id = "occMem" style="width:50%; float:left;">
                	<label>Added Members</label>
                	<hr>
                </div> --> 
	<script type="text/javascript">
	<!--	
		$("#idSearch").click(function(e){
			alert($("#emailName").val());
			$("#occMem").append($("#emailName").val());
			$("#occMem").append("<br>");
		}); 
	-->
		$("#duplcheck").click(function(e){
			$.ajax({
				url : "groupCheck.do",
				type : "post",
				dataType : "text",
				data : "gname="+$("#groupName").val(),
				
				success : function(data){
					var jsonObj = $.parseJSON(data);
					if(jsonObj.code == "2"){
						var ans = confirm(jsonObj.msg + "\ncreate?");
						if(ans == true){
							$("#groupadd").submit();
						}else{
							$("#groupName").val("");
						}
					}else{
						$("#groupName").val("");
					}
					
				},
				error : function(err){
					alert("!");
				}
			});
		});
		
	</script>
</body>
</html>
