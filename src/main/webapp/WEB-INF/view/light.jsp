<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />
<title>Cow Calendar</title>

</head>
	<body>
<div class="container mt-5">
	<h1 class="logo text-center mb-3 fw-normal">
		<i class="fa-solid fa-cow"></i>Cow Calendar
	</h1>

	
		名号(名前):
		<input id="cowName" type="text"> AI日:
		<input id="cowAiday" type="date"> 品種:
		<select id="cowVariety">
			<option value="ホルスタイン種">ホルスタイン種</option>
			<option value="黒毛和種">黒毛和種</option>
			<option value="その他品種">その他品種</option>
		</select>

		<button id="btn">計算する</button>

		<table border="1">
			<tr>
				<th>名前</th>
				<th>AI日</th>
				<th>妊娠鑑定可能日</th>
				<th>分娩予定日</th>
				<th>品種</th>
				<th>操作</th>
			</tr>
		</table>

		<template id="row">
			<tr>
				<td class="name"></td>

				<td class="aiday"></td>
				<td class="ptday"></td>
				<td class="birthday"></td>
				<td class="variety"></td>
				<td><button class="del">削除</button></td>
			</tr>
		</template>


		<div class="text-center">
			<a class="link-primary" href="<%=request.getContextPath()%>/login">ログインページへ</a>
		</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(
			function() {

				$('#btn').click(
						function() {
							// 入力値の取得
							const cowName = $('#cowName').val();
							const cowVariety = $('#cowVariety').val();
							const cowAiday = $('#cowAiday').val();
							console.log('入力値の取得', cowVariety, cowAiday);

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
							var wd = [ '日', '月', '火', '水', '木', '金', '土' ];

							var bdy = bd.getFullYear();
							var bdm = bd.getMonth() + 1;
							var bdd = bd.getDate();
							var bdw = bd.getDay();
							var bdwd = [ '日', '月', '火', '水', '木', '金', '土' ];

							var pty = pt.getFullYear();
							var ptm = pt.getMonth() + 1;
							var ptd = pt.getDate();
							var ptw = pt.getDay();
							var ptwd = [ '日', '月', '火', '水', '木', '金', '土' ];

							// template内の要素を複製
							const clone = $($('#row').html());
							clone.find('.name').append(cowName);
							clone.find('.aiday').append(
									y + '年' + m + '月' + d + '日' + '(' + wd[w]
											+ ')');
							clone.find('.ptday').append(
									pty + '年' + ptm + '月' + ptd + '日' + '('
											+ ptwd[ptw] + ')');
							clone.find('.birthday').append(
									bdy + '年' + bdm + '月' + bdd + '日' + '('
											+ bdwd[bdw] + ')');
							clone.find('.variety').append(cowVariety);

							clone.find('.del').click(function() {
								$(this).parent().parent().remove();
							});
							// tableへの挿入
							$('table').append(clone);
						}); // click

			}); // ready
	</script>
</body>

</html>