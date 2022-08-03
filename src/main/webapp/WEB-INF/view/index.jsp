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
<title>COW CALENDAR</title>
</head>
<body>
  <div class="container mt-3">
    <h1 class="mb-4 d-inline-block">COW CALENDAR</h1>


      <div id="table-view" class="toggle-display col-12">
        <table class="table table-bordered table-hover">
          <thead id="record-head">
            <tr class="bg-light">
   			  <th>AI日</th>
              <th>分娩予定日</th>
              <th>妊娠鑑定日</th>
              <th>名号</th>
              <th>備考</th>
              <th>品種</th>
            </tr>
          </thead>

            
            <c:forEach items="${cows}" var="cow">
            <tr class="align-middle">
     		  <td><fmt:formatDate value="${cow.aiDay}" pattern="y-MM-dd" /></td>
              <td><fmt:formatDate value="${cow.birthDay}" pattern="y-MM-dd" /></td>
              <td><fmt:formatDate value="${cow.ptDay}" pattern="y-MM-dd" /></td>
              <td><c:out value="${cow.cowName}" /></td>
              <td><c:out value="${cow.note}" /></td>
              <td><c:out value="${cow.varietyName}" /></td>
            </tr>
            </c:forEach>

</table>
</div>
</div>

</body>
</html>