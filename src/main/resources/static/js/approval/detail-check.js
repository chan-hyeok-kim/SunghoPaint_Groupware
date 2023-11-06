/**
 * 
 */
const contents=document.getElementById('show-contents');
const modContents=document.getElementById('mod-contents');
const check=document.getElementById('check');
const statusCdCheck=document.getElementById('status-cd-check');

const rejectBtn=document.getElementById('app-reject-btn');
const approvalBtn=document.getElementById('approval-btn');

var checkOriginValue=check.value;
//결재했는지 확인용
var originContents=contents.innerHTML;
//서명해서 내용바뀌었는지 확인용
var signOriginCount=$('.mid-sign-tab img').length;
//서명했는지 확인용



//approval/detail 서명하기 버튼
$('#form-mid-sign').click(function(){
	const imgTag='<img width="70px" height="40px" src="'+formSign+'">'
    
	if(!formSign){
		swal('서명이 없으면 사인하실 수 없습니다')
    	return;
	}

	let midSign=document.getElementsByClassName('mid-sign-tab');
	//검토 확인 코드
	if(check.value=='R041'){
	    check.value='R042';
	    console.log('사인왜안됨')
		//R042 1회 검토
		//R043 2회 검토
		//2회 검토부터 분기점이 생긴다

		midSign[0].innerHTML=imgTag;
		//첫째 칸에 서명

	}else if(check.value=='R042'){
		//여기서 addapprover가 있으면 3회점검으로 바꾸기
		//없으면 바로 끝(cd를 승인으로 바꾸고 엔드날짜 추가하는 메서드로 쏴야됨)
		appNullCheck=$('#add-app').text();
        
		if(appNullCheck || appNullCheck!=''){
			check.value='R043';
		}else{
            statusCdCheck.value='R033'
		}
		
		midSign[1].innerHTML=imgTag;
		//둘째 칸에 서명
		
	}else if(check.value=='R043'){
		//2회 검토까지 온 경우는 무조건 3회로 바꾸면됨.
		//최대 3회이기 때문에 여기서 끝남.
		check.value='R044';
		statusCdCheck.value='R033'
		
		midSign[2].innerHTML=imgTag;
		//셋째 칸에 서명
	}else{
		return;
	}


    


})


//반려버튼 눌렀을 경우
rejectBtn.addEventListener("click",function(){
	Swal.fire({
		title:'정말 반려하시겠습니까?',
		text:'한번 더 신중한 검토 부탁드립니다',
	    icon:'question',
		showCancelButton:true,
		confirmButtonColor: 'blue',
		cancleButtonText:'취소',
	    reverseButtons: true,
	}).then(function(result){
		if(result.isConfirmed){
			statusCdCheck.value='R034'
			$('#app-check-frm').submit();
		}
	})
	
})

//결재버튼 눌렀을 경우
approvalBtn.addEventListener("click",function(){
    //서명했는지 체크해야됨.
	console.log($('.mid-sign-tab img').length)
  
	if((signOriginCount+1)!=$('.mid-sign-tab img').length){
		swal('결재하려면 먼저 서명해주세요')
		return;
	}

	Swal.fire({
		title:'정말 결재하시겠습니까?',
	 //   icon:'info',
		showCancelButton:true,
		iconHtml:'<i class="mdi mdi-bell-ring-outline"></i>',
		confirmButtonColor: 'blue',
		cancleButtonText:'취소',
	    reverseButtons: true,
		customClass: {
			icon: 'no-border'
		  }
	}).then(function(result){
		if(result.isConfirmed){
		
			if(contents.innerHTML!=originContents){
				modContents.value=contents.innerHTML;
				$('#app-check-frm').submit();
			}
			
		}
	})
})