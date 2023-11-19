/*
	function del(employeeID, event){
		if(confirm("'" + employeeID + "' 사원의 정보를 삭제하시겠습니까?")){
			location.href = "./delete?employeeID=" + employeeID;
		}
		
		event.stopPropagation();
	}
*/

$(function(){
	$("#excelDownload").click(function(){
		excelDownload("./list/excelDownload");
	});
});