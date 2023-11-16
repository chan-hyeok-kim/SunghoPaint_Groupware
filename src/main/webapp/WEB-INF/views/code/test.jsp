<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- 필요한 스타일이나 스크립트를 여기에 추가 -->

</head>
<body id="page-top">
    <div id="wrapper">
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- 여기에 코드 목록과 관련된 다른 HTML을 추가 -->

            <table class="table-bordered mt-2" id="approval-table">
                <thead>
                    <tr>
                        <th>선택</th>
                        <th>상위코드</th>
                        <th>상위코드명</th>
                        <th>등록날짜</th>
                        <th>최근 수정한 날짜</th>
                        <th width="20%">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${upList}" var="vo" varStatus="i">
                        <tr>
                            <td><input type="checkbox" name="checkList" value="${vo.upCode}"></td>
                            <td>${vo.upCode}</td>
                            <td>${vo.upCodeName}</td>
                            <td class="reg-date">${vo.regDate}</td>
                            <td class="mod-date">${vo.modDate}</td>
                            <td>
                                <!-- 모달 열기 버튼 -->
                                <button class="btn btn-info code-update-btn" data-toggle="modal" data-target="#update-code-modal${i.index}">코드 관리</button>

                                <!-- update Modal -->
                                <div class="modal fade" id="update-code-modal${i.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">코드 등록</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- 테이블 내 테이블 -->
                                                <table class="table">
                                                    <!-- 세부 정보를 표시할 행 추가 -->
                                                    <tr>
                                                        <th>세부정보1</th>
                                                        <td>${vo.upCodeName}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>세부정보2</th>
                                                        <td>${vo.upCode}</td>
                                                    </tr>
                                                    <!-- 추가 세부 정보를 필요에 따라 계속 추가할 수 있음 -->
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                                <button type="button" class="btn btn-info">확인</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 나머지 코드 및 스크립트 추가 -->

        </div>
    </div>

    <!-- 필요한 스크립트를 추가 -->

</body>
</html>