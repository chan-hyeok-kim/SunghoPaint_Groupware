// /**
//  * notification 
//  */

const alarmUL = document.querySelector("#alarmUL");

 var sock = null;
 var ws = null;

 $(document).ready(function(){
 	connectWs();

 });

 
//소켓
 function connectWs(){
	 ws = new SockJS("http://localhost:82/echo");
	sock = ws;

 	ws.onopen = function() {
 		console.log("연결완료");
	     // 결재시 메시지세팅

	   setAlarm();
 	};

	

 	ws.onmessage = function(event) {
 		/* 받을 알람이 있을 때 */
 		console.log(event.data);
 		if(event.data.length>0){
 			let newAlarm = '';
            
			words=event.data.split(':');
		    title=words[0];
			contents=words[1];
            //time=words[2];
            no=words[2];
			icon='';
			backColor='';
			if(title=='승인 완료'){
				icon='task'
				backColor='info';
			}else if(title=='반려'){
				icon='free_cancellation'
				backColor='danger';
			}
			newAlarm='<span class="dropdown-item preview-item"><div class="preview-thumbnail"><div class="preview-icon bg-'+backColor+'"><span class="material-symbols-outlined">'+icon+'</span></div></div><div class="preview-item-content d-flex align-items-start flex-column justify-content-center"><h6 class="preview-subject font-weight-normal mb-1">'+title+'<i style="margin-left:5px;" class="mdi mdi-close-box alarm-check-icon" data-no="'+no+'"></i></h6><p class="text-gray mb-0">'+contents+'</p></div></span><div class="dropdown-divider"></div>';
 			
            console.log(newAlarm);
 			$('#alarmUL').after(newAlarm);
			// alarmDiv.style.visibility = "visible";
	}
 	};

 	ws.onclose = function() {
 	    console.log('close');
 	};
     
	
 };






 function setAlarm(){
    $.ajax({
        type:'GET',
        url:'/setAlarm',
        success:function(result){
            console.log(result);
            if(result && ws){
         
				for(r of result){
					let message=r.notificationTitle+','+r.notificationContents+','+r.notificationDate+','+r.notificationNo;
			   
					ws.send(message);
					}
            }
        }


    })

}



