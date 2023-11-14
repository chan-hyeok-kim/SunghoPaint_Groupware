$(function(){
	$("#findPw").click(function(){
		if($("#findPwForm").length == 0){
			$("body").append("<div id='findPwForm'>" +
										"<img src='/images/humanResource/close-icon.png' id='closeBtn'>" +
										"<h1>비밀번호 찾기</h1>" +
										"<div>" +
											"<span>등록된 이메일로 임시 비밀번호를 전송해드립니다.</span>" +
											"<input type='text' id='empID' placeholder='사번을 입력해주세요.'>" +
											"<button id='findBtn'>찾기</button>" +
										"</div>" +
									"</div>");
		}
	});
	
	$("body").on("click", "#findPwForm #closeBtn", function(){
		$("#findPwForm").remove();
	});
	
	$("body").on("click", "#findPwForm #findBtn", function(){
		let empID = $("#findPwForm #empID").val();
		if(empID){
			$.ajax({
				url:"/humanresource/checkEmployeeID",
				type:"GET",
				data:{
					employeeID:empID
				},
				success:function(result){
					if(result){
						$("body").append("<div id='loading'></div>");
						
						$.ajax({
							url:"/humanresource/findPw",
							type:"GET",
							data:{
								employeeID:empID
							},
							success:function(result){
								alert("'" + result + "'" + "로 임시 비밀번호를 전송했습니다.");
								$("#loading").remove();
								$("#findPwForm").remove();
							}
						});
					}else{
						alert("옳지 않은 사번입니다.");
					}
				}
			});
		}else{
			alert("사번을 입력해주세요.");
		}
	});
});