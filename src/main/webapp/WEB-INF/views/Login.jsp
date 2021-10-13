<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<title>로그인</title>
	<style>
   form{
       text-align: center;
       margin:0 auto;
   }

   .border{
       margin:0 auto;
       width:400px;
       height:500px;
       border:1px solid #000;
       border-radius: 10%;
   }

   img{
       margin-top:20px;
       margin-bottom:80px;
   }

   input{
       width:300px;
   }
	</style>
	</head>
	<body>
    	<form class="center" action ="/com/loginProcess" method="post">
        	<div class="border">
        	
            	<h2>Login</h2>            	
     
		        <div class="form-group">
		            <label>ID</label>
		            <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력해주세요.">
		        </div>
		        <div class="form-group">
		            <label>PASSWORD</label>
		            <input type="password" class="form-control" name="userPw" id="uesrPw" placeholder="비밀번호를 입력해주세요.">
		        </div>
		        
        		<input type="submit" value="로그인">
        		<br><br>
        		<p>
        			<button type="button" class="btn btn-outline-info"><a href="/com/">홈으로</a></button>
        		</p>
        	</div> 
    	</form>
	</body>
</html>