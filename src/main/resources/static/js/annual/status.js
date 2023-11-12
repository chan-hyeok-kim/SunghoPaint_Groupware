$(function(){
	$("form").attr("action", "./status");
});

$(function(){
	$("#excelDownload").click(function(){
		excelDownload("./status/excelDownload");
	})
});