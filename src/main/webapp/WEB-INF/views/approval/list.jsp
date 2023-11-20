<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<meta name="description" content="Signature Pad - HTML5 canvas based smooth signature drawing using variable width spline interpolation.">
   <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
  
    <!-- <link rel="stylesheet" href="/css/sign/signature-pad.css">
   -->
    <script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script><script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-39365077-1']);
      _gaq.push(['_trackPageview']);
  
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script> 

</head>
<body id="page-top">
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="card">
				<div class="card-body">

					<div class="wrapper-toolbar">

						<div style="float:left">내 결재 관리</div> 
						<div style="text-align: right;">
							<form class="form-inline" action="./list">

								<!-- 검색 설정 -->
								<select name="kind" class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected" value="approvalTitle">제목</option>
									<option value="drafter">기안자</option>
									<option value="lastApprover">결재자</option>
								</select> 
								
								
								<input style="display: inline-block;" id="top-search-bar"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search" name="search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</div>
					</div>

					<ul class="nav-tabs my-list-tabs">
						<li onclick="location.href='./list'" class="active"><a class="link-tab">전체</a></li>
						<!-- <li data-cd="R031"><a class="link-tab">기안중</a></li> -->
						<li data-cd="R032"><a class="link-tab">진행중</a></li>
						<li data-cd="R034"><a class="link-tab">반려</a></li>
						<li data-cd="R033"><a class="link-tab">승인 완료</a></li>
					</ul>	


					<div
						style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">


						<div class="container-fluid">


				  
				  
				
				    <table class="table table-hover mt-2" id="approval-table">
				        <thead>
				           <tr>
				             <th>선택</th>
				             <th>기안일자</th>
				             <th>제목</th>
				             <th>기안자</th>
				             <th>결재자</th>
				             <th>진행상태</th>
				             <th>결재 확인</th>
				           </tr>
				        </thead>
				        <tbody>
				        <c:forEach items="${list}" var="vo" varStatus="i">
				        
				           <tr>
				             <td><input type="checkbox"></td>
				             <td class="approval-start-date">${vo.approvalStartDate}</td>
				             <td>${vo.approvalTitle}</td>
				             <td>${vo.drafter}</td>
				             <td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApproverName}</td>
				             <td>
				             <c:choose>
									<c:when test="${vo.apCodeName eq '진행중'}"><label class="badge badge-gradient-info">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '반려'}"><label class="badge badge-gradient-danger">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '승인 완료'}"><label class="badge badge-gradient-success">${vo.apCodeName}</label></c:when>
									<c:when test="${vo.apCodeName eq '기안중'}"><label class="badge badge-gradient-primary">${vo.apCodeName}</label></c:when>
																	
									</c:choose>
				             </td>
				             <td><a href="/approval/${vo.approvalStatusCd eq 'R031'? 'update': 'detail' }?approvalNo=${vo.approvalNo}" class="detail-proceed-btn">기안서 확인</a></td>
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>
				  </div>
				  
				
				  
			  <!-- pagination -->
				  <div style="text-align: center; margin: 20px 20px;">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
  <ul class="pagination">
    <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/approval/list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/approval/list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/approval/list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
  </ul>
</nav>

  <!-- Button List  -->
 
  
  
				  <div style="float: right;">
				  <button id="add-proceed-btn" class="btn btn-info">새 결재 진행</button>
				 
				</div>

  </div>
				  </div>
				  
				  
				

 <!-- Sign -->
<div style="float:left">
<div style="margin-left:20px">
     <button type="button" class="btn btn-gradient-light" data-toggle="modal"  data-target="#stampModal">도장 등록</button>
  <span style="margin-left:20px;">
    <button id="sign-modal" type="button" class="btn btn-gradient-light" data-toggle="modal" data-target="#signModal">서명 만들기/등록</button>
</span> 
  </div> 
  
 
<!-- Stamp --> 

</div>



  
  


<!-- Modal -->

				  

