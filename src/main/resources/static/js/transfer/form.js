$(function(){
	$(".search").click(function(){
		$("body").append("<div id='searchWindow'>" +
							 "<div id='titleBar'>" +
								 "<p>○○구분 리스트</p>" +
								 "<img src=''>" +
							 "</div>" +
							 "<div id='list'>" +
								 "<h1>안녕하세요!</h1>" +
							 "</div>" +
						 "</div>");

		$("#searchWindow").draggable({
			handle:"#titleBar",
			cancel:"#titleBar > img",
			containment:"document",
			
			create:function(){
				var position = $(this).offset();
				$(this).css("margin", "0px").offset({
					top:position.top,
					left:position.left
				});
			}
		});
	});
});