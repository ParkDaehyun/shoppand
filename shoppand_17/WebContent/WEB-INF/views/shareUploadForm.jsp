<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
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
    
    	<% String toDate = new java.text.SimpleDateFormat("yyyy.MM.dd     HH:mm:ss").format(new java.util.Date()); %>
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
							<li><a href="index.html">Home</a></li>
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
			<form:form commandName="share" id="shareForm" action="shareUp.do" method="post">
			<div class="text no-animate" style="height:80%; width:30%; margin-left:-45%; position:absolute;">
			<!-- 	<h1>Share Upload</h1><br> -->
	        <form:hidden path="writer" value="${userInfo.email}"/>
	        <form:hidden path="writingDate" value="${toDate}"/>
	        <form:input path="title" class="input-block-level" id="title" placeholder="Title"/>
	        <form:hidden path="imgName" id="imgName"/>
	    	<form:input path="info" class="input-block-level" id="info" placeholder="Comments" style="height:80%;"/>
	    	<button type="button" id="shareSM" class="btn btn-large btn-block">
	            Post
	         </button>
	    	</div>
        	<div class="text no-animate" style="height:80%; width:60%;  margin-left:-12%; position:absolute;">
	            <div class="col-md-10" style="margin-left:10%; width:80%; height:80%;" >
	                <img id="blah" src="#" alt="your image" style="width:100%; height:100%;"/>
	            </div>
	            <input type="file" name="profileImg" id="imgInp">
	                <button type="button" id="profileSM" class="btn btn-info">
	                   Submit
	               	</button>
	    	</div>
	    	</form:form>
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
	            var reader = new FileReader(); //������ �б� ���� FileReader��ü ����
	            reader.onload = function (e) { 
	            //���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯
	                $('#blah').attr('src', e.target.result);
	                //�̹��� Tag�� SRC�Ӽ��� �о���� File������ ����
	                //(�Ʒ� �ڵ忡�� �о���� dataURL����)
	            };                   
	            reader.readAsDataURL(input.files[0]);
	            //File������ �о� dataURL������ ���ڿ��� ����
    	    }
		}//readURL()--

		//file ������� �̹����� ����(���� ����) �Ǿ����� ó���ϴ� �ڵ�
		$("#imgInp").change(function(e){
			alert(this.value); //������ �̹��� ��� ǥ��
			readURL(this);
			
		});
	});
	
	$("#profileSM").click(function (e) {
		$("#profileSM").hide();
	});
	
	$("#shareSM").click(function(e){
		var form = $('#imgUp');
		form.ajaxSubmit({
			url: 'shareImgUp.do',
			data: form.serialize(),  //���� ������ �ּ�ȭ�Ͽ� ������ �˴ϴ�.
			type: 'post',     
			success: function(data){
				console.log(data);
				$("#proImg").val(data); 
				$("#shareForm").submit();
			}
		});
	});
	
	
	
	/* 
		var form = $('#imgUp');
			form.submit(function(e){
				$.ajax({
					url: 'profileUp.do',
					data: form.serialize(),  //���� ������ �ּ�ȭ�Ͽ� ������ �˴ϴ�.
					type: 'POST',     
					success: function(data){
						$('#imgInp').val('');                           //file input�� �� �ִ� ���� ����ݴϴ�.
						console.log(data);                      //���ε� �Ǿ��ٸ� ����� �ֿܼ� ����غ��ϴ�.
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