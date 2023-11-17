/**
 * notification 
 */

const alarmUL = document.querySelector("#alarmUL");
//  const alarmI = document.querySelector("#alarmI");
//  const alarmDiv = document.querySelector("#alarmDiv");
 var sock = null;

 $(document).ready(function(){
 	connectWs();

	 if (ws && ws.readyState === WebSocket.OPEN) {
        $.ajax({
            type: 'GET',
            url: '/setAlarm',
            success: function(result){
                console.log(result);
                let message = result.notificationTitle + ',' + result.notificationContents + ',' + result.notificationDate;
                ws.send(message);
            }
        });
    } else {
        console.error('WebSocket 연결이 완료되지 않았습니다.');
    }

 });

//소켓
 function connectWs(){
 	var ws = new SockJS("http://localhost:82/echo");
	sock = ws;

 	ws.onopen = function() {
 		console.log("연결완료");
	
 	};

	 

 	ws.onmessage = function(event) {
 		/* 받을 알람이 있을 때 */
 		console.log(event.data);
 		if(event.data.length>0){
 			let newAlarm = '';
            
			words=event.data.split(':');
		    title=words[0];
			contents=words[1];

			newAlarm='<a class="dropdown-item preview-item"><div class="preview-thumbnail"><div class="preview-icon bg-info"><span class="material-symbols-outlined">task</span></div></div><div class="preview-item-content d-flex align-items-start flex-column justify-content-center"><h6 class="preview-subject font-weight-normal mb-1">'+title+'</h6><p class="text-gray ellipsis mb-0">'+contents+'</p></div></a><div class="dropdown-divider"></div>';
 			
            console.log(newAlarm);
 			$('#alarmUL').after(newAlarm);
			// alarmDiv.style.visibility = "visible";
	}
 	};

 	ws.onclose = function() {
 	    console.log('close');
 	};
     
	
 };






// 결재시 메시지세팅

function setAlarm(){
    $.ajax({
        type:'GET',
        url:'/setAlarm',
        success:function(result){
            console.log(result);
            if(result && ws){

                let message=result.notificationTitle+','+result.notificationContents+','+result.notificationDate;
           
                ws.send(message);
            }
        }


    })

}
