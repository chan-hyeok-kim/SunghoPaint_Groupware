<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 
  
  
<style type="text/css">
  #tree_list_add {
	margin-left: 20px;
}

#tree-table {
	border: 1px solid black;
	height: 360px;
	width: 220px;
	padding: 10px;
}

#tree-table-div {
	margin: 10px;
}

#approval-table {
	text-align: center;
	width: 100%
}

.nav-tabs>li:before, .nav-tabs>li:after {
	content: " ";
	display: block;
	position: absolute;
	top: 0;
	height: 100%;
	width: 12px;
	background-color: #f7f7f7;
	transition: all 250ms ease;
}

.nav-tabs>li {
	float: left;
	position: relative;
	cursor: pointer;
	z-index: 2;
	transition: all 250ms ease;
	padding: 0;
	margin: 5px 12px -1px 0;
	background-color: #f7f7f7;
	border-top: 1px solid #d4d4d4;
	border-bottom: 1px solid #d4d4d4;
	list-style: none;
}

.nav-tabs>li>a {
	color: #999;
	display: block;
	padding: 4px 10px 1px 11px;
	text-decoration: none;
}

.nav-tabs>li:after {
	left: -4px;
	transform: skew(-25deg, 0deg);
	box-shadow: #d4d4d4 -1px 1px 0;
}

.nav-tabs>li {
	border-radius: 7px 7px 0 0;
}

.nav-tabs>li:before {
	right: -4px;;
	transform: skew(25deg, 0deg);
	box-shadow: #d4d4d4 1px 1px 0;
}

.nav-tabs>li:before {
	border-radius: 0 2px 0 0;
}

.nav-tabs>li:after {
	border-radius: 2px 0 0 0;
}

.link-tab:hover {
	background: #f7f7f7;
}

.wrapper-toolbar {
	padding: 10px 10px;
}

ul.nav-tabs {
	border-bottom: 1px solid #d4d4d4;
}

#grid-top-date {
	margin: 4px 0;
	line-height: 1.7;
	position: relative;
	display: inline-block;
}

#top-search-bar {
	width: 200px;
	align-content: flex-end;
	height: 18.53px;
}

#top-search-btn {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

#top-search-select {
	width: 77px;
	height: 20px;
	padding: 0px;
	height: 32.06px;
}

</style>


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
							<form class="form-inline">

								<!-- 검색 설정 -->
								<select class="btn btn-gradient-light" id="top-search-select">
									<option selected="selected">제목</option>
									<option>구분</option>
									<option>결재자</option>
								</select> 
								
								
								<input style="display: inline-block;" id="top-search-bar"
									class="form-control" type="search" placeholder="입력 후 [Enter]"
									aria-label="Search">
								<button id="top-search-btn" class="btn btn-info" type="submit">검색</button>

							</form>
						</div>
					</div>

					<ul class="nav-tabs">
						<li><a class="link-tab">전체</a></li>
						<li><a class="link-tab">기안중</a></li>
						<li><a class="link-tab">진행중</a></li>
						<li><a class="link-tab">반려</a></li>
						<li><a class="link-tab">결재</a></li>
					</ul>


					<div
						style="text-align: right; padding-top: 20px; padding-right: 10px">
						<div id="grid-top-date"></div>
					</div>
					<div id="content">


						<div class="container-fluid">


				  
				  
				
				    <table class="table-bordered mt-2" id="approval-table">
				        <thead>
				           <tr>
				             <th>선택</th>
				             <th>기안일자</th>
				             <th>제목</th>
				             <th>구분</th>
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
				             <td>${vo.approvalStartDate}</td>
				             <td>${vo.approvalTitle}</td>
				             <td>${vo.approvalContents}</td>
				             <td>${vo.drafter}</td>
				             <td id="check" data-check="${vo.approvalStatusCd}">${vo.lastApprover}</td>
				             <c:choose>
				             <c:when test="${vo.approvalStatusCd eq 'R001'}">
				             <td>기안중</td>
				             </c:when>
				             </c:choose>
				             <td><a>기안서 확인</a></td>
				           </tr>
				         </c:forEach>
				        </tbody>
				      
				    </table>
				  </div>
				  </div>
				  
				  
				  <!-- pagination -->
				  <div style="text-align: center; margin: 20px 20px">
				  <nav aria-label="Page navigation example" style="display: inline-block;">
  <ul class="pagination">
    <li class="page-item ${pager.pre?'':'disabled'}">
      <a class="page-link" href="/approval/getList?page=${startNum-1}" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    
    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item"><a class="page-link" href="/approval/getList?page=${i}">${i}</a></li>
    </c:forEach>
    
    <li class="page-item ${pager.next?'':'disabled'}">
      <a class="page-link" href="/approval/getList?page=${lastNum+1}" aria-label="Next">
        <i class="mdi mdi-arrow-right-drop-circle"></i>
      </a>
    </li>
  </ul>
