<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gallery <b class="caret"></b></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="works.html">Simple gallery</a></li>
									<li><a href="works2.html">With text</a></li>
									<li><a href="works3.html">With filter</a></li>
									<li class="divider"></li>
									<li><a href="works-single.html">Single project</a></li>
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
			<form:form commandName="member" id="memberForm" action="register.do" method="post">
	        <form:input path="name" class="input-block-level" id="name" placeholder="Enter your Name"/>
	        <form:input path="email" class="input-block-level" id="email" placeholder="Email"/>
	        <form:password path="password" class="input-block-level" id="password" placeholder="Password"/>
	         <form:input path="location" class="input-block-level" id="location" placeholder="Location"/>
	        <div style="display:flex">
	        <label style="margin-right:15px">
	        Gender :	
	        </label> 
	        <form:radiobutton path="gender" value="m" label="Male"/>
	        <form:radiobutton path="gender" value="f" label="Female" />
	        </div>
	        <form:hidden path="profileImg" id="proImg"/>
        	</form:form>
       		<form id="imgUp" enctype="multipart/form-data">
        	<div class="text no-animate" style="position:inherit; margin-left:0; width:100%;%;">
	            <label for="profileImg" class="col-md-2" style="text-align:left">
	                Profile Image:
	            </label>
	            <div class="col-md-10">
	                <input type="file" name="profileImg" id="imgInp" style="width:40%">
	                <img id="blah" src="#" alt="your image" style="width:40%"/> 
	                <button type="button" id="profileSM" class="btn btn-info">
                    Submit
                	</button>
	            </div>        
	        </div>
       		<div class="checkbox margin-top-20" style="text-align:left">
				<label>
					<input type="checkbox">
				I agree with the <a href="#">Terms and Conditions</a>.
				</label>
			</div> 
	    	</form>
         <button type="button" id="memberSM" class="btn btn-large btn-block">
            Register
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
<script>

	
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
			alert(this.value); //선택한 이미지 경로 표시
			readURL(this);
			
		});
	});
	
	$("#profileSM").click(function (e) {
		$("#profileSM").hide();
	});
	
	$("#memberSM").click(function(e){
		var form = $('#imgUp');
		form.ajaxSubmit({
			url: 'profileUp.do',
			data: form.serialize(),  //폼의 값들을 주소화하여 보내게 됩니다.
			type: 'post',     
			success: function(data){
				console.log(data);
				$("#proImg").val(data); 
				$("#memberForm").submit();
			}
		});
	});
	
	
	
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