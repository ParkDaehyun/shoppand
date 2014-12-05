<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
		
		<!--Css for filter. If you don't need the image filter don't include this file to the project-->
		<link rel="stylesheet" href="css/filter.css">
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
		<div id="welcome" class="parallax large-view" style="background-image: url(images/bggi.jpg);">
			<div class="text logotext">
				<h1>Shop&</h1>
				<p>Shopping with Mates</p>
			</div>
		</div>
		<!-- <div class="parallax" style="background-image: url(images/bg1.jpg);">
			<div class="text">
				<h1>Portfolio</h1>
				<p>Images with filter</p>
			</div>
		</div> -->
		
		<section class="text-block">
			
			<div class="light-bg">
				<div class="container">
					<h2> 내 그룹 최신 글 <small class="color">/ 그룹별</small></h2>
					<p>그룹별 최신 게시물들입니다.</p>
					<ul id="filters" class="unstyled">
						<c:forEach items="${userInfo.memberGroups}" var="group">
							<li data-filter="${group.groupName}"><a class="btn btn-primary">${group.groupName}</a></li>
						</c:forEach>
						<!-- <li data-filter="design"><a class="btn btn-primary">Design</a></li>
						<li data-filter="photo"><a class="btn btn-primary">Photo</a></li>
						<li data-filter="development"><a class="btn btn-primary">Development</a></li>
						<li data-filter="support"><a class="btn btn-primary">Support</a></li>
						<li data-filter="mobile"><a class="btn btn-primary">Mobile</a></li>
						<li data-filter="video"><a class="btn btn-primary">Video</a></li> -->
					</ul>
					<div id="main" role="main">
						<ul id="tiles" class="thumbnails">
							<c:forEach items="${shares}" var="share">
								<li data-filter-class='["${share.group.groupName}"]'>
									<div class="thumbnail">
										<div class="img-wrap">
											<!-- <a href="images/shareImgs/${share.imgName}" class="colorbox">  -->
												<div class="black-bg">
													<i class="icon-zoom-in"></i>
												</div>	
												<img src="images/shareImgs/${share.imgName}" alt="" rel="gal"/>
											</a>
										</div>	
										<h3 class="with-border"><a href="sharecontent.do?shareId=${share.shareId}">${share.title}</a></h3>
										<p>${share.info}</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>	
				</div>
			</div>
		</section>
		
		<div class="bottom-parallax small-view" style="background-image: url(images/bggi.jpg);">
			<div class="black-bg">
				<div class="container">
					<div class="row-fluid">
						<div class="span9">
							<h3>그룹을 새로 만드시겠어요?</h3>
							<h4>본인만의 그룹을 만들어 친구들을 초대해 보세요</h4>
						</div>
						<div class="span3">
							<a class="btn btn-large" href="groupForm.do">그룹 만들기</a>
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
		
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
		<script src="js/jquery.colorbox-min.js"></script>
        <script src="js/main.js"></script>
		
		<!--JS for filter. If you don't need the image filter don't include these files and js-code to the project-->
		<script src="js/jquery.imagesloaded.js"></script>
		<script src="js/jquery.wookmark.min.js"></script>
		
		  <script type="text/javascript">
			(function ($){
			  $('#tiles').imagesLoaded(function() {
				var options = {
				  autoResize: true, 
				  container: $('#main'), 
				  offset: 20, 
				  itemWidth: 250, 
				  outerOffset: 20,
				  flexibleWidth: 400,
				  fillEmptySpace: true,
				  ignoreInactiveItems: false,
				  comparator: function(a, b) {
					return $(a).hasClass('inactive') && !$(b).hasClass('inactive') ? 1 : -1;
				  }
				};
				var handler = $('#tiles li'),
					filters = $('#filters li');

				handler.wookmark(options);

				var onClickFilter = function(event) {
				  var item = $(event.currentTarget),
					  activeFilters = [];

				  if (!item.hasClass('active')) {
					filters.removeClass('active');
				  }
				  item.toggleClass('active');

				  if (item.hasClass('active')) {
					activeFilters.push(item.data('filter'));
				  }

				  handler.wookmarkInstance.filter(activeFilters);
				}

				filters.click(onClickFilter);
			  });
			})(jQuery);
		  </script>
    </body>
</html>