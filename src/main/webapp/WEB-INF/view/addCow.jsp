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
<title>牛の登録</title>
</head>
<body>
	<c:import url="parts/header.jsp" />

	<div class="container mt-3">
		<h1>牛の登録</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="" method="post">


					<div class="form-group mb-3">
						<label for="formName">名号</label> <input type="text" name="name"
							id="formName" class="form-control"
							value="" />
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
							value="" />
					</div>

					<div class="form-group mb-3">
						<label for="formNote">備考</label>
						<textarea name="note" id="formNote" class="form-control"></textarea>
					</div>

					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="登録" /> <a
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