<!-- Stamp-Modal -->
<div class="modal fade" id="stampModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="border-bottom: white; border-radius: 0rem;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">도장 올리기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
      <div>* 도장이 나오는 이미지를 등록해주세요</div>
      
      
     
     
     <div id="sign-file-reg-div">
     <div>
     <form id="sign-frm">
      <input type="file" accept="image/*" id="file" name="file" onchange="loadFile(this)"> 
      </form>
      <div id="sign-file-div" onclick="document.getElementById('file').click()">
      <span class="material-symbols-outlined">upload</span>이곳을 클릭해서 이미지를 등록하세요
      
      </div>
       
         <div id="fileName"></div>
         
         
      <div id="image-show"></div>
     
      
      </div>
     </div>
      

     
     
     
     <div style="border: 1px solid gray;">
     <div style="border-bottom: 1px solid gray;">
      현재 보유한 서명
     </div>
         
        <div id="small-image-show" style="text-align:center; padding-top:25px; height: 100px;"></div>  
        </div>    
       
     
      
  </div>     
  
  
   
      <div class="modal-footer" style="background: white">
        <button type="button" class="btn btn-secondary" id="sign-close" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-info" id="sign-submit-btn">등록</button>
        
        </div>
      </div>
    </div>
   </div>
  
  
  <!-- Sign Modal  -->
  
  <div class="modal fade" id="signModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" id="sign-modal-size" role="document">
    <div class="modal-content" style="border-bottom: white; border-radius: 0rem;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">서명 등록</h5>
        
      </div>
      <div class="modal-body">
      
     
      <div>*아래에 서명해주세요</div>
      
    
   
     <div>
     
     <!-- Sign Canvas -->
     
      <div id="signature-pad" class="signature-pad" style="margin-top: 20px;">
      <div class="signature-pad--body">
       <canvas width="664" height="290" id="sign-canvas" style="border: 1px solid gray"></canvas> 
      
<%-- <canvas width="664" style="touch-action: none; user-select: none;" height="290"></canvas>  --%>
      </div>
      <div class="signature-pad--footer">
        <div class="description"></div>
  
        <div class="signature-pad--actions">
          <div class="column">
            <button type="button" class="button clear btn-info" data-action="clear">지우기</button>
            <button type="button" class="button btn-info" data-action="undo">이전으로</button>
            
          </div>
          <div class="column">
            <button type="button" class="button save btn-info" data-action="save-png">PNG로 저장</button>
            <button type="button" class="button save btn-info" data-action="save-jpg">JPG로 저장</button>
          <!--   <button type="button" class="button save btn-info" data-action="save-svg">SVG로 저장</button>  -->
           
          </div>
        </div>
      </div>
    </div>
     
     
  <%--    <canvas id="sign-canvas" style="border: 1px solid gray"></canvas>
     </div>
     <div style="float:left">
     <button id="clear-sign" type="button">지우기</button>
     </div> --%>
     
     
     
    
    
      
      
  </div>     
  
  
      </div>
      <div class="modal-footer" style="background: white">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> 
         <button type="button" id="sign-add-btn" class="btn btn-info" data-dismiss="modal">등록</button>
        </div>
      </div>
    </div>
  </div>
<!-- modal end -->			
	

				</div>
              </div>
			</div>
</div>
		

	<script type="text/javascript">
	var formSign='${member.signature}';
	var username='${member.username}';
	
	</script>
			


	
	<script src="/js/commons/list-date.js"></script>
	<script src="/js/commons/ul-tabs.js"></script>
    
    <!-- 리스트 ul tabs 이동 -->
	<script src="/js/approval/list-move.js"></script>
	<script src="/js/approval/ajax-search.js"></script>
	<!-- 기안일자 변환 -->
	<script src="/js/approval/approval-date.js"></script>
	
	<!-- Signature_pad -->
	<script src="/js/commons/signature.js"></script>   
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
	<script src="/js/commons/sign.js"></script> 
	
	


</body>
</html>