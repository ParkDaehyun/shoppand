<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<div class="parallax no-animate large-view form-page" style="background-image: url(images/bg1.jpg);">	
			<div class="text no-animate">
				<h2> ${group.groupName}의 다음 멤버는?</h2><br>
			
			<form>
	            <input type="text" class="form-control" id="emailName">
		             <button class="btn" type="button" id="idSearch">Search</button>
            </form>
			<div id="alertdiv">
	         
	         </div>
        	<div id = "occMem">
                	<label>Added Members</label>
                	<c:forEach items="${group.groupMembers}" var="mem">
                	${mem.name}(${mem.email})<br>
                	</c:forEach>
            </div>
            <br>
            <button class="btn btn-block" type="button" id="done" onclick="location.href='categoryshare.do?groupId=${group.groupId}&item=all&pageNum=0'">Done</button> 
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

            
                       
                     
                        
                        
	<script type="text/javascript">
		
		$("#idSearch").click(function(e){
			$.ajax({
				url : "chkGroupMember.do",
				type : "post",
				dataType : "text",
				data : "addmail="+$("#emailName").val() + "&groupId=${group.groupId}",
				success : function(data){
					if(data == "1"){
						$("#alertdiv").empty();
						$("#alertdiv").append("<div class='alert alert-block alert-error fade in'><button class='close' data-dismiss='alert' type='button'>×</button><h4 class='alert-heading'>존재하지 않는 메일주소입니다.</h4></div>");
						$("#emailName").val("");
						//$("#groupMem").append("<input name='groupMembers[${status.index}]' value="+ gmagak +">");
					}else if(data == "2"){
						$("#alertdiv").empty();
						$("#alertdiv").append("<div class='alert alert-block alert-error fade in'><button class='close' data-dismiss='alert' type='button'>×</button><h4 class='alert-heading'>이미 등록된 사용자입니다.</h4></div>");
						$("#emailName").val("");
					}else{
						$("#alertdiv").empty();
						$("#alertdiv").append("<div class='alert alert-success alert-block fade in'><button class='close' data-dismiss='alert' type='button'>×</button><h4 class='alert-heading'>"+data+"님을 추가하시겠습니까?</h4><p>Change this and that and try again.</p><p><a class='btn' href='javascript:memberaddOk();'>등록하기</a><a class='btn' href='javascript:memberRe();'>회원 다시 검색</a></p></div>");
						//alert($("#emailName").val()+"님은 등록할 수 없는 사용자입니다.");
						
						
					}
				},
				error : function(err){
					alert("!");
				}
			});
			
			
		}); 
		
		function memberaddOk(){
			$.ajax({
				url : "addGroupMember.do",
				type : "post",
				dataType : "text",
				data : "addmail="+$("#emailName").val() + "&groupId=${group.groupId}",
				success : function(data){
					$("#occMem").append(data + "(" + $("#emailName").val() + ") <br>");
				},
				error : function(err){
					alert("오류");
				}
			});
		}
			
		function memberRe(){
			$("#emailName").val("");
			$("#alertdiv").empty();
		}
		//"group="+${group.groupId}+
		/* $("#duplcheck").click(function(e){
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
		}); */
		
		function groupadd(){
			alert("!");
		}
	</script>
</body>
</html>