</nav>

  <!-- Button List  -->
				  <div style="float: left;">
				  <button class="btn btn-info" onclick="location.href='/approval/add'">새 결재 진행</button>
				 
				</div>
			
				  
				  
				 


  </div>


<!-- Sign -->
<div style="float:left">
     <button type="button" class="btn" data-toggle="modal"  data-target="#stampModal">도장/서명 등록</button>
  </div> 
 
<!-- Stamp --> 
<div>
    <button type="button" class="btn" data-toggle="modal"  data-target="#signModal">서명 만들기</button>
</div> 
  

  
  


<!-- Modal -->

				  

<!-- Stamp-Modal -->
<div class="modal fade" id="stampModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="border-bottom: white; border-radius: 0rem;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">도장/서명올리기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
      <div>* 사인이나 도장이 나오는 이미지를 등록해주세요</div>
      
      
     
     
     <div id="sign-file-reg-div">
     <div>
     <form id="sign-frm">
      <input type="file" accept="image/*" id="file" name="file" onchange="loadFile(this)"> 
      </form>
      <div id="sign-file-div" onclick="document.getElementById('file').click()">
      <span class="material-symbols-outlined">upload</span>이곳을 클릭해서 이미지를 등록하세요
      
      </div>
       
         <div id="fileName"></div>
         
         
      <div id="image-show" style="padding: 30px 0 0 100px;"></div>
     
      
      </div>
     </div>
      

     
     
     
     <div style="border: 1px solid gray;">
     <div style="border-bottom: 1px solid gray;">
      미리보기
     </div>
         
        <div id="small-image-show" style="padding: 30px 0 0 195px; height: 100px;"></div>  
        </div>    
       
     
      
  </div>     
  
  
   
      <div class="modal-footer" style="background: white">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-info" id="sign-submit-btn">확인</button>
        
        </div>
      </div>
    </div>
   </div>
  
  
  <!-- Sign Modal  -->
  
  <div class="modal fade" id="signModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" id="sign-modal-size" role="document">
    <div class="modal-content" style="border-bottom: white; border-radius: 0rem;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">도장/서명올리기</h5>
        <!-- <button type="button" class="close btn-info" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> -->
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
            <button type="button" class="button save btn-info" data-action="save-png">PNG로 저장</button>
          </div>
          <div class="column">
            
          <!--   <button type="button" class="button save btn-info" data-action="save-jpg">JPG로 저장</button>
            <button type="button" class="button save btn-info" data-action="save-svg">SVG로 저장</button> -->
           
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
        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button> -->
         <button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>
<!-- modal end -->			
	


				</div>
              </div>
			</div>
</div>
		

	
			


	
	<script src="/js/commons/list-date.js"></script>
	<!-- Signature_pad -->
	  <script src="/js/commons/signature.js"></script>   
     <!-- <script src="/js/commons/app.js"></script>  -->
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
	
    
    
	<script src="/js/commons/sign.js"></script> 
	 



</body>
</html>