let postcodePopup;
function daumPostcode(){
	if(postcodePopup == undefined){
		postcodePopup  = new daum.Postcode({
	        oncomplete:function(data){
	            let addr = "";
	            let extraAddr = "";
	            let fullAddr = "";
	            
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
	$("#modal-submit").click(function(){
		alert($("#message-text").html());
		$("#addressDetailModal").modal("hide");
	});
	
	$("[data-dismiss]").click(function(){
		$("#addressDetailModal").modal("hide");
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
	$("input[name='departmentCdName']").click(function(){
		if($("#searchWindow").length > 0) $("#searchWindow").remove();
		
		$("body").append("<div id='searchWindow'>" +
									"<div id='titleBar'>" +
										"<p>부서 리스트</p>" +
										"<img id='close' src='/images/commons/close-icon.png'>" +
									"</div>" +
									"<div id='list'>" +
										"<table>" +
											"<tr>" +
												"<th></th>" +
												"<th>부서 코드</th>" +
												"<th>부서명</th>" +
											"</tr>" +
										"</table>" +
									"</div>" +
									"<div id='footer'>" +
										"<button id='apply'>적용</button>" +
									"</div>" +
								"</div>");
		
		$.ajax({
			url:"/transfer/getCodeList",
			type:"GET",
			data:{upCode:"D00"},
			success:function(result){
				list_json = JSON.parse(JSON.stringify(result));
				$.each(list_json, function(index, element){
					$("#searchWindow #list > table").append("<tr>" +
																				"<td class='select'><input type='checkbox'></td>" +
																				"<td>" + element.code + "</td>" +
																				"<td>" + element.codeName + "</td>" +
																			"</tr>");
				});
				
				$(".select > input[type='checkbox']").change(function(){
					if($(this).is(":checked")){
						$(".select > input[type='checkbox']").not(this).prop("checked", false);
					}
				});
			}
		});
		
		$("#searchWindow").draggable({
			handle:"#titleBar",
			cancel:"#close",
			containment:"document"
		});
		
		$("#apply").click(function(){
			let checked = $(".select > input[type='checkbox']:checked");
			
			if(checked.length == 0){
				alert("항목을 선택해주세요.");
			}else{
				$("input[name='departmentCd']").val(checked.parent().siblings("td:nth-of-type(2)").html());
				$("input[name='departmentCdName']").val(checked.parent().siblings("td:nth-of-type(3)").html());
				$("#searchWindow").remove();
			}
		});
		
		$("#close").click(function(){
			$("#searchWindow").remove();
		});
	});
});