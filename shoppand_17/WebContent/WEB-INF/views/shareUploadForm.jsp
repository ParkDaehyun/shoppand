<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<form:form commandName="share" id="shareForm" action="shareUp.do" method="post">
			<div class="text no-animate" style="height:80%; width:30%; margin-left:-45%; position:absolute;">
			<!-- 	<h1>Share Upload</h1><br> -->
	        <form:hidden path="writer" value="${userInfo.email}"/>
	        <% String toDate = new java.text.SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(new java.util.Date()); %>
	        <form:hidden path="writingDate" value="<%=toDate%>"/>
	        <form:hidden path="replyCount" value="0"/>
	        <form:input path="title" class="input-block-level" id="title" placeholder="Title"/>
	        <form:hidden path="imgName" id="imgName"/>
	    	<form:textarea path="info" class="input-block-level" id="info" placeholder="Comments" style="height:80%; background:url('img/bg-overlay.png'); border-color:#87989E; color:#fff;" wrap="hard" cols="20"/>
	    	<form:hidden path="items" id="ilist"/>
	    	<form:hidden path="group" value="${group.groupId}"/>
	    	<form:select path="accessAuth">
	    		<form:option value="1" label="모두에게 공개"></form:option>
	    		<form:option value="0" label="그룹에만 공개"></form:option>
	    	</form:select>
	    	<form:select path="category">
	    		<form:option value="fashion" label="패션, 뷰티"></form:option>
	    		<form:option value="living" label="가구, 생활"></form:option>
	    		<form:option value="elect" label="컴퓨터, 가전"></form:option>
	    		<form:option value="hobby" label="취미, 자동차"></form:option>
	    	</form:select>
	    	<button type="button" id="shareSM" class="btn btn-large btn-block" >
	            Post
	         </button>
	    	</div>
	    	</form:form>
        	<div id="shareImgForm" class="text no-animate" style="height:80%; width:60%;  margin-left:-12%; position:absolute; padding-left:10px; padding-right:10px;">
        			<!-- 
        		<canvas id = "frameCan" width="200px" height = "200px"></canvas> -->
        		<form id="imgUp" enctype="multipart/form-data" style="height:100%;">
        		
	            <div id="shareImg" style="margin-left:20%; width:60%; height:90%; "  >
	            	<div id="shareImgbox"></div>
	            	<img id="blah"  alt="Please upload your image" onload="img_Resize(this, 600, 600)"/>
	            </div>
	            <input type="button" value="Search files" class="btn"/>
	            <input type="file" name="profileImg" id="imgInp" style="font-size:30px; position:absolute; margin-left:-110px; width:50px; opacity:0;">
	            </form>
	            <div id="taggedbox_1" style="position:absolute; top:10%; width:15%; height:20%; margin-left:2%; background-color:rgba(0,0,0,0.5);"></div>
	            <div id="taggedbox_2" style="position:absolute; top:10%; width:15%; height:20%; margin-left:80%; background-color:rgba(0,0,0,0.5);"></div>
	            <div id="taggedbox_3" style="position:absolute; top:55%; width:15%; height:20%; margin-left:2%; background-color:rgba(0,0,0,0.5);"></div>
	            <div id="taggedbox_4" style="position:absolute; top:55%; width:15%; height:20%; margin-left:80%; background-color:rgba(0,0,0,0.5);"></div>
	    	</div>
	    	
        </div>
		
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Modal header</h3>
			</div>
			<div class="modal-body">
				<p>
					<div id="resultSearch">
					</div>
				</p>
			</div>
			<div class="modal-footer">
				<button id="searchbtn" class="btn">Search</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
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
<script>
	var xpos;
	var ypos;
	var xrate;
	var yrate;
	var boxnum = 1;
	var boxinfo = 0;
	
	$(document).ready(function(){
	    function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	            reader.onload = function (e) { 
	            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	                $('#blah').attr('src', e.target.result);
	                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
	                //(아래 코드에서 읽어들인 dataURL형식)
	            };                   
	            reader.readAsDataURL(input.files[0]);
	            //File내용을 읽어 dataURL형식의 문자열로 저장
    	    }
		}//readURL()--

		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#imgInp").change(function(e){
			//alert(this.value); //선택한 이미지 경로 표시
			readURL(this);
			
		});
	});
	
	
	$("#shareSM").click(function(e){
		var form = $('#imgUp');
		form.ajaxSubmit({
			url: 'shareImgUp.do',
			data: form.serialize(),  //폼의 값들을 주소화하여 보내게 됩니다.
			type: 'post',     
			success: function(data){
				console.log(data);
				$("#imgName").val(data); 
				$("#ilist").val($("#taggedbox_1").val()+","+$("#taggedbox_2").val()+","+$("#taggedbox_3").val()+","+$("#taggedbox_4").val());
				$("#shareForm").submit();
			}
		});
	});
	
	$("#shareImg").click(function(e){
		if(boxinfo == 1){
			$("#shareImgbox").empty();
			boxinfo = 0;
		}else{
			boxinfo = 1;
		xpos = parseInt(e.clientX) - $("#blah").offset().left;
		ypos = parseInt(e.clientY) - $("#blah").offset().top;
		console.log(xpos);
		console.log(ypos);
		var marl = parseInt(e.clientX) - $("#shareImg").offset().left;
		xrate = 100*xpos/$("#blah").width();
		yrate = 100*ypos/$("#blah").height();
		console.log(xrate);
		console.log(yrate);
		var ndiv = $(document.createElement('div'));
		ndiv.attr({id : "tagbox"});
		//ndiv.attr({style : "width : " + Math.floor(loc[2]-loc[0])+"px;" + " height : " + Math.floor(loc[3]-loc[1]) +"px;"});
		$("#shareImgbox").append(ndiv);
		$("#shareImgbox").css("position", "absolute");
		$("#shareImgbox").css("margin-left", marl + "px");
		$("#shareImgbox").css("top", 20 + ypos + "px");
		$("#resultSearch").empty();
		$("#resultSearch").append("<input id='itemKeyword' type='text' name='keyword' placeholder='Search Article'>");
		$("#tagbox").append("<a href='#myModal' role='button' class='btn btn-large' onclick='$(\"#shareImgbox\").empty()' data-toggle='modal'>Add tag</a>");
		}
		/* $("#sbox" + boxnum).css("margin-top", loc[1]);
		$("#sbox" + boxnum).css("margin-left", loc[0]);
		$("#sbox" + boxnum).attr("ondrop", "drop(this, event);");
		$("#sbox" + boxnum).attr("ondragenter", "return false;");
		$("#sbox" + boxnum).attr("ondragover", "return false;"); */
	});
	
	function addTag(link, imgurl, title, price){
		if(boxnum<5){
			console.log(link);
			link = link.replace(/\+/g,'#');
			$.ajax({
				url : 'additemtag.do',
				data : "xpos="+xrate+"&ypos="+yrate+"&price="+price+"&link="+link+"&imgurl="+imgurl+"&itemname="+title,
				type : 'post',
				success : function(data){
					console.log(boxnum-1);
					$("#taggedbox_"+(boxnum-1)).val(data);
					console.log($("#taggedbox_"+(boxnum-1)).val());
				},
				error : function(e){
					alert(e);
				}
			});
			var marl = $("#blah").offset().left- $("#shareImgForm").offset().left + xpos - 20;
			//var marl = 100*xpos/$("#shareImgForm").width() + 19;
			var ndiv = $(document.createElement('div'));
			ndiv.attr({id : "tagbtn"+boxnum });
			$("#shareImgForm").append(ndiv);
			$("#tagbtn"+boxnum).css("position", "absolute");
			$("#tagbtn"+boxnum).css("margin-left", marl + "px");
			$("#tagbtn"+boxnum).css("top", ypos + "px");
			$("#tagbtn"+boxnum).append("<img id='"+boxnum+"' src='images/frame.png' style='width:20px' onmouseover='onmouse(this)' onmouseout='outmouse(this)' onclick='clickimg(this)'>");
			$("#taggedbox_"+boxnum).append("<div id='boxdiv"+boxnum+"' style='font-size:20px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'><img src="+ imgurl+"><br>"+ title +"<br>"+price+"원</div>");
			boxnum++;
		}else{
			alert("!");
		}
	}
	
	function onmouse(img){
		img.src = 'images/onmouseframe.png';
		$("#boxdiv"+img.id).css("border-style","outset");
		$("#boxdiv"+img.id).css("border-color","rgba(158, 233, 200, 0.53)");
		/* alert($("#taggedbox_"+img.id).val()); */
	}
	
	function outmouse(img){
		img.src = 'images/frame.png';
		$("#boxdiv"+img.id).css("border-style","none");
	}
	
	function clickimg(img){
		var ans = confirm("삭제하시겠습니까?");
		if(ans == true){
			$("#boxdiv"+img.id).remove();
			$("#tagbtn"+img.id).remove();
			console.log(img.id);
			console.log($("#taggedbox_"+img.id).val());
			$.ajax({
				url : 'delitemtag.do',
				data : 'itemId='+$("#taggedbox_"+img.id).val(),
				type : 'post',
				success : function(data){
					alert(data);
				}
			});
			var prenum = parseInt(img.id);
			while(prenum<5){
				var nextnum = prenum + 1;
				$("#boxdiv"+nextnum).attr("id","boxdiv"+prenum);
				$boxcut = $("#boxdiv"+prenum).detach();
				$("#taggedbox_"+prenum).val($("#taggedbox_"+nextnum).val());
				$("#taggedbox_"+prenum).append($boxcut);
				$("#tagbtn"+nextnum).attr("id","tagbtn"+prenum);
				$("#"+nextnum).attr("id",prenum);
				prenum++;
			}
			boxnum--;
		}
	}
	
	$("#searchbtn").click(function(e){
		$.ajax({
			url : 'keywordSearch.do',
			data : "keyword="+ $("#itemKeyword").val(),
			type : 'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				$("#resultSearch").empty();
				$("#resultSearch").append("<input id='itemKeyword' type='text' name='keyword' placeholder='Search Article'>");
				var jsonArr = $.parseJSON(data);				
				$("#resultSearch").append("<table id='stable' class='table table-hover' style='width:100%;'> <thead> <tr> <th> </th> <th> image </th> <th> title </th> <th> price </th> </tr> </thead> ");
				$("#stable").append("<tbody>");
				for(var i = 0; i < jsonArr.length; i++){
					var jsonObj = jsonArr[i];
					$("#stable").append("<tr> <td> <button class='btn' onclick='addTag(\""+jsonObj.link+"\",\""+jsonObj.imgUrl+"\",\""+jsonObj.title+"\",\""+jsonObj.price+"\")' data-dismiss='modal' aria-hidden='true'> Tag it </button> </td> <td> <img src="+jsonObj.imgUrl+"></td> <td>" + jsonObj.title+ " </td> <td>"+ jsonObj.price +"</td> </tr>");
				}
				$("#resultSearch").append("</tbody> </table>");
			},
			error : function(err){
				alert("n");
			}
		});
	});
	
	function img_Resize(targetImg, wsize, hsize) //그림의 이미지 사이즈 구하기. 
    { 
	    var imgw; 
	    var imgh; 
	    var timgw; 
	    var timgh;
	    imgw = targetImg.width; 
	    imgh = targetImg.height;
	    if (imgw <= wsize && imgh <= hsize ) { // 사이즈가 공간 보다 크면 같은 비율로 줄여서 보여 준다. 
	     divImg = ""; 
	    } else if (imgw > wsize && imgh <= hsize) { 
	     timgw = wsize; 
	     timgh = (wsize / imgw) * imgh; 
	     divImg = ""; 
	     targetImg.width=timgw;
	      targetImg.height=timgh;
	    } else if (imgw <= wsize && imgh > hsize) { 
	     timgw = (hsize / imgh) * imgw; 
	     timgh = hsize; 
	     divImg = ""; 
	     targetImg.width=timgw;
	      targetImg.height=timgh;
	    } else if (imgw > wsize && imgh > hsize) { 
	     var comp; 
	     if ((wsize/imgw) >= (hsize/imgh)) { 
	      comp = 'W'; 
	     } else { 
	      comp = 'H'; 
	     } 
	     if (comp == 'W') { 
	      timgw = (hsize / imgh) * imgw;
	      timgh = hsize;
	     } else { 
	      timgw = wsize; 
	      timgh = (wsize / imgw) * imgh; 
	     } 
	      targetImg.width=timgw;
	      targetImg.height=timgh;
	    } 
   }
	
	/* 
		var form = $('#imgUp');
			form.submit(function(e){
				$.ajax({
					url: 'profileUp.do',
					data: form.serialize(),  //폼의 값들을 주소화하여 보내게 됩니다.
					type: 'POST',     
					success: function(data){
						$('#imgInp').val('');                           //file input에 들어가 있는 값을 비워줍니다.
						console.log(data);                      //업로드 되었다면 결과를 콘솔에 출력해봅니다.
					}
				});
			});
	 }); */
	/* $("#imgUp").submit(function (e) {
	    var data;

	    data = new FormData();
	    data.append('file', $('#imgInp')[0].files[0]);
		alert(data);
	    $.ajax({
	        url: 'profileUp.do',
	        data: data,
	        processData: false,
	        type: 'POST',

	        // This will override the content type header, 
	        // regardless of whether content is actually sent.
	        // Defaults to 'application/x-www-form-urlencoded'
	       contentType: 'multipart/form-data', 

	       
	        // Now you should be able to do this:
	        mimeType: 'multipart/form-data',    //Property added in 1.5.1

	        success: function (data) {
	            alert(data);
	        }
	    });

	    e.preventDefault();
	}); */	
</script>
</html>