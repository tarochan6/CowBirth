<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<c:import url="parts/commonCss.jsp" />
<c:import url="parts/commonJs.jsp" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">


<script src="<%=request.getContextPath()%>/js/chart-3.8.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.0/js/jquery.tablesorter.min.js"></script>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>分娩予定牛一覧 - CowBirthdaylist</title>
</head>
<body>

	<c:import url="parts/header.jsp" />


	<div class="container mt-3">
		<div class="d-flex justify-content-between align-items-start">
			<h1 class="mb-4 d-inline-block">分娩予定牛一覧</h1>

			<a class="btn btn-outline-success mx-3"
				href="<%=request.getContextPath()%>/addCow">新規牛データ登録</a>
		</div>

		<div id="table-view" class="toggle-display col-12">
			<table class="table table-bordered table-hover" id="fav-table">
				<thead id="record-head">
					<tr class="bg-light text-center">
						<th>牛の名前 <i class="fa-solid fa-sort"></i></th>
						<th>AI日 <i class="fa-solid fa-sort"></i></th>
						<th>妊娠鑑定可能日 <i class="fa-solid fa-sort"></i></th>
						<th>分娩予定日 <i class="fa-solid fa-sort"></i></th>
						<th>品種 <i class="fa-solid fa-sort"></i></th>
						<th>備考</th>
						<th colspan="2" id="cowdate">データの編集</th>
					</tr>
				</thead>


				<c:forEach items="${cows}" var="cow">
					<tr class="align-middle text-center">
						<td><c:out value="${cow.cowName}" /></td>

						<td><fmt:formatDate value="${cow.aiDay}"
								pattern="y年MM月dd日(E)" /></td>
						<td><fmt:formatDate value="${cow.ptDay}"
								pattern="y年MM月dd日(E)" /></td>
						<td><fmt:formatDate value="${cow.birthDay}"
								pattern="y年MM月dd日(E)" /></td>
						<td><c:out value="${cow.varietyName}" /></td>
						<td><c:out value="${cow.note}" /></td>
						<td><a class="btn btn-outline-primary"
							href="<%= request.getContextPath() %>/editCow?id=<c:out value="${cow.id}" />">編集</a>

							<button class="btn btn-outline-danger delete"
								data-bs-toggle="modal" data-bs-target="#deleteModal"
								data-href="<%= request.getContextPath() %>/deleteCow?id=<c:out value="${cow.id}" />">削除</button>
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>

					<div class="d-flex flex-row-reverse bd-highlight ms-auto p-2  mt-3">
						<button type="button" class="btn btn-outline-dark"
							onclick="window.print();"><i class="fa-solid fa-print"></i>データの印刷</button>
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
					<h5 class="modal-title" id="modalLabel">牛データの削除</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						「<span id="modal-date"></span>」の牛データを削除します。よろしいですか？
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

	<script>
		// 削除ボタン
		$(document).ready(function() {
					$('button.delete').click(function() {
								const date = $(this).parent().parent()
										.children('td:first-child').text();
								$('#delete-link').attr('href',
										$(this).attr('data-href'));
								$('#modal-date').text(date);
							});
				});
		</script>

	<script>
		//テーブルのソート
		$(document).ready(function() {
			$('#fav-table').tablesorter();
		});
		</script>

	<script>
		//印刷ボタン
		$(ducment).ready(function() {
			$('.print').click(function() {
				window.print();
			});
		});
		  
	</script>

</body>
</html>