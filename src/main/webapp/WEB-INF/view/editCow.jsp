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
<title>情報の変更</title>
</head>
<body>
	<c:import url="parts/header.jsp" />



	<div class="container mt-3">
		<h1>情報変更</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="" method="post">

					<div class="form-group mb-3">
						<label for="formName">名号</label> <input type="text" name="name"
							id="formName" class="form-control"
							value="<c:out value="${cow.cowName}" />" />
						<!-- <c:if test="${!empty nameError}">
							<div class="alert alert-danger mt-1" role="alert">
								<c:out value="${nameError}" />
							</div>
						</c:if> -->

					</div>

					<div class="form-group mb-3">
						<label for="formVariety">品種</label> <select name="varietysId"
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
						<label for="formLocation">場所</label> <select name="locationId"
							id="formLocation" class="form-control">
							<c:forEach items="${locationList}" var="location">
								<option value="<c:out value="${id}" />"
									<c:out value="${location.id == locationId ? 'selected' : ''}" />>
									<c:out value="${location.name}" />
								</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group mb-3">
						<label for="formAiday">AI日</label> <input type="date" name="aiday"
							id="formAiday" class="form-control"
							value="<c:out value="${cow.aiDay}" />" />
						<!-- 	<c:if test="${!empty amountError}">
							<div class="alert alert-danger mt-1" role="alert">
								<c:out value="${amountError}" />
							</div>
						</c:if> -->

					</div>


					<div class="form-group mb-3">
						<label for="formNote">備考</label>
						<textarea name="note" id="formNote" class="form-control"><c:out
								value="${cow.note}" /></textarea>
					</div>

					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="変更" /> <a
							href="index" class="btn btn-secondary">キャンセル</a>
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
