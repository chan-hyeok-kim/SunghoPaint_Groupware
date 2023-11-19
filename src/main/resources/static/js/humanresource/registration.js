function updateRole(employeeID){
	if($("#updateRoleWindow").length > 0) $("#updateRoleWindow").remove();
	
	$.ajax({
		url:"/humanresource/getAccountRole",
		type:"GET",
		data:{
			employeeID:employeeID
		},
		success:function(result){
			$("body").append("<div id='updateRoleWindow'>" +
										"<div id='titleBar'>" +
											"<p>권한 변경</p>" +
											"<img id='close' src='/images/commons/close-icon.png'>" +
										"</div>" +
										"<div id='list'>" +
											"<table>" +
												"<tr>" +
													"<th></th>" +
													"<th>권한명</th>" +
												"</tr>" +
												"<tr>" +
													"<td><input type='checkbox' id='R001' value='1'></td>" +
													"<td>관리자</td>" +
												"</tr>" +
												"<tr>" +
													"<td><input type='checkbox' id='R002' value='2'></td>" +
													"<td>결재자</td>" +
												"</tr>" +
												"<tr>" +
													"<td><input type='checkbox' id='R003' value='3'></td>" +
													"<td>일반</td>" +
												"</tr>" +
											"</table>" +
										"</div>" +
										"<div id='footer'>" +
											"<button id='update'>변경</button>" +
										"</div>" +
									"</div>");
			
			result.forEach(function(element, index){
				$("#" + element).prop("checked", true);
			});
			
			$("#updateRoleWindow").draggable({
				handle:"#titleBar",
				cancel:"#close",
				containment:"document"
			});
			
			$("#updateRoleWindow #close").click(function(){
				$("#updateRoleWindow").remove();
			});
			
			$("#updateRoleWindow #update").click(function(){
				let accountRoles = new Array();
				$.each($("#updateRoleWindow input[type='checkbox']:checked"), function(index, element){
					let accountRole = new Object();
					accountRole.roleNum = $(element).attr("value");
					accountRole.employeeID = employeeID;
					
					accountRoles.push(accountRole);
				});
				
				if(accountRoles.length == 0){
					let accountRole = new Object();
					accountRole.roleNum = -1;
					accountRole.employeeID = employeeID;
					
					accountRoles.push(accountRole);
				}
				
				$.ajax({
					url:"/humanresource/setUpdateAccountRole",
					type:"POST",
					contentType:"application/json",
					data:JSON.stringify(accountRoles),
					success:function(result){
						console.log(result);
					}
				});
				
				$("#updateRoleWindow").remove();
			});
		}
	});
}





let postcodePopup;
let fullAddr;
function daumPostcode(){
	if(postcodePopup == undefined){
		postcodePopup  = new daum.Postcode({
	        oncomplete:function(data){
	            let addr = "";
	            let extraAddr = "";
				fullAddr = "";
	            
	            if(data.userSelectedType === "R"){ // 도로명(R)
	            	addr = data.roadAddress;
	            }else { // 지번(J)
	            	addr = data.jibunAddress;
	            }
	            
	            if(data.userSelectedType === "R"){
	            	if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
	            		extraAddr += data.bname;
	                }
	    			
	                if(data.buildingName !== "" && data.apartment === "Y"){
	                	extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
	                }
	    			
	                if(extraAddr !== ""){
	                	extraAddr = "(" + extraAddr + ")";
	                }
	                
	                fullAddr = extraAddr;
	            }
	            
	            fullAddr = "(" + data.zonecode + ")" + addr + fullAddr;

				$("#message-text").val("");
	            $("#addressDetailModal").modal("show");
	        },
	        onclose:function(state){
	        	postcodePopup = undefined;
	        }
	    });
	    
		postcodePopup.open();
	}else{
		alert("팝업 창이 이미 존재합니다.");
	}
}

$(function(){
	// shown.bs.modal : Modal 창이 화면에 표시된 후 발생하는 이벤트
	$("#addressDetailModal").on("shown.bs.modal", function(){
		$("#message-text").focus();
	});
	
	$("[data-dismiss]").click(function(){
		$("#addressDetailModal").modal("hide");
	});
	
	$("#modal-submit").click(function(){
		fullAddr = fullAddr + " " + $("#message-text").val();
		$("input[name='address']").val(fullAddr);
		$("#addressDetailModal").modal("hide");
	});
	
	$("#message-text").keypress(function(e){
		if(e.which == 13){
			$("#modal-submit").trigger("click");
		}
	});
});





function validation(file){
    var file_path = file.value;
    var reg = /(.*?)\.(jpg|bmp|jpeg|png)$/;
    
    if(file_path != "" && (file_path.match(reg) == null || reg.test(file_path) == false)){
        file.value = "";
        alert("이미지 파일만 업로드 가능합니다.");
    }
}

function processFile(file){
    let reader = new FileReader();
    reader.readAsDataURL(file);

    reader.onload = function(){
        let result = reader.result; // result : Base64
        $("#profile > img").attr("src", result);
    }
}

$(function(){
    $("#profile > input[type='file']").change(function(event){
        processFile(event.target.files[0]);
    });
});





$(function(){
	$("input[data-search-type]").click(function(){
		let searchType = $(this).attr("data-search-type");
		createSearchWindow(searchType);
		
		$("#searchWindow #apply").click(function(){
			let checked = $(".select > input[type='checkbox']:checked");
			
			if(checked.length == 0){
				alert("항목을 선택해주세요.");
			}else{
				if(searchType == "department"){
					$("input[name='departmentCd']").val(checked.parent().siblings(".code").html());
					$("input[name='departmentCdName']").val(checked.parent().siblings(".codeName").html());
				}else if(searchType == "position"){
					$("input[name='positionCd']").val(checked.parent().siblings(".code").html());
					$("input[name='positionCdName']").val(checked.parent().siblings(".codeName").html());
				}
				
				$("#searchWindow").remove();
			}
		});
	});
});





$(function(){
	$("#regist, #update").click(function(){
		let quitDate = $("[name='quitDate']");
		if(quitDate.val() == ""){
			quitDate.val("1995-07-28"); // 1995-07-28 == NULL
		}
		
		$("body").append("<div id='loading'></div>");
		
		$("form#registrationForm").submit();
	});
});