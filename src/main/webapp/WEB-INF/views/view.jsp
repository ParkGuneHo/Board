<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>
.center {
	margin: 5px 25px;
	padding: 20px
}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
function toggleReadonly(btn, objId, objId1, objId2) {
	var obj = document.getElementById(objId);
	var obj1 = document.getElementById(objId1);
	var obj2 = document.getElementById(objId2);
	
	obj.readOnly = !eval(true);
	obj1.hidden = !eval(true);
	obj2.hidden = !eval(true);
}

function complete(objId, objId1, objId2) {
	var obj = document.getElementById(objId);
	var obj1 = document.getElementById(objId1);
	var obj2 = document.getElementById(objId2);
	
	obj.readOnly = eval(true);
	obj1.hidden = eval(true);
	obj2.hidden = eval(true);
}

</script>
<script type="text/javascript">
	function fn_update(tmp){
		$.ajax({
			url : "/com/replyUpdate?rno="+tmp,
			type : "post",
			dataType : "json",
			data : { "content" : $("#replycontent"+tmp).val() },
			error:function(request,status,error){
			    alert("수정이 완료되었습니다.");
			    },
				success : function(){
				alert("수정이 완료되었습니다.");
				}
		})
	}
</script>


<title>Content</title>
</head>

<body style="font-weight: bold;">
	<form class="center" method="post">
		<h2>Content</h2>
		<div class="form-group">
			<label>제목</label>
			<p class="form-control">${view.title}</p>
		</div>
		<div class="form-group">
			<label>작성일</label>
			<p class="form-control">${view.date1}</p>
		</div>
		<div class="form-group">
			<label>수정일</label>
			<p class="form-control">${view.date2}</p>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<p class="form-control">${view.name}</p>
		</div>
		<c:if test="${login.userName == view.name}">
			<a href="/com/update?no=${view.no}" role="button" class="btn btn-outline-info">수정</a>
			<a href="/com/delete?no=${view.no}" role="button" class="btn btn-outline-info">삭제</a>
		</c:if>

		<button type="button" class="btn btn-outline-info">
			<a href="/com/">목록</a>
		</button>
	</form>

		<br>
		<br>
		<br>
		<br>
		<!-- Reply Form {s} -->
		<c:if test="${login.userName != null}">
			<h3>Reply</h3>
			<section class="replyForm">
				<form class="center" role="form" method="post" autocomplete="off">
					<div class="row">
						<div class="col-sm-10">
							<input type="hidden" id="bno" name="bno" value=${view.no} readonly/>
							<input path="content" id="content" name="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요" />
						</div>
						<div class="col-sm-2">
							<input type="hidden" path="userName" id="userName" name="userName" class="form-control" value=${login.userName} readonly />
							<button type="button" class="repSubmit" style="width: 100%; margin-top: 10px">작 성</button>
							<script>
								var formObj = $(".replyForm form[role='form']");
		
								$(".repSubmit").click(function() {
									formObj.attr("action", "insert");
									formObj.submit();
								});
							</script>
						</div>
					</div>
				</form>
			</section>
		</c:if>

		<!-- Reply Form {e} -->

		<!-- Reply List {s}-->
		<div class="center" style="padding-top: 10px">
		
			<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
			<div>
			<table>
				<thead>
					<tr style="border:1px solid #EAEAEA;">
						<th>닉네임</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="row">
						<tr style="border-bottom:1px solid #EAEAEA;">
							<td style="width:10%">${row.userName}</td>
							<td style="width:40%;">
								<input id="replycontent${row.rno}" type="text" value="${row.content}" class="form-control" readonly='true'> </input>
							</td>
							<td style="width:20%">${row.date}</td>
							
							<c:if test="${login.userName == row.userName}">
								<td>
									<button id='btn${row.rno}' class="btn btn-outline-info" style="float:right; color:blue;" hidden="true" onclick="fn_update(${row.rno}); complete('replycontent${row.rno}', 'btn${row.rno}', 'btnc${row.rno}');">완료</button>
									<button id='btnc${row.rno}' onClick="window.location.reload()" style="cursor: pointer; float: right; color:blue;" class="btn btn-outline-info" hidden="true">취소</button>
								</td>
								<td>
									<a href="/com/replyDelete?no=${row.rno}" role="button" class="btn btn-outline-info" style="float:right; color:red;">삭제</a>
									<input type='button' value='수정' style="float:right;" onClick='toggleReadonly(this, "replycontent${row.rno}", "btn${row.rno}", "btnc${row.rno}")' class="btn btn-outline-info"/>
								</td>
							</c:if>
						</tr>
					</c:forEach>
			    </tbody>
			</table>
			</div>
		</div>
		<!-- Reply List {e}-->
</body>
</html>