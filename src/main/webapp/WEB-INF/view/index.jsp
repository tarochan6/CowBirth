<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />
<title>COW CALENDAR</title>
</head>
<body>
	<c:import url="parts/header.jsp" />

	<div class="container mt-3">
		<h1 class="mb-4 d-inline-block">COW CALENDAR</h1>


		<a class="btn btn-success mb-4 mt-2 ms-4"
			href="<%=request.getContextPath()%>/addCow">新規牛登録</a>


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
						<td><fmt:formatDate value="${cow.birthDay}"
								pattern="y年MM月dd日" /></td>
						<td><c:out value="${cow.note}" /></td>
						<td><a class="btn btn-warning"
							href="<%= request.getContextPath() %>/editCow?id=<c:out value="${cow.id}" />">編集</a>

							<button class="btn btn-danger delete" data-bs-toggle="modal"
								data-bs-target="#deleteModal"
								data-href="<%= request.getContextPath() %>/deleteCow?id=<c:out value="${cow.id}" />">削除</button>
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>

		<div id="weight-view" class="toggle-display hide">
			<canvas id="weight-chart"></canvas>
		</div>
		<div id="exercise-view"
			class="toggle-display hide col-md-8 offset-md-2">
			<canvas id="exercise-chart"></canvas>
		</div>
	</div>

	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalLabel">記録の削除</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						「<span id="modal-date"></span>」の記録を削除します。よろしいですか？
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">キャンセル</button>
					<a id="delete-link" class="btn btn-danger" href="">削除する</a>
				</div>
			</div>
		</div>
	</div>


	<c:import url="parts/commonJs.jsp" />
	<script src="<%=request.getContextPath()%>/js/chart-3.8.0.min.js"></script>

	<script>
		// 削除ボタン
		$(document).ready(
				function() {
					$('button.delete').click(
							function() {
								const date = $(this).parent().parent()
										.children('td:first-child').text();
								$('#delete-link').attr('href',
										$(this).attr('data-href'));
								$('#modal-date').text(date);
							});
				});
	</script>

</body>
</html>