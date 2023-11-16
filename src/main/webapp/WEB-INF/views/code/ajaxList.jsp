<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
  
       
       
     
            <div class="code-scroll" style="overflow-y: scroll; cursor: pointer;">
       
           
            <table class="table table-bordered table-hover">
           	    <tr>
                  <th class="table-secondary">코드</th>
                  <td>코드명</td>
                </tr>
            <c:forEach items="${ajaxList}" var="codeVO">
                <tr>
                  <th class="table-secondary">${codeVO.code}</th>
                  <td>${codeVO.codeName}</td>
                </tr>
            </c:forEach>
            </table>
            
            </div>
           
            
           
       
  <script src="/js/code/ajax-list.js"></script>
   
</body>
</html>