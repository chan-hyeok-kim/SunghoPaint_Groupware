function excelDownload(url){
	$("body").append("<div id='loading'></div>");
	
	$.ajax({
		url:url,
		type:"GET",
		xhrFields:{
			responseType:"blob"
		},
		success:function(blob, status, xhr){
			let fileName = "";
			let disposition = xhr.getResponseHeader('Content-Disposition');
			// console.log(disposition);
			
			// - 파일명 추출 -
			if(disposition && disposition.indexOf('attachment') !== -1){
				let filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
				let matches = filenameRegex.exec(disposition);
				if(matches != null && matches[1]){
					fileName = decodeURIComponent(matches[1].replace(/['"]/g, ''));
				}
			}
			
			// - 다운로드 링크 생성 후 trigger -
			let a = $("<a></a>");
			let url = window.URL.createObjectURL(blob);
			a.attr("href", url);
			a.attr("download", fileName || "이름 없음.xlsx");
			
			/*
				아래와 같이 DOM에 엘리먼트를 추가하지 않고, 바로 trigger하는 경우와
				jQuery의 trigger 메서드를 이용하여 click 이벤트를 강제로 발생시키는 경우,
				브라우저 보안 정책에 의해 제대로 작동하지 않을 수도 있다고 한다.
			*/
			// a[0].click();
			$("body").append(a);
			a[0].click(); // a.trigger("click");
			a.remove();
			
			// 리소스 해제(메모리 누수 방지)
			window.URL.revokeObjectURL(url);
			
			$("#loading").remove();
		}
	})
}