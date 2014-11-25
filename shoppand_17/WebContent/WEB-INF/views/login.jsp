<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
							<c:choose>
								<c:when test="${empty sessionScope.userInfo}">
									<li class="active"><a href="index.jsp">Home</a></li>
									<li><a href="loginForm.do">Login</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="groupIndex.do">Home</a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages  <b class="caret"></b></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="aboutUser.do?user=${sessionScope.userInfo.email}">About Me</a></li>
										</ul>
									</li>
									<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" class="sessionCheck">My groups <b class="caret"></b></a>
										<ul class="dropdown-menu" role="menu">
											<c:forEach items="${sessionScope.userInfo.memberGroups}" var="groups">
												<li><a href="categoryshare.do?groupId=${groups.groupId}&item=all&pageNum=0">${groups.groupName}</a></li>
											</c:forEach>
										</ul>
									</li>
									<li><a href="logout.do">${sessionScope.userInfo.name}´Ô ·Î±×¾Æ¿ô</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>	
				</div>	
			</div>
		</div>
		
		<div class="parallax no-animate large-view form-page" style="background-image: url(images/bg1.jpg);">	
			<div class="text no-animate">
				<h1>Login</h1>
				<form class="form" action="login.do" method="post">
					<div class="section">
						<input type="text" class="input-block-level" placeholder="Email" name="email">
						<input type="password" class="input-block-level" placeholder="Password" name="password">
						<div class="margin-top-20 clearfix">
							<!-- <div class="checkbox pull-left">
								<label>
									<input type="checkbox">
									Remember me
								</label>
							</div>	 -->
							<a href="register.do" class="pull-right">È¸¿ø °¡ÀÔ</a>
						</div>
					</div>	
					<button class="btn btn-large btn-block" type="submit">Login</button>
				</form>
			</div>
		</div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
		<script src="js/placeholder.js"></script>
		<script src="js/jquery.colorbox-min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>