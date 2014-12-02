<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<% String toDate = new java.text.SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(new java.util.Date()); %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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
				<h1>Blog</h1>
				<p>Single page without sidebar</p>
			</div>
		</div>
		
		<section class="text-block">
			<div class="light-bg">
				<div class="container">
					<div class="single-blog">
						<h2>${share.title}</h2>
						<div class="info-panel clearfix">
							<span><time datetime=""><i class="icon-calendar"></i> ${share.writingDate}</time></span>
							<span><i class="icon-user"></i> By ${share.writer} </span>
							<span><i class="icon-tags"></i> <a href="#"><c:choose><c:when test="${share.category=='fashion'}">패션, 뷰티</c:when><c:when test="${share.category=='living'}">가구, 생활</c:when><c:when test="${share.category=='elect'}">컴퓨터, 가전</c:when><c:otherwise>취미, 자동차</c:otherwise></c:choose></a> </span>
							<span><i class="icon-comments"></i> With <a href="#">${share.replyCount} comments</a></span>
						</div>	
						<div id="shareCon" class="sigle-text" style="min-height:500px;">
							<div class="img-wrap pull-right span6" style="overflow:visible; max-height:100%;">
								<img id="shareImg" src="images/shareImgs/${share.imgName}" alt=""/>
								<c:forEach var="inlist" items="${share.items}" begin="0" step="1">
									<div style="position:absolute; top:${inlist.ypos}%; left:${inlist.xpos}%;" >
									<%-- data-placement="popfunc(${inlist.xpos},${inlist.ypos});" --%>
									<%-- '<c:choose><c:when test='${inlist.ypos} lt 20'>bottom</c:when><c:when test='${inlist.xpos} lt 20'>right</c:when><c:when test='${inlist.xpos} gt 80'>left</c:when><c:otherwise>top</c:otherwise></c:choose>' --%>
										<a data-content="<a href='${inlist.link}' target=_blank>${inlist.price}원</a>" data-html="true" title="" data-placement="top" data-toggle="popover" rel="popover" data-original-title="${inlist.itemName}" >
											<img src="images/frame.png" width="20px" onmouseover="onmouse(this)" onmouseout="outmouse(this)"> 											
										</a>
									</div>
								</c:forEach>
							</div>
							  <br>
							  ${share.info}
						</div>						
						<div class="section">
							<h3 class="with-border"><i class="icon-comments"></i> ${share.replyCount} comments</h3>
							<div class="row-fluid section">
								<div class="span9">
									<!-- <div class="media">
										<a class="pull-left" href="#">
											<img class="media-object" src="images/team.jpg">
										</a>
										<div class="media-body">
											<div class="clearfix">
												<h4 class="media-heading">Admin</h4>
												<p>Cras sit amet nibh libero, in gravida nulla.</p>
												<time datetime="" class="pull-left">57 minutes ago</time>
												<a href="#" class="pull-right"><i class="icon-share-alt"></i> Reply</a>
											</div>	
										</div>
									</div>
									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object" src="images/team.jpg">
										</a>
										<div class="media-body">
											<div class="clearfix">
												<h4 class="media-heading">Admin</h4>
												<p>In varius eros nibh, sed euismod dolor congue vel.</p>
												<time datetime="" class="pull-left">50 minutes ago</time>
												<a href="#" class="pull-right"><i class="icon-share-alt"></i> Reply</a>
											</div>
											<div class="media">
												<a class="pull-left" href="#">
													<img class="media-object" src="images/team2.jpg">
												</a>
												<div class="media-body">
													<div class="clearfix">
														<h4 class="media-heading">Mili Sofier</h4>
														<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis....</p>
														<time datetime="" class="pull-left">45 minutes ago</time>
														<a href="#" class="pull-right"><i class="icon-share-alt"></i> Reply</a>
													</div>	
												</div>
											</div>
											<div class="media">
												<a class="pull-left" href="#">
													<img class="media-object" src="images/team2.jpg">
												</a>
												<div class="media-body">
													<div class="clearfix">
														<h4 class="media-heading">Mili Sofier</h4>
														<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis....</p>
														<time datetime="" class="pull-left">39 minutes ago</time>
														<a href="#" class="pull-right"><i class="icon-share-alt"></i> Reply</a>
													</div>	
												</div>
											</div>
										</div>
									</div> -->
									<c:forEach items="${share.replies}" var="reply">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object" src="images/profileImgs/${reply.member.profileImg}">
											</a>
											<div class="media-body">
												<div class="clearfix">
													<h4 class="media-heading">${reply.member.name}</h4>
													<p>${reply.rpContents}</p>
													<time datetime="" class="pull-left">${reply.rpDate}</time>
													<!-- <a href="#" class="pull-right"><i class="icon-share-alt"></i> Reply</a> -->
												</div>	
											</div>
										</div>
									</c:forEach>
									
								</div>	
								<div class="span3"></div>
							</div>	
							<div class="row-fluid">	
								<div class="span9">	
									<h4>Add comment</h4>
									<form id="replyForm" class="form margin-top-15" action="addReply.do" accept-charset="UTF-8">
										<input type="hidden" value="${share.group.groupId}" name="groupId">
										<input type="hidden" value="${share.shareId}" name="shareId">
										<input type="hidden" value="${sessionScope.userInfo.email}" name="rpWriter">
										<input type="hidden" value="<%=toDate %>" name="rpDate">
										<textarea class="span12" placeholder="Message" name="rpContents" rows="7"></textarea>
										<button id="replySM" class="btn pull-right margin-top-15">Send</button>
									</form>
								</div>	
								<div class="span3"><button class="btn btn-large btn-warning" onclick="likeUp(${share.shareId});">추천</button></div>
							</div>
						</div>	
					</div>	
				</div>	
			</div>	
		</section>


		<div class="bottom-parallax small-view" style="background-image: url(images/bg1.jpg);">
			<div class="black-bg">
				<div class="container">
					<div class="row-fluid">
						<div class="span9">
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
		<script src="js/placeholder.js"></script>
        <script src="js/plugins.js"></script>
		<script src="js/jquery.colorbox-min.js"></script>
        <script src="js/main.js"></script>
    </body>
    <script type="text/javascript">
    $(document).ready(function() {
        $('#shareImg').load(function() {
            var imgheight = $('#shareImg').height();
            $('#shareCon').css( "height", imgheight );
       });
	});
    
    function likeUp(shareId, userEmail){
    	$.ajax({
    		url : "likeUp.do",
    		type : "post",
    		dataType : "text",
    		data : "shareId="+shareId,
    		success : function(data){
    			alert(data);
    		},
    		error : function(err){
    			alert(err);
    		}    		
    	});
    }

    function onmouse(img){
		img.src = 'images/onmouseframe.png';
	}
	
	function outmouse(img){
		img.src = 'images/frame.png';
	}
	
	$("#replySM").click(function(e){
		$("#replyForm").submit();
	});
    </script>
</html>
