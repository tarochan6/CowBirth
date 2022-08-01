<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />
<title>ユーザー登録完了</title>
</head>
<body>
<div class="container mt-5">
  <div class="row">
    <div class="col-lg-4 offset-lg-4">
      <form action="" method="post">
      <h1 class="logo text-center mb-3 fw-normal">COW CALENDAR</h1>
      <h2 class="text-center">ユーザー登録</h2>
      <div class="alert alert-success mb-3" role="alert">
          ユーザー登録が完了しました。
      </div>
      <a class="w-100 btn btn-lg btn-primary mb-3" href="<%= request.getContextPath() %>/login">ログインページ</a>
      </form>
    </div>
  </div>
</div><!-- /.container -->
<c:import url="parts/commonJs.jsp" />
</body>
</html>