<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav>
    <ul class="pagination">
        <li class="page-item ${pager.pre ? '' : 'disabled'}">
            <a class="page-link" href="#" data-num="${pager.startNum - 1}"><i class="mdi mdi-chevron-left"></i></a>
        </li>
        <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
            <li class="page-item">
                <a class="page-link" href="#" data-num="${i}">${i}</a>
            </li>
        </c:forEach>
        <li class="page-item ${pager.next ? '' : 'disabled'}">
            <a class="page-link" href="#" data-num="${pager.lastNum + 1}"><i class="mdi mdi-chevron-right"></i></a>
        </li>
    </ul>
</nav>