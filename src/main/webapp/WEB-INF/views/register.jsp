<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>﻿

<title>로그인</title>
<style>
form {
	text-align: center;
	margin: 0 auto;
}

.border {
	margin: 0 auto;
	width: 400px;
	height: 500px;
	border: 1px solid #000;
	border-radius: 10%;
}

input {
	width: 300px;
}
</style>
</head>

<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPw").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/com/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);},

				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
</script>

<body>
<section id="container">
	<form class="center" action="/com/register" method="post" id="regForm">
		<div class="border">

			<h2>Login</h2>

			<div class="form-group">
				<label class="control-label" for="userId">ID</label> 
				<input class="form-control" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요."/>
				<button class="btn btn-outline-info" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			</div>
			<div class="form-group">
				<label class="control-label" for="userPw">PASSWORD</label>
				<input class="form-control" type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요."/>
			</div>
			<div class="form-group">
				<label class="control-label" for="userName">USERNAME</label>
				<input class="form-control" type="text" id="userName" name="userName" placeholder="이름을 입력해주세요."/>
			</div>

			<input id="submit" type="submit" class="btn btn-outline-info" value="회원가입">

			<p>
				<br>
				<br>
				<button type="button" class="btn btn-outline-info">
					<a href="/com/">홈으로</a>
				</button>
			</p>
		</div>
	</form>
</section>
</body>
</html>