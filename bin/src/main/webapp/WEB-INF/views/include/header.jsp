<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="idck" value=" checked" />
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Happyhouse</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${root}/resources/img/favicon.png" rel="icon">
<link href="${root}/resources/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${root}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${root}/resources/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<link href="${root}/resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${root}/resources/vendor/venobox/venobox.css"
	rel="stylesheet">
<link
	href="${root}/resources/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="${root}/resources/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${root}/resources/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Squadfree - v2.3.1
  * Template URL: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
#aptListTable th {
	position: sticky;
	top: 0px;
	background-color: white !important;
}
</style>
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top header-transparent"
		style="background-color: rgba(40, 40, 40, 0.8)">
		<div class="container d-flex align-items-center">

			<div class="logo mr-auto">
				<h1 class="text-light">
					<a href="/"><span>HAPPYHOUSE</span></a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>

			<nav class="nav-menu d-none d-lg-block">
				<!-- ?????????????????? -->
				<ul>
					<li class="active"><a href="${root}/#hero">Home</a></li>
					<!-- <li><a href="#portfolio">Portfolio</a></li> -->
					<li><a href="${root}/#team">????????? ??????</a></li>
					<li><a href="${root}/map">??????????????????</a></li>
					<li><a href="/category">????????????</a></li>
					<c:if test="${!empty userinfo}">
						<c:if test="${userinfo.id eq 'ssafy'}">
							<li id="userList"><a href="${root}/user/userList">????????????</a></li>
						</c:if>
						<li id="myPage"><a href="${root}/user/user_info">???????????????</a></li>
						<li id="logOut"><a href="${root}/user/logout">????????????</a></li>
					</c:if>
					<c:if test="${empty userinfo}">
						<li id="logIn"><a href="#loginModal" data-toggle="modal">?????????</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>

	<div id="loginModal" class="modal fade">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">?????????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<form id="loginform" class="form-signin w-75 mx-auto m-5"
						method="post" action="">
						<input type="hidden" name="act" id="act" value="login"> <label
							for="userid" class="sr-only">?????????</label> <input type="text"
							id="userid" name="id" class="form-control" placeholder="?????????"
							required autofocus> <label for="userpass" class="sr-only">????????????</label>
						<input type="password" id="userpass" name="pass"
							class="form-control mt-2" placeholder="????????????" required>

						<div class="form-group form-check text-right">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" id="idsave"
								name="idsave" value="saveok" ${idck}> ???????????????
							</label>
						</div>

						<div class="text-danger mb-2">${msg}</div>
						<button class="btn btn-lg btn-primary btn-block" type="button"
							id="loginBtn">?????????</button>
						<button class="btn btn-lg btn-danger btn-block"
							data-dismiss="modal" data-toggle="modal" href="#newModal">????????????</button>
						<p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- ???????????? ?????? ????????? -->
<div id="newModal" class="modal fade">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">????????????</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form class="form-signin w-auto mx-auto m-5" name="memberform"
					id="memberform" method="post" action="">
					<input type="hidden" name="act" id="act" value="register">

					<div class="form-group has-feedback row">
						<label for="id"
							class="col-md-3 control-label text-md-right col-form-label">?????????
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="id"
								name="id" placeholder="" required name="id"
								value="qweadzs"> <i
								class="fa fa-pencil form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="pass"
							class="col-md-3 control-label text-md-right col-form-label">????????????
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="pass"
								placeholder="?????? ?????? ?????? 6?????? ??????" required name="pass"
								value="ehfkdl7"> <i
								class="fa fa-pencil form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="name"
							class="col-md-3 control-label text-md-right col-form-label">??????
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="name"
								name="name" placeholder="User Name" value="?????????"> <i
								class="fa fa-user form-control-feedback pr-4"></i>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<label for="email"
							class="col-md-3 control-label text-md-right col-form-label">?????????
							<span class="text-danger small">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="address" value="qweadzs@naver.com"> <i
								class="fa fa-envelope form-control-feedback pr-4"></i>
						</div>
					</div>

					<button type="button" id="registerBtn1"
						class="btn btn-lg btn-primary btn-block">????????????</button>
					<button class="btn btn-lg btn-secondary btn-block"
						data-dismiss="modal">??????</button>
					<p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="idck" value=" checked" />
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
</c:if>
<script type="text/javascript">
	
	// ????????????
    $("#registerBtn1").click(function () {
    	let registerinfo = JSON.stringify({
    		"id" : $("#id").val(),
    		"name" : $("#name").val(),
    		"pass" : $("#pass").val(),
    		"email" : $("#email").val()
    	});
    	$.ajax({
			url:'${root}/user/',  
			type:'POST',
			contentType:'application/json;charset=UTF-8',
			dataType:'json',
			data: registerinfo,
			success:function(users) {
				console.log(registerinfo);
				/* $("#id").val('');
				$("#name").val('');
				$("#pass").val('');
				$("#email").val(''); */
				$("#newModal").modal("hide");
				/* makeList(users); */
			},
			error:function(xhr,status,msg){
				console.log(registerinfo);
				console.log("????????? : " + status + " Http??????????????? : "+msg);
			}
		});
    });

    // $('#zipcode').focusin(function () {
    //     $('#zipModal').modal();
    // });
        </script>
        <script>	
        	
				$("#pass").keydown(function(key) {
					if (key.keyCode == 13) {
						login();
					}
				});

				$("#loginBtn").click(function() {
					if (!$("#id").val()) {
						alert("????????? ??????!!!");
						return;
					} else if (!$("#pass").val()) {
						alert("???????????? ??????!!!");
						return;
					} else {
						$("#loginform").attr("action", "${root}/user/login").submit();
					}
				});
				$("#mvRegisterBtn").click(function() {
					location.href = "${root}/user/register";
				});
			
	function login() {
		if (!$("#id").val()) {
			alert("????????? ??????!!!");
			return;
		} else if (!$("#pass").val()) {
			alert("???????????? ??????!!!");
			return;
		} else {
			$("#loginform").attr("action", "${root}/user/login").submit();
		}
	}
</script>

	<!-- End Header -->