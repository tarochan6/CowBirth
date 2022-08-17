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
<title>牛データの編集</title>
</head>
<body>
	<c:import url="parts/header.jsp" />



	<div class="container mt-3">
		<h1>牛データの編集</h1>
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
						<input name="id" type="hidden" value="<c:out value="${cow.id}" />">
          				<input name="userId" type="hidden" value="<c:out value="${cow.userId}" />">
						<input type="submit" class="btn btn-primary" value="編集" /> <a
							href="<%= request.getContextPath() %>/index" class="btn btn-secondary">キャンセル</a>
							
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
