// /**
//  * notification 
//  */



$('#notification-toggle-li').on('shown.bs.dropdown', function () {
  // 드롭다운이 표시될 때 실행되는 코드
  $(this).find('.dropdown-menu i').click(function () {
    // 각 링크에 대한 작업 수행
   
	$(this).parent().parent().parent().remove();
    console.log($(this).attr('data-no'))
    $.ajax({
		type:'GET',
		url:'/alarm/update',
		data:{
			notificationNo: $(this).attr('data-no')
		},success:function(result){
          if(result.trim()>0){
			console.log('업뎃 성공')
		  }
		}
	})
  });
});