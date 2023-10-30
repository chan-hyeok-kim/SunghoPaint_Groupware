$(function(){
	$(".search").click(function(){
		$("body").append("<div id='searchWindow'>" +
							 "<div id='titleBar'>" +
								 "<p>○○구분 리스트</p>" +
							 "</div>" +
							 "<div id='list'>" +
								 "<h1>안녕하세요!</h1>" +
							 "</div>" +
						 "</div>");

		$("#searchWindow").draggable({
			handle:"#titleBar",
			containment:"document",
		});
	});
});