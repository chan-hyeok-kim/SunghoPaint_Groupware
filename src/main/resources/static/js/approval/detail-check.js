
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

const appNo=$('#add-app').attr('data-no');

//approval/detail 서명하기 버튼
$('#form-mid-sign').click(function(){
	const imgTag='<img width="70px" height="40px" src="'+formSign+'">'
    
	if(!formSign){
		swal('서명이 없으면 사인하실 수 없습니다')
    	return;
	}

	let midSign=document.getElementsByClassName('mid-sign-tab');
	let topSign=document.getElementsByClassName('top-sign-tab');
	let botSign=document.getElementsByClassName('bot-sign-tab');

	//검토 확인 코드
	if(check.value=='R041'){
	    check.value='R042';
	    console.log('사인왜안됨')
		//R042 1회 검토
		//R043 2회 검토
		//2회 검토부터 분기점이 생긴다
        
		midSign[0].innerHTML=imgTag;

        let i=0;
		setTimeDept(i);


		//첫째 칸에 서명


	}else if(checkOriginValue=='R042'){
		//여기서 addapprover가 있으면 3회점검으로 바꾸기
		//없으면 바로 끝(cd를 승인으로 바꾸고 엔드날짜 추가하는 메서드로 쏴야됨)
		appNullCheck=$('#add-app').text();
        
		if(appNullCheck || appNullCheck!=''){
			check.value='R043';
		}else{
            statusCdCheck.value='R033'
		}
		
		midSign[1].innerHTML=imgTag;
		let i=1;
		setTimeDept(i);
		//둘째 칸에 서명
		
	}else if(checkOriginValue=='R043'){
		//2회 검토까지 온 경우는 무조건 3회로 바꾸면됨.
		//최대 3회이기 때문에 여기서 끝남.
		check.value='R044';
		statusCdCheck.value='R033'
		
		midSign[2].innerHTML=imgTag;
		let i=2;
		setTimeDept(i);
		//셋째 칸에 서명
	}else{
		return;
	}


    //서명시간, 부서 입력
    function setTimeDept(i){
	$.ajax({
		type:'GET',
		url:'/approval/signTime',
		success:function(result){
			console.log(result.deptName);
			console.log(result.signTime);
			topSign[i].innerText=result.deptName;
			botSign[i].innerText=result.signTime;
		}
	})
	}


})

if(rejectBtn){
//반려버튼 눌렀을 경우
rejectBtn.addEventListener("click",function(){
	Swal.fire({
		title:'정말 반려하시겠습니까?',
		text:'한번 더 신중한 검토 부탁드립니다',
	    icon:'question',
		showCancelButton:true,
		confirmButtonColor: 'blue',
		cancelButtonText:'취소',
	    reverseButtons: true,
	}).then(function(result){
		if(result.isConfirmed){
			statusCdCheck.value='R034';
            modContents.value=originContents;
			$('#app-check-frm').submit();
		}
	})
	
})
}

if(approvalBtn){

//결재버튼 눌렀을 경우
approvalBtn.addEventListener("click",function(){
    //서명했는지 체크해야됨.
	console.log($('.mid-sign-tab img').length)
  
	if((signOriginCount+1)!=$('.mid-sign-tab img').length){
		swal('결재하려면 먼저 서명해주세요')
		return;
	}

	let admon=$('textarea[name=admonition]').val()
	if(admon || admon.length!=0){
		swal('반려시에만 첨언 작성이 가능합니다')
		return;
	}

	Swal.fire({
		title:'정말 결재하시겠습니까?',
	 //   icon:'info',
		showCancelButton:true,
		iconHtml:'<i class="mdi mdi-bell-ring-outline"></i>',
		confirmButtonColor: 'blue',
		cancelButtonText:'취소',
		confirmButtonText:'확인',
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

}


//pdf다운 클릭
$('#app-pdf-btn').click(function(){
	let pdfHtml=contents.innerHTML;

	if(!pdfHtml || pdfHtml.trim()==''){
		return;
	}
    
	

	var oSerializer = new XMLSerializer();
	xmlString = oSerializer.serializeToString($('#show-contents')[0]);
    console.log(xmlString)

	$.ajax({
		type:"POST",
		 url:"/pdf/down",
		 data:{
			approvalContents:xmlString
		 },
		 xhrFields: {
			responseType: 'blob' // 서버로부터 Blob 형태의 데이터를 받음
		},success:function(data){
			console.log('다운 성공')

			var blob = new Blob([data], { type: 'application/pdf' });
			var link = document.createElement('a');
			link.href = window.URL.createObjectURL(blob);
			link.download = 'sample.pdf';
			document.body.appendChild(link);

			// 링크를 클릭하여 다운로드 시작
			link.click();

			// 링크 제거
			document.body.removeChild(link);

			//  filename="sample.pdf"
			//  console.log(result)
			//   const a = document.createElement("a");
			//   a.style = "display: none";
			//   a.href = result;
			//   a.download = filename;

			//   document.body.appendChild(a);
			//   a.click();
		 }
	})
})




//서버(백단)쪽에서 온 날짜 타입을 프론트단에서 쓸수있게 'yyyy/MM/dd'형식으로 바꿔주는 함수 
function javaDatetoScript(date){

	date=date.split(' ');
	
	//['Fri', 'Nov', '03', '22:48:52', 'KST', '2023']
	
	let param1=date[1]+' '+date[2]
	let param2=date[5]+' '+date[3]
	let param3=param1+', '+param2
	
	//var date2 = new Date('Jan 06, 2023 16:20:00');
	
	date2=new Date(param3);
	
	function CF_toStringByFormatting(source){
		var date = new Date(source);
		const year = date.getFullYear();
		const month = CF_leftPad(date.getMonth() + 1);
		const day = CF_leftPad(date.getDate());
		return [year, month, day].join('/');
	}
	
	function CF_leftPad(value){
		if (Number(value) >= 10) {
			return value;
		}
		return "0" + value;
	}
	
	returnStr1=CF_toStringByFormatting(date2)
	
	return returnStr1
	}
	

