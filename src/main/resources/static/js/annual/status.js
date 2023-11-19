$(function(){
	$("form").attr("action", "./status");
});

$(function(){
	$("#checkAll").change(function(){
		let checked = $(this).is(":checked");
		$("input[type='checkbox']").prop("checked", checked);
	});
	
	$("#setAnnualLeave").click(function(){
		let checked = $("input[type='checkbox']:not(#checkAll):checked");
		if(checked.length > 0){
			let element = "";
			if(checked.length == 1){
				let name = checked.parent().siblings(".name").html();
				let joinDate = checked.parent().siblings(".joinDate").html();
				
				element = "<div>" +
								  "<h2>성명</h2>" +
								  "<span>" + name + "</span>" +
							  "</div>" +
							  "<div>" +
								  "<h2>입사일</h2>" +
								  "<span>" + joinDate + "</span>" +
							  "</div>";
			}
			
			$("body").append("<div id='setAnnualBackground'>" +
										"<div id='setAnnual'>" +
											"<h1 id='title'>연차 조정</h1>" +
											element +
											"<div>" +
												"<h2>연차 수</h2>" +
												"<input type='number' value='0' min='0' max='100'>" +
												"<select>" +
													"<option value='add'>추가</option>" +
													"<option value='sub'>제외</option>" +
												"</select>" +
											"</div>" +
											"<div>" +
												"<h2>내용</h2>" +
												"<textarea></textarea>" +
											"</div>" +
											"<div>" +
												"<button id='apply'>적용</button>" +
												"<button id='cancel'>취소</button>" +
											"</div>" +
										"</div>" +
									"</div>");
		}else{
			alert("선택된 항목이 없습니다.");
		}
	});
	
	$("body").on("click", "#setAnnual #apply", function(){
		let annuals = new Array();
		
		let annualCount = parseInt($("#setAnnual input[type='number']").val());
		if($("#setAnnual option:selected").val() == "sub") annualCount = annualCount * -1;
		
		let checked = $("input[type='checkbox']:not(#checkAll):checked");
		$.each(checked, function(index, element){
			let parent = $(element).parent();
			
			let employeeID = parent.siblings(".employeeID").html();
			let occurrence = parent.siblings(".occurrence").html();
			let total = parent.siblings(".total").html();
			let used = parent.siblings(".used").html();
			let have = parent.siblings(".have").html();
			
			occurrence = (occurrence = parseInt(occurrence) + annualCount) < 0 ? 0 : occurrence;
			total = (total = parseInt(total) + annualCount) < 0 ? 0 : total;
			have = (have = total - parseInt(used)) < 0 ? 0 : have;
			
			parent.siblings(".occurrence").html(occurrence);
			parent.siblings(".total").html(total);
			parent.siblings(".have").html(have);
			
			let annual = new Object();
			annual.employeeID = employeeID;
			annual.occurrenceAnnualLeave = occurrence;
			annual.totalAnnualLeave = total;
			annual.haveAnnualLeave = have;
			
			
			let annualLeaveOccurredHistorys = new Array();
			let annualLeaveOccurredHistory = new Object();
			annualLeaveOccurredHistory.employeeID = employeeID;
			annualLeaveOccurredHistory.occurredType = ($("#setAnnual option:selected").val() == "sub") ? 1 : 0;
			annualLeaveOccurredHistory.occurredCount = Math.abs(annualCount);
			annualLeaveOccurredHistory.description = $("#setAnnual textarea").val();
			
			annualLeaveOccurredHistorys.push(annualLeaveOccurredHistory);
			annual.annualLeaveOccurredHistorys = annualLeaveOccurredHistorys;
			
			annuals.push(annual);
		});
		
		$.ajax({
			url:"./update",
			type:"POST",
			contentType:"application/json",
			data:JSON.stringify(annuals),
			success:function(result){
				$("#setAnnualBackground").remove();
			}
		});
	});
	
	$("body").on("click", "#setAnnual #cancel", function(){
		$("#setAnnualBackground").remove();
	});
});

$(function(){
	$("#excelDownload").click(function(){
		excelDownload("./status/excelDownload");
	})
});