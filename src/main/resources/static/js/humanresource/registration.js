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
	$("#modal-submit").click(function(){
		fullAddr = fullAddr + " " + $("#message-text").val();
		$("input[name='address']").val(fullAddr);
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
	$("#regist").click(function(){
		let quitDate = $("[name='quitDate']");
		if(quitDate.val() == ""){
			quitDate.val("1995-07-28"); // 1995-07-28 == NULL
		}
		
		$("#registrationForm").submit();
	});
});