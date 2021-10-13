<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>
	<h1>Home</h1>
	<p>
	<c:if test="${login == null}">
		<a style="float:right;" href="<c:url value='/register'/>" role="button" class="btn btn-outline-info">회원가입</a>
		<a style="float:right;" href="<c:url value='/login'/>" role="button" class="btn btn-outline-info">로그인</a>
	</c:if>
	<c:if test="${login != null}">
		<a style="float:right; color:red;" href="<c:url value='/logout'/>" role="button" class="btn btn-outline-info">로그아웃</a>
		<a style="float:right;">${login.userName} 님 환영합니다.&nbsp  </a> 
	</c:if>
	<br>
	</p>
	
	<table>
		<thead>
			<tr style="border:1px solid #EAEAEA;">
				<th>No.</th>
				<th>제목</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardList}" var="board">
				<tr style="border-bottom:1px solid #EAEAEA;">
					<td style="width:20%">${board.no}</td>
					<td style="width:20%">${board.title}</td>
					<td style="width:20%">${board.date1}</td>
					<td style="width:20%">${board.date2}</td>
					<td style="width:20%">${board.name}</td>
					<td>
						<a href="/com/view?no=${board.no}"role="button" class="btn btn-outline-info">이동</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<c:if test="${login != null}">
		<a style="float:right; color:blue;" href="<c:url value='/create'/>" role="button" class="btn btn-outline-info">새작성</a>
	</c:if>
	
</body>
</html>
