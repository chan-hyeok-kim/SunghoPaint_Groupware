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
</head>
<body id="page-top">
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="card">
				<div class="card-body">

					<div class="wrapper-toolbar">

						내 결재 관리 <span
							style="margin-left: 650px; text-align: right; width: 700px;">
							<form class="form-inline"
								style="width: 700px; display: inline-block;">

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
						</span>
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
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <i class="mdi mdi-arrow-left-drop-circle"></i>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
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
<div>
     <button type="button" class="btn" data-toggle="modal"  data-target="#signModal">My 도장/서명</button>
  </div> 
  
  

  
  


<!-- Modal -->

				  

<!-- Sign-Modal -->
<div class="modal fade" id="signModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content" style="border-bottom: white; border-radius: 0rem;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">도장/서명올리기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <div>1. 등록할 이미지를 선택한 후, 사용할 영역을 선택합니다.</div>
      
      
     <div style="display: flex;">
     
     <div style="border: 1px solid gray">
     <div style="border: 1px solid gray;">
      Before: 원본 사진
      <input type="file" accept="image/*" id="file" name="file" style="display: none;" onchange="loadFile(this)">
      <div onclick="document.getElementById('file').click()">이미지 삽입</div>
       
         <div id="fileName"></div>
      <div id="image-show"></div>
      
      </div>
     </div>
     
     
     
     <div style="border: 1px solid gray;">
     <div style="border: 1px solid gray;">
      After
     </div>
        <div id="small-image-show" style="align-content: center"></div>  
        </div>    
     </div>
      
      
  </div>     
  
  
      </div>
      <div class="modal-footer" style="background: white">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>

<!-- modal end -->			
	


				</div>
</div>
			</div>

		

	
			


	
	<script src="/js/commons/list-date.js"></script>
	
<script type="text/javascript">
function loadFile(input) {
    var file = input.files[0];	//선택된 파일 가져오기

    //미리 만들어 놓은 div에 text(파일 이름) 추가
    var name = document.getElementById('fileName');
    name.textContent = file.name;

  	//새로운 이미지 div 추가
    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');
    newImage.setAttribute("id", 'file-img');
    
    //이미지 source 가져오기
    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
      //버튼을 누르기 전까지는 이미지를 숨긴다
    newImage.style.objectFit = "contain";

    //이미지를 image-show div에 추가
    var container = document.getElementById('image-show');
    container.appendChild(newImage);
    
    document.getElementById('fileName').textContent = null; 
    
    var fileUrl = $('#file-img').attr('src');
    console.log();
    $('#small-image-show').append('<img src='+fileUrl+' width="60px" height="40px">')
    
};
    //작은 이미지
   
    
    
    /* var submit = document.getElementById('submitButton');
    submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

    function showImage() {
        var newImage = document.getElementById('image-show').lastElementChild;
      
        //이미지는 화면에 나타나고
        newImage.style.visibility = "visible";
      

           //기존 파일 이름 지우기
    } */

let cdcheck=$('#check').attr('data-check');
console.log(cdcheck);

</script>
</body>
</html>