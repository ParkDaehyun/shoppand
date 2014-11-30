<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body onload="pageChk(${size}, ${pageNum});">
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
									<li><a href="logout.do">${sessionScope.userInfo.name}님 로그아웃</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>	
				</div>	
			</div>
		</div>		
		<div class="parallax" style="background-image: url(images/bg1.jpg);">
			<div class="text">
				<h1>${group.groupName}</h1>
				<p>since ${group.groupDate}</p>
				
			</div>
		</div>
		
		
		
		<section class="text-block">
			<div class="light-bg">
				<div class="container">
					<h2 class="with-border"> Shares <small class="color">/ write something</small><a class="btn pull-right" href="shareUploadForm.do?groupId=${group.groupId}">Post</a></h2>
					<c:choose>
					<c:when test="${empty shares}">
						<c:choose>
						<c:when test="${category=='all'}">
						그룹 내 게시물이 존재하지 않습니다. 첫 게시물을 올려주세요.
						</c:when>
						<c:otherwise>
						해당 카테고리의 게시글이 존재하지 않습니다. 	<a href='javascript:history.back()'>뒤로 가기</a>
						</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
					<div class="row-fluid">
						<div class="span9">
							<ul class="thumbnails">
								<li class="span12">
									<div class="thumbnail">
										<div class="img-wrap">
											<a href="sharecontent.do?shareId=${shares[0].shareId}"><img src="images/shareImgs/${shares[0].imgName}" alt=""/></a>
										</div>	
										<h3>${shares[0].title}</h3>
										<div class="info-panel clearfix">
											<span class="pull-left"><time datetime=""><i class="icon-calendar "></i> ${shares[0].writingDate}</time></span>
											<span class="pull-left"><i class="icon-tags"></i> 추천 ${shares[0].likes}개</span>
											<span class="pull-left"><i class="icon-comments"></i> 댓글 ${shares[0].replyCount}개</span>
											<span class="pull-right"><i class="icon-user"></i> ${shares[0].writer}</span>
										</div>	
										<p>${shares[0].info}</p>
										<a class="btn pull-right" href="sharecontent.do?shareId=${shares[0].shareId}">더 읽기</a>
									</div>	
								</li>
								<c:forEach var="list" items="${shares}" begin="0" step="2" varStatus="s" end="${size-1}">
									<%-- <c:forEach var="eight" items="${group.shares}" varStatus="s2" step="2" begin="${s.index}" end="${s.index+3}"> --%>
									<div class="row">
										<c:forEach var="inlist" items="${shares}" begin="${s.index}" end="${s.index+1}">
										<li class="span6">
											<div class="thumbnail">
												<div class="img-wrap">
													<a href="sharecontent.do?shareId=${inlist.shareId}"><img src="images/shareImgs/${inlist.imgName}" alt=""/></a>
												</div>	
												<h3>${inlist.title}</h3>
												<div class="info-panel clearfix">
													<span class="pull-left"><time datetime=""><i class="icon-calendar "></i> ${inlist.writingDate}</time></span>
													<span class="pull-left"><i class="icon-tags"></i> 추천 ${inlist.likes}개</span>
													<span class="pull-left"><i class="icon-comments"></i> 댓글 ${inlist.replyCount}개</span>
													<span class="pull-right"><i class="icon-user"></i>${inlist.writer}</span>
												</div>	
												<p>${inlist.info}</p>
												<a class="btn pull-right" href="sharecontent.do?shareId=${inlist.shareId}">더 읽기</a>
											</div>	
										</li>
										</c:forEach>
									</div>
									
								</c:forEach>
								
							</ul>	
							<div class="pagination" >
								<ul id="pageSpace">
								</ul>
							</div>
						</div>
						<div class="span3">
							<form class="form">
								<div class="controls controls-row search-row">
									<input class="input-block-level" type="text" placeholder="Search">
									<button class="btn" type="button"><i class="icon-search"></i></button>
								</div>
							</form>
							<article>
								<h4 class="with-border">Categories</h4>
								<ul class="unstyled link-list">
									<li class=""><a href="categoryshare.do?groupId=${group.groupId}&item=all&pageNum=0"><i class="icon-chevron-right"></i> 전체보기</a></li>
									<li class=""><a href="categoryshare.do?groupId=${group.groupId}&item=fashion&pageNum=0"><i class="icon-chevron-right"></i> 패션, 뷰티</a></li>
									<li class=""><a href="categoryshare.do?groupId=${group.groupId}&item=living&pageNum=0"><i class="icon-chevron-right"></i> 가구, 생활</a></li>
									<li class=""><a href="categoryshare.do?groupId=${group.groupId}&item=elect&pageNum=0"><i class="icon-chevron-right"></i> 컴퓨터, 가전</a></li>
									<li class=""><a href="categoryshare.do?groupId=${group.groupId}&item=hobby&pageNum=0"><i class="icon-chevron-right"></i> 취미, 자동차</a></li>
								</ul>
							</article>	
							<article class="section">
								<h4 class="with-border">Tags</h4>
								<ul class="unstyled">
									<a href="#" class="tag btn btn-primary">Web</a>
									<a href="#" class="tag btn btn-primary">Games</a>
									<a href="#" class="tag btn btn-primary">Design</a>
									<a href="#" class="tag btn btn-primary">3D</a>
									<a href="#" class="tag btn btn-primary">jQuery</a>
									<a href="#" class="tag btn btn-primary">C++</a>
									<a href="#" class="tag btn btn-primary">Bootstrap</a>
									<a href="#" class="tag btn btn-primary">Google</a>
									<a href="#" class="tag btn btn-primary">JavaScript</a>
								</ul>
							</article>	
							<article class="section">
								<h4 class="with-border">Featured video</h4>
								<div class="videoWrapper">
									<iframe src="http://player.vimeo.com/video/20596477?color=39ae77" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
								</div>
							</article>	
							<article class="section">
								<h4 class="with-border">Popular Photos</h4>
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
							</article>	
							<article class="section">
								<h4 class="with-border">Recent Comments</h4>
								<ul class="media-list">
									<c:forEach items="${recentComm}" var="reply" >
									<li class="media comments">
										<a class="pull-left" href="#">
											<img class="media-object" src="images/profileImgs/${reply.member.profileImg}">
										</a>
										<div class="media-body">
											<h5>
												<a href="#">${reply.member.name}</a>
												in
												<a href="sharecontent.do?shareId=${reply.share.shareId}">${reply.share.title}</a>
											</h5>
											<p>${reply.rpContents}</p>
										</div>
									</li>
									</c:forEach>
									<!-- 
									<li class="media comments">
										<a class="pull-left" href="#">
											<img class="media-object" src="images/team2.jpg">
										</a>
										<div class="media-body">
											<h5>
												<a href="#">Admin</a>
												in
												<a href="#">Aenean ac interdum ligula</a>
											</h5>
											<p>In varius eros nibh, sed euismod dolor congue vel. Sed auctor aliquet velit, gravida pharetra turpis fermentum ut...</p>
										</div>
									</li>
									<li class="media comments">
										<a class="pull-left" href="#">
											<img class="media-object" src="images/team3.jpg">
										</a>
										<div class="media-body">
											<h5>
												<a href="#">Andrew</a>
												in
												<a href="#">Nam mattis enim eu nibh facilisis sollicitudin</a>
											</h5>
											<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus...</p>
										</div>
									</li> -->
								</ul>
							</article>	
							<article class="section">
								<h4 class="with-border">Text Widget</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac interdum ligula. Nullam iaculis dictum ullamcorper. In vitae pellentesque massa. Vivamus viverra libero dapibus, sodales lectus a, consectetur ante. </p>
							</article>	
						</div>
					</div>
					</c:otherwise>
					</c:choose>
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
												<img src="images/profileImgs/${g.profileImg}" alt=""/>
											</div>	
											<h3 class="with-border"><a href="aboutUser.do?user=${g.email}">${g.name}</a> <small class="color">- 그룹장</small></h3>
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
												<img src="images/profileImgs/${g.profileImg}" alt=""/>
											</div>	
											<h3 class="with-border"><a href="aboutUser.do?user=${g.email}">${g.name}</a>  <small class="color">- 그룹원</small></h3>
											<p>Pellentesque ornare, risus et vulputate mollis, massa nulla aliquam neque, sed hendrerit orci quam eget ante.</p>
										</div>	
									</li>
									</c:otherwise>
								</c:choose>
								</c:forEach>
							</div>	
						</ul>
				</div>	
			</div>
		</section>


		<div class="bottom-parallax small-view" style="background-image: url(images/bg1.jpg);">
			<div class="black-bg">
				<div class="container">
					<div class="row-fluid">
						<div class="span9">
							<h3>그룹원을 더 추가하시겠어요?</h3>
							<h4>그룹원은 그룹장만이 추가할 수 있습니다.</h4>
						</div>
						<div class="span3">
							<a class="btn btn-large" href="addMemberForm.do?groupId=${group.groupId}">그룹원 추가하기</a>
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
										2425 West Boli Blvd. Suite 421.<br/>
										City, Merils. United States,<br/>
										Zip Code, 123456.	
									</address>
								</article>
								<article class="clearfix">
									<i class="icon-phone"></i>
									<p>8 417 274 2933</p>
								</article>
								<article class="clearfix">	
									<i class="icon-envelope"></i>
									<p><a href="mailto:bootstrap@twitter.com">bootstrap@twitter.com</a></p>
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
		<script src="js/placeholder.js"></script>
		<script src="js/jquery.colorbox-min.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript">
        function pageChk(size, pageNum){
        	pageSize = size/8;
        	var order = Math.floor(pageNum/4.01)*5;
        	if(pageSize>order+5){
        		pageSize = order+5;
        	}
        	if(pageNum<5){
        		$("#pageSpace").append("<li class='disabled'><a href='#'>Prev</a></li>");
        	}else{
        		$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+(order-5)+"' onclick='prePage("+size+","+pageNum+","+(order-5)+")'>Prev</a></li>");
        	}
        	for(i=order; i<pageSize; i++){
        		if(i==pageNum){
        			$("#pageSpace").append("<li class='pagebtn active'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+i+"'>"+(i+1)+"</a></li>");
        		}else{
        			$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+i+"'>"+(i+1)+"</a></li>");
        		}
        	}
        	if(pageSize==order+5){
        		$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+pageSize+"' onclick='nextPage("+size+","+pageNum+","+(order+5)+");'>Next</a></li>");
        	}else{
        		$("#pageSpace").append("<li class='disabled'><a href='#'>Next</a></li>");
        	}
		};
		
		function prePage(size, pageNum, order){
			pageSize = size/8;
			if(pageSize>order+5){
				pageSize = order+5;
			}
			$("#pageSpace").empty();
			if(order<=0){
        		$("#pageSpace").append("<li class='disabled'><a href='#'>Prev</a></li>");
        	}else{
				$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+(order-5)+"' onclick='prePage("+size+","+pageNum+","+(order-5)+")'>Prev</a></li>");
        	}
			for(i=order; i<pageSize; i++){
        		if(i==pageNum){
        			$("#pageSpace").append("<li class='pagebtn active'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+i+"'>"+(i+1)+"</a></li>");
        		}else{
        			$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+i+"'>"+(i+1)+"</a></li>");
        		}
        	}
			if(pageSize==order+5){
        		$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+pageSize+"' onclick='nextPage("+size+","+pageNum+","+(order+5)+");'>Next</a></li>");
        	}else{
        		$("#pageSpace").append("<li class='disabled'><a href='#'>Next</a></li>");
        	}
		};
		
		function nextPage(size, pageNum, order){
			pageSize = size/8;
			if(pageSize>order+5){
				pageSize = order+5;
			}
			$("#pageSpace").empty();
			$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+(order-5)+"' onclick='prePage("+size+","+pageNum+","+(order-5)+")'>Prev</a></li>");
			for(i=order; i<pageSize; i++){
        		if(i==pageNum){
        			$("#pageSpace").append("<li class='pagebtn active'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+i+"'>"+(i+1)+"</a></li>");
        		}else{
        			$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+i+"'>"+(i+1)+"</a></li>");
        		}
        	}
			if(pageSize==order+5){
        		$("#pageSpace").append("<li class='pagebtn'><a href='categoryshare.do?groupId=${group.groupId}&item=${category}&pageNum="+pageSize+"' onclick='nextPage("+size+","+pageNum+","+(order+5)+");'>Next</a></li>");
        	}else{
        		$("#pageSpace").append("<li class='disabled'><a href='#'>Next</a></li>");
        	}			
		};
        </script>
    </body>
</html>