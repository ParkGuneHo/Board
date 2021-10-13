<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<style>
.center{
margin: 5px 25px; padding: 20px
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
<%
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = sf.format(now);
%>


    <form class="center" name="update" method="POST" action="${path}/com/update?no=${view.no}">
        <h2>Update</h2>
        <div class="form-group">
            <label style="font-weight: bold;">제목</label>
            <input type="text" class="form-control" name="title" value=${view.title}>
        </div>
        <div class="form-group">
            <label style="font-weight: bold;">작성일</label>
            <p style="background-color:#E9ECEF" class="form-control">
            	${view.date1}
            </p>
        </div>
        <div class="form-group">
            <label style="font-weight: bold;">수정일</label>
            <p style="background-color:#E9ECEF" class="form-control">
            	<%= today %>
            </p>
        </div>
        <div class="form-group">
            <label style="font-weight: bold;">작성자</label>
            <p style="background-color:#E9ECEF" class="form-control">
            	${view.name}
            </p>            
        </div>
        <div>        
            <input type="submit" class="btn btn-outline-info" value="완료"/>
			<input type="reset" class="btn btn-outline-info" value="초기화"/>
            <button type="button" class="btn btn-outline-info"><a href="/com/">목록</a></button>
        </div>
    </form>

</body>
</html>