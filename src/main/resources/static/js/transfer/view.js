$(function(){
	$(".page-link").click(function(){
		let page = $(this).attr("data-num");
		$("form > input[name='page']").val(page);
		
		$("form").submit();
	});
});