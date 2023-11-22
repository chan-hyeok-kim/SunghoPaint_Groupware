$('#delete-btn').click(function() {
	
    let arr = new Array();
    $('input[name=checkList]:checked').each(function() {
        arr.push($(this).val());
        
    })
    console.log(arr);
    if (!arr || arr.length==0 || arr=='') {
        swal('반드시 한개 이상 체크해주세요');
        return;
    }
    
    Swal.fire({
        text: '정말로 삭제하시겠습니까?',
        showCancelButton: true, 
        confirmButtonText: '승인',
        confirmButtonColor: 'red',
        cancelButtonText:'취소',
        reverseButtons: true,
        icon: 'warning',
    }).then(function(result) {
        if(result.isConfirmed){
        $.ajax({
        type: 'POST',
        url: '/code/upDelete',
        data: {
            deleteCdArr: arr
        }, success: function(result) {
            if(result.trim()>0){
                location.replace('/code/list')
            }
            
        }, error: function() {
    
        }
    
    })
    }
    })
    
    
    })
    
  