/**
 * notification 
 */

const alarmUL = document.querySelector("#alarmUL");
//  const alarmI = document.querySelector("#alarmI");
//  const alarmDiv = document.querySelector("#alarmDiv");
 var sock = null;

 $(document).ready(function(){
 	connectWs();

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
 			newAlarm += '<li scope="col">' + event.data + "</li>"
      console.log(newAlarm);
 			$('#alarmUL').append(newAlarm);
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
