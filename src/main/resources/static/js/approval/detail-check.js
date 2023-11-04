/**
 * 
 */
const contents=document.getElementById('show-contents');
const modContents=document.getElementById('mod-contents');
const check=document.getElementById('check');


//approval/detail 서명하기 버튼
$('#form-mid-sign').click(function(){
	const imgTag='<img width="70px" height="40px" src="'+formSign+'">'
    
	if(!formSign){
		swal('서명이 없으면 사인하실 수 없습니다')
    	return;
	}

	
	//검토 확인 코드
	if(check.value=='R041'){
	    check.value='R042';
		let midSign=document.getElementsByClassName('mid-sign-tab');
	    console.log('사인왜안됨')
		for(let i in midSign){
			midSign[0].innerHTML=imgTag;
		}

	}else if(check.value=='R042'){
		check.value='R043';
        

	}else{
		check.value='R044';
		
	}


    if()


})
