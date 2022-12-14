<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<c:import url="../parts/commonCss.jsp" />
<c:import url="../parts/commonJs.jsp" />

<script src="<%=request.getContextPath()%>/js/chart-3.8.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- フォントオーサム -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.ico" />

<title>新規牛データ登録 - CowBirthdaylist</title>
</head>
<body>
	<c:import url="../parts/header.jsp" />

	<div class="container mt-3">

		<a href="<%=request.getContextPath()%>/user/index" class="mb-4"><i
			class="fa-solid fa-arrow-left"></i>戻る</a>

		<h1 class="mt-2">新規牛データ登録</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="" method="post">
					<c:if test="${!empty errors}">
						<div class="alert alert-danger" role="alert">
							<c:forEach items="${errors}" var="error" varStatus="vs">
								<c:out value="${error}" />
								<c:out value="${vs.last ? '' : '<br>'}" escapeXml="false" />
							</c:forEach>
						</div>
					</c:if>
					<div class="form-group mb-3">
						<label for="formName">牛の名前</label> <input type="text" name="name"
							id="formName" class="form-control" value="" />
					</div>

					<div class="form-group mb-3">
						<label for="formVariety">品種</label> <select name="varietyId"
							id="formVariety" class="form-control">
							<c:forEach items="${varietyList}" var="variety">
								<option value="<c:out value="${variety.id}" />"
									<c:out value="${variety.id == varietyId ? 'selected' : ''}" />>
									<c:out value="${variety.name}" />
								</option>
							</c:forEach>
						</select>
					</div>


					<div class="form-group mb-3">
						<label for="formAiday">AI日</label> <input type="date" name="aiday"
							id="formAiday" class="form-control" value="" />
					</div>

					<div class="form-group mb-3">
						<label for="formNote">備考</label>
						<textarea name="note" id="formNote" class="form-control"></textarea>
					</div>

					<div class="text-left">
						<input type="submit" class="btn btn-outline-primary mx-1"
							value="登録" />
					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.0.min.js"></script>
</body>
</html>
