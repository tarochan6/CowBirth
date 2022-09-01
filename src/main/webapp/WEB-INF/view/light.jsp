<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<c:import url="parts/commonCss.jsp" />
<c:import url="parts/commonJs.jsp" />

<script src="<%=request.getContextPath()%>/js/chart-3.8.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- フォントオーサム -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
<!-- テーブルソート -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.0/js/jquery.tablesorter.min.js"></script>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.ico" />

<title>CowBirthdaylist</title>

<style>
@media print {
	.btn, .kesu1, .kesu2, .kesu3, .kesu4 {
		display: none;
	}
}
</style>

</head>
<body>
	<div class="container mt-5">
		<h1 class="logo text-center mb-0 fw-normal">
			<i class="fa-solid fa-cow"></i>CowBirthdaylist
		</h1>

		<div class="text-center mb-3 logo">
			<h4>Light ver.</h4>
		</div>



		<div class="row">
			<div class="col-md-12">
				<div class="kesu1">
					<div class="d-flex justify-content-center">
						<div class="mx-1 mb-3">
							<label for="formName">牛の名前</label><input id="cowName" type="text"
								class="form-control">
						</div>


						<div class="mx-1 mb-3">
							<div class="cowAiday">
								<label for="formAiday">AI日</label><input id="today" type="date"
									class="form-control" />

							</div>
						</div>


						<div class="mx-1 mb-3">
							<label for="formVariety">品種</label> <select id="cowVariety"
								class="form-control">
								<option value="ホルスタイン種">ホルスタイン種</option>
								<option value="黒毛和種">黒毛和種</option>
								<option value="その他品種">その他品種</option>
							</select>
						</div>


						<div class="mx-3 mb-3 mt-4">
							<button type="button" class="btn btn-outline-dark text-nowrap"
								id="btn">計算する</button>
						</div>
					</div>

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
								<th class="kesu2">操作</th>
							</tr>
						</thead>
					</table>
				</div>

				<template id="row">
					<tr class="align-middle text-center">
						<td class="name"></td>
						<td class="aiday"></td>
						<td class="ptday"></td>
						<td class="birthday"></td>
						<td class="variety"></td>
						<td class="kesu3"><button
								class="del btn btn-outline-danger py-1">削除</button></td>
					</tr>
				</template>

				<div
					class="botton d-flex flex-row-reverse bd-highlight ms-auto p-2  mt-3">
					<button type="button" class="btn btn-outline-dark"
						onclick="window.print();">
						<i class="fa-solid fa-print"></i> データの印刷
					</button>
				</div>

				<div class="kesu4">
					<div class="text-center mb-5">
						<a class="link-primary" href="<%=request.getContextPath()%>/login">ログインページへ戻る</a>
					</div>
				</div>

			</div>

		</div>
	</div>



	<script type="text/javascript">
		//データエラー防止のため今日の日時を表示
		window.onload = function() {
			//今日の日時を表示
			var date = new Date()
			var year = date.getFullYear()
			var month = date.getMonth() + 1
			var day = date.getDate()

			var toTwoDigits = function(num, digit) {
				num += ''
				if (num.length < digit) {
					num = '0' + num
				}
				return num
			}

			var yyyy = toTwoDigits(year, 4)
			var mm = toTwoDigits(month, 2)
			var dd = toTwoDigits(day, 2)
			var ymd = yyyy + "-" + mm + "-" + dd;

			document.getElementById("today").value = ymd;
		}
	</script>

	<script>
		//DOM
		$(document).ready(
				function() {
					$('#btn')
							.click(
									function() {
										// 入力値の取得
										const cowName = $('#cowName').val();
										const cowVariety = $('#cowVariety')
												.val();
										const cowAiday = $('#today').val();
										console
												.log('入力値の取得', cowVariety,
														today);

										var ai = new Date(cowAiday)

										if (cowVariety == 'ホルスタイン種') {
											var bd = new Date(cowAiday);
											bd.setDate(bd.getDate() + 280);
										} else if (cowVariety == '黒毛和種') {
											var bd = new Date(cowAiday);
											bd.setDate(bd.getDate() + 285);
										} else {
											var bd = new Date(cowAiday);
											bd.setDate(bd.getDate() + 280);
										}

										var pt = new Date(cowAiday);
										pt.setDate(pt.getDate() + 28);

										console.log('AI入力の確認', bd, pt);

										var y = ai.getFullYear();
										var m = ai.getMonth() + 1;
										var d = ai.getDate();
										var w = ai.getDay();
										var wd = [ '日', '月', '火', '水', '木',
												'金', '土' ];

										var bdy = bd.getFullYear();
										var bdm = bd.getMonth() + 1;
										var bdd = bd.getDate();
										var bdw = bd.getDay();
										var bdwd = [ '日', '月', '火', '水', '木',
												'金', '土' ];

										var pty = pt.getFullYear();
										var ptm = pt.getMonth() + 1;
										var ptd = pt.getDate();
										var ptw = pt.getDay();
										var ptwd = [ '日', '月', '火', '水', '木',
												'金', '土' ];

										// template内の要素を複製
										const clone = $($('#row').html());
										clone.find('.name').append(cowName);
										clone.find('.aiday').append(
												y + '年' + m + '月' + d + '日'
														+ '(' + wd[w] + ')');
										clone.find('.ptday').append(
												pty + '年' + ptm + '月' + ptd
														+ '日' + '(' + ptwd[ptw]
														+ ')');
										clone.find('.birthday').append(
												bdy + '年' + bdm + '月' + bdd
														+ '日' + '(' + bdwd[bdw]
														+ ')');
										clone.find('.variety').append(
												cowVariety);

										clone.find('.del').click(function() {
											$(this).parent().parent().remove();
										});
										// tableへの挿入
										$('table').append(clone);
										$('#fav-table').trigger("update");
										$('#fav-table').trigger("appendCache");
										$('#fav-table').tablesorter();

									}); // click

				}); // ready
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