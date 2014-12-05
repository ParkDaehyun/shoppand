<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Shoppand - 쇼핑공동체</title>
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
					<a class="brand goTop" href="#">Shoppand</a>
					<div class="nav-collapse pull-right">
						<ul class="nav">
							<c:choose>
								<c:when test="${empty sessionScope.userInfo}">
									<li class="active"><a href="index.jsp">Home</a></li>
									<li><a href="loginForm.do">Login</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="groupIndex.do">Home</a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">내 쇼핑 탐방<b class="caret"></b></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="aboutUser.do?user=${sessionScope.userInfo.email}">내 정보</a></li>
											<li><a href="recommendShareList.do">나를 위한 추천</a></li>
										</ul>
									</li>
									<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" class="sessionCheck">내 그룹 쇼핑<b class="caret"></b></a>
										<ul class="dropdown-menu" role="menu">
											<c:forEach items="${sessionScope.userInfo.memberGroups}" var="groups">
												<li><a href="categoryshare.do?groupId=${groups.groupId}&item=all&pageNum=0">${groups.groupName}</a></li>
											</c:forEach>
										</ul>
									</li>
									<li><a href="logout.do">${sessionScope.userInfo.name}님 로그아웃</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>	
				</div>	
			</div>
		</div>		
		<div class="parallax " style="background-image: url(images/bg1.jpg);">
			<div class="text ">
				<h1>${sessionScope.userInfo.name}</h1>
				<p>님 환영합니다</p>
				
			</div>
		</div>

		<section class="text-block">	
			<div class="light-bg">
				<div class="container">
					<h2 class="with-border">About us <small class="color">/ Who we are</small></h2>
					<div class="section clearfix">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae tincidunt ligula. In in tempor mauris. Integer ornare orci in massa mollis ultrices pellentesque sed odio. Integer consectetur varius magna, et tincidunt justo porttitor id. Maecenas vitae consectetur nunc, sit amet tempor nibh. Integer ac enim at augue auctor fermentum. Phasellus eleifend elementum felis vitae consequat. Proin velit neque, suscipit non viverra quis, pharetra vitae nisl. Donec mauris neque, suscipit nec eleifend nec, tristique sed mi. Sed sed suscipit sapien, non aliquet orci. </p>
						<p>Nam non lorem ornare, gravida orci eu, vestibulum nisl. Ut ac dapibus mauris. Aenean dictum sit amet diam ac porttitor. Suspendisse a magna nec eros luctus tempor ut quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc consectetur sit amet lorem a sagittis. Mauris mattis, mi egestas molestie pharetra, sem neque porttitor erat, eu rutrum tellus risus vel ante. Vestibulum posuere eget ipsum sit amet suscipit. Praesent non eleifend sem, a vestibulum enim. Nulla sed vestibulum turpis. Pellentesque sed volutpat tellus. Aliquam congue consectetur bibendum. Praesent vehicula et elit gravida tempor. Sed eu aliquam libero. </p>
					</div>
					<div class="row-fluid section">
						<div class="span6">
							<h3 class="with-border">Our Skills</h3>
							<div class="progress-block">
								<div class="progress">
									<div class="bar" style="width: 80%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Design</a>
									<span class="value">80%</span>
								</div>
								<div class="progress">
									<div class="bar " style="width: 75%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Development</a>
									<span class="value">75%</span>
								</div>
								<div class="progress">
									<div class="bar" style="width: 40%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Branding</a>
									<span class="value">40%</span>
								</div>	
								<div class="progress">
									<div class="bar" style="width: 60%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Usability</a>
									<span class="value">60%</span>
								</div>	
								<div class="progress">
									<div class="bar" style="width: 100%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Concepts</a>
									<span class="value">100%</span>
								</div>	
							</div>
						</div>
						<div class="span6">
							<h3 class="with-border">Watch who we are</h3>
							<div class="videoWrapper">
								<iframe src="http://player.vimeo.com/video/20596477?color=39ae77" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
							</div>						</div>
					</div>
					
					<div class="text-center">
						<a class="btn btn-large" href="contacts.html">Contact us</a>
					</div>
				</div>
			</div>	
			<div class="dark-bg">
				<div class="container">
					<h2 class="with-border">Meet our Team</h2>
					<ul class="thumbnails section">
							<div class="row">
								<c:forEach items="${group.groupMembers}" var="g">
								<c:choose>
									<c:when test="${g.email == group.founder}" >
									<li class="span4">
										<div class="thumbnail">
											<div class="img-wrap">
												<div class="black-bg">
													<div class="hover-block">
														<h4>Have a question? Write!</h4>
														<ul class="link-block">
															<li><a href="#"><i class="icon-linkedin-sign"></i></a></li>
															<li><a href="#"><i class="icon-twitter-sign"></i></a></li>
															<li><a href="#"><i class="icon-facebook-sign"></i></a></li>
															<li><a href="#"><i class="icon-google-plus-sign"></i></a></li>
														</ul>
													</div>
												</div>
												<img src="images/team.jpg" alt=""/>
											</div>	
											<h3 class="with-border">${g.name} <small class="color">- founder</small></h3>
											<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
										</div>	
									</li>
									</c:when>
									<c:otherwise>
									<li class="span4">
										<div class="thumbnail">
											<div class="img-wrap">
												<div class="black-bg">
													<div class="hover-block">
														<h4>Have a question? Write!</h4>
														<ul class="link-block">
															<li><a href="#"><i class="icon-linkedin-sign"></i></a></li>
															<li><a href="#"><i class="icon-twitter-sign"></i></a></li>
															<li><a href="#"><i class="icon-facebook-sign"></i></a></li>
															<li><a href="#"><i class="icon-google-plus-sign"></i></a></li>
														</ul>
													</div>
												</div>
												<img src="images/team.jpg" alt=""/>
											</div>	
											<h3 class="with-border">${g.name} <small class="color">- chief technology officer</small></h3>
											<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
										</div>	
									</li>
									</c:otherwise>
								</c:choose>
								</c:forEach>
								<!-- <li class="span4">
									<div class="thumbnail">
										<div class="img-wrap">
											<div class="black-bg">
												<div class="hover-block">
													<h4>Have a question? Write!</h4>
													<ul class="link-block">
														<li><a href="#"><i class="icon-linkedin-sign"></i></a></li>
														<li><a href="#"><i class="icon-twitter-sign"></i></a></li>
														<li><a href="#"><i class="icon-facebook-sign"></i></a></li>
														<li><a href="#"><i class="icon-google-plus-sign"></i></a></li>
													</ul>
												</div>
											</div>
											<img src="images/team2.jpg" alt=""/>
										</div>	
										<h3 class="with-border">Hanna Daer <small class="color">- talented designer</small></h3>
										<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
									</div>	
								</li>
								<li class="span4">
									<div class="thumbnail">
										<div class="img-wrap">
											<div class="black-bg">
												<div class="hover-block">
													<h4>Have a question? Write!</h4>
													<ul class="link-block">
														<li><a href="#"><i class="icon-linkedin-sign"></i></a></li>
														<li><a href="#"><i class="icon-twitter-sign"></i></a></li>
														<li><a href="#"><i class="icon-facebook-sign"></i></a></li>
														<li><a href="#"><i class="icon-google-plus-sign"></i></a></li>
													</ul>
												</div>
											</div>
											<img src="images/team3.jpg" alt=""/>
										</div>	
										<h3 class="with-border">Betty Simpson <small class="color">- great programmer</small></h3>
										<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
									</div>	
								</li>
							</div>
							<div class="row">	
								<li class="span4">
									<div class="thumbnail">
										<div class="img-wrap">
											<div class="black-bg">
												<div class="hover-block">
													<h4>Have a question? Write!</h4>
													<ul class="link-block">
														<li><a href="#"><i class="icon-linkedin-sign"></i></a></li>
														<li><a href="#"><i class="icon-twitter-sign"></i></a></li>
														<li><a href="#"><i class="icon-facebook-sign"></i></a></li>
														<li><a href="#"><i class="icon-google-plus-sign"></i></a></li>
													</ul>
												</div>
											</div>
											<img src="images/team2.jpg" alt=""/>
										</div>	
										<h3 class="with-border">Hanna Daer <small class="color">- talented designer</small></h3>
										<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
									</div>	
								</li>
								<li class="span4">
									<div class="thumbnail">
										<div class="img-wrap">
											<div class="black-bg">
												<div class="hover-block">
													<h4>Have a question? Write!</h4>
													<ul class="link-block">
														<li><a href="#"><i class="icon-linkedin-sign"></i></a></li>
														<li><a href="#"><i class="icon-twitter-sign"></i></a></li>
														<li><a href="#"><i class="icon-facebook-sign"></i></a></li>
														<li><a href="#"><i class="icon-google-plus-sign"></i></a></li>
													</ul>
												</div>
											</div>
											<img src="images/team3.jpg" alt=""/>
										</div>	
										<h3 class="with-border">Betty Simpson <small class="color">- great programmer</small></h3>
										<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
									</div>	
								</li>
								<li class="span4">
									<div class="thumbnail">
										<div class="img-wrap">
											<div class="black-bg">
												<div class="hover-block">
													<h4>Have a question? Write!</h4>
													<ul class="link-block">
														<li><a href="#"><i class="icon-linkedin-sign"></i></a></li>
														<li><a href="#"><i class="icon-twitter-sign"></i></a></li>
														<li><a href="#"><i class="icon-facebook-sign"></i></a></li>
														<li><a href="#"><i class="icon-google-plus-sign"></i></a></li>
													</ul>
												</div>
											</div>
											<img src="images/team.jpg" alt=""/>
										</div>	
										<h3 class="with-border">Mili Sofier <small class="color">- chief technology officer</small></h3>
										<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
									</div>	
								</li> -->
							</div>	
						</ul>
				</div>	
			</div>	
		</section>	
		
		<div class="bottom-parallax small-view" style="background-image: url(images/bg1.jpg);">
			<div class="black-bg">
				<div class="container">
					<div class="row-fluid">
						
	<a href="groupForm.do">make</a>
						<div class="span9">
							<c:forEach items="${groups}" var="group">
							${group.groupName }
							</c:forEach>
							<h3>Want to get started?</h3>
							<h4>Nullam iaculis dictum ullamcorper. In vitae pellentesque massa. Vivamus viverra libero dapibus, sodales lectus a, consectetur ante.</h4>
						</div>
						<div class="span3">
							<a class="btn btn-large" href="#">Contact us</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<footer>
			<div class="light-bg">
				<div class="container">
					<div class="row-fluid">
						<div class="span3">
							<h4>Get in touch</h4>
							<div class="info-block">
								<article class="clearfix">
									<i class="icon-globe"></i>
									<address>
										경기도 성남시 분당구<br/>
										정자동 불정로 6<br/>
										NAVER 그린팩토리 9층	
									</address>
								</article>
								<article class="clearfix">
									<i class="icon-phone"></i>
									<p>010 9270 0024</p>
								</article>
								<article class="clearfix">	
									<i class="icon-envelope"></i>
									<p><a href="mailto:0605pdh@naver.com">0605pdh@naver.com</a></p>
								</article>	
							</div>	
						</div>
						<div class="span3">
							<h4>Follow us</h4>
							<div class="social">
								<ul class="unstyled clearfix">
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-twitter"></i>
										</a>
									</li>
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-facebook"></i>
										</a>
									</li>
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-github"></i>
										</a>
									</li>
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-linkedin"></i>
										</a>
									</li>
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-pinterest"></i>
										</a>
									</li>
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-google-plus"></i>
										</a>
									</li>
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-vk"></i>
										</a>
									</li>
									<li>
										<a target="_blank" title="" href="#">
											<i class="icon-rss"></i>
										</a>
									</li>
								</ul>
							</div>	
						</div>
						<div class="span3">
							<h4>Recent posts</h4>
							<ul class="link-list">
								<li><a href="#">Lorem ipsum dolor sit amet</a></li>
								<li><a href="#">Cum maiestatis necessitatibus ad</a></li>
								<li><a href="#">Dicat tantas copiosae eam id</a></li>
								<li><a href="#">Theophrastus, dicat tantas</a></li>
								<li><a href="#">Cras metus elit, consectetur sed</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a></li>
							</ul>
						</div>
						<div class="span3">
							<h4>Photostream</h4>
							<ul class="footer-thumbnails unstyled clearfix">
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
								<li class="stream">
									<a href="#">
										<img src="http://dummyimage.com/45x45/243135/fff" alt="">
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>	
			</div>	
			<div class="copyright-block dark-bg clearfix">
				<div class="container">
					<div class="pull-left">
						<p class="pull-left">Copyright &copy; 2013 by <a href="http://www.frosenka.ru" target="_blank">frosenka</a>. All Rights Reserved</p>
					</div>	
					<div class="pull-right">
						<p>Thanks <a href="http://www.unsplash.com" target="_blank">ooomf</a> for the pictures</p>
					</div>	
				</div>
			</div>	
		</footer>
		<a class="goTop goTop-link"><i class="icon-angle-up"></i></a>
		<script type="text/javascript">
		$(".sessionCheck").click(function() {
			if ("${sessionScope.userInfo.email}" == ""){ 
				alert("로그인 후 이용해 주세요.");
				$(this).attr("href","#");
			}
		});
		</script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
		<script src="js/jquery.colorbox-min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>