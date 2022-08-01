<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />
<title>ユーザー登録</title>
</head>
<body>
<div class="container mt-5">
  <div class="row">
    <div class="col-lg-4 offset-lg-4">
      <form action="" method="post">
      <h1 class="logo text-center mb-3 fw-normal">COW CALENDAR</h1>
      <h2 class="text-center">ユーザー登録</h2>
      <c:if test="${!empty errors}">
      <div class="alert alert-danger" role="alert">
          <c:forEach items="${errors}" var="error" varStatus="vs">
            <c:out value="${error}" />
            <c:out value="${vs.last ? '' : '<br>'}" escapeXml="false" />
          </c:forEach>
      </div>
      </c:if>

      <div class="form-floating">
        <input type="text" value="<c:out value="${loginId}" />" name="loginId" class="form-control rounded-0 rounded-top" id="floatingInput" placeholder="ログインID">
        <label for="floatingInput">ユーザーID</label>
      </div>
      
      <div class="form-floating">
        <input type="password" name="loginPass" class="form-control border-top-0 rounded-0" id="floatingPassword" placeholder="パスワード">
        <label for="floatingPassword">パスワード</label>
      </div>

      <div class="form-floating mb-3">
        <input type="password" name="confPass" class="form-control border-top-0 rounded-0 rounded-bottom" id="floatingPassword2" placeholder="パスワード(確認用)">
        <label for="floatingPassword2">パスワード(確認用)</label>
      </div>


      <input class="w-100 btn btn-lg btn-primary mb-3" type="submit" value="登録">
       <a href="<%= request.getContextPath() %>/login" class="link-primary">ログインページへ戻る</a>
      </form>
    </div>
  </div>
</div><!-- /.container -->
<c:import url="parts/commonJs.jsp" />
</body>
</html>