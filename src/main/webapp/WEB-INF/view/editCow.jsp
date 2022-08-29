<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- フォントオーサム -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
	
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />

<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.ico" />

<title>牛データ編集 - CowBirthdaylist</title>
</head>
<body>
	<c:import url="parts/header.jsp" />



	<div class="container mt-3">
		<h1>牛データ編集</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="" method="post">

					<div class="form-group mb-3">
						<label for="formName">牛の名前</label> <input type="text" name="name"
							id="formName" class="form-control"
							value="<c:out value="${cow.cowName}" />" />


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
							value="<c:out value="${cow.aiDay}" />" required/>
					</div>


					<div class="form-group mb-3">
						<label for="formNote">備考</label>
						<textarea name="note" id="formNote" class="form-control"><c:out
								value="${cow.note}" /></textarea>
					</div>

					<div class="form-group">
						<input name="id" type="hidden" value="<c:out value="${cow.id}" />">
          				<input name="userId" type="hidden" value="<c:out value="${cow.userId}" />">
          				
          				<div class="d-flex justify-content-center">
						<input type="submit" class="btn btn-outline-primary mx-1" value="送信" /> <a
							href="<%= request.getContextPath() %>/index" class="btn btn-outline-danger mx-1">キャンセル</a>
							</div>
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
