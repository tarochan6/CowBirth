<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title>COW CALENDAR</title>
</head>
<body>
	<c:import url="parts/header.jsp" />

	<div class="container mt-3">
		<h1 class="mb-4 d-inline-block">COW CALENDAR</h1>

		<ul>
			<li><a class="dropdown-item"
				href="<%=request.getContextPath()%>/logout">ログアウト</a></li>
		</ul>

		<div id="table-view" class="toggle-display col-12">
			<table class="table table-bordered table-hover">
				<thead id="record-head">
					<tr class="bg-light">
						<th>名号(牛の名前)</th>
						<th>品種</th>
						<th>AI日</th>
						<th>妊娠鑑定日</th>
						<th>分娩予定日</th>
						<th>備考</th>
						<th colspan="2">情報の編集</th>
					</tr>
				</thead>


				<c:forEach items="${cows}" var="cow">
					<tr class="align-middle">
						<td><c:out value="${cow.cowName}" /></td>
						<td><c:out value="${cow.varietyName}" /></td>
						<td><fmt:formatDate value="${cow.aiDay}" pattern="y年MM月dd日" /></td>
						<td><fmt:formatDate value="${cow.ptDay}" pattern="y年MM月dd日" /></td>
						<td><fmt:formatDate value="${cow.birthDay}" pattern="y年MM月dd日" /></td>
						<td><c:out value="${cow.note}" /></td>
						<td><a class="btn btn-warning"
							href="editCow?id=<c:out value="${cow.id}" />">編集</a>

						<button class="btn btn-danger delete" data-bs-toggle="modal" data-bs-target="#deleteModal" data-href="<%= request.getContextPath() %>/user/deleteRecord?id=<c:out value="${record.id}" />">削除</button>
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>

	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-headar">

					<h5 class="modal-title" id="modalLabel">
						「<span id="itemToDelete"></span>」の削除
					</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="close"></button>
				</div>
				<div class="modal-body">本当に削除してよろしいですか？</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">キャンセル</button>
					<a id="linkToDelete" class="btn btn-danger" href="">削除する</a>
				</div>
			</div>
		</div>
	</div>
	

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.0.min.js"></script>


</body>
</html>