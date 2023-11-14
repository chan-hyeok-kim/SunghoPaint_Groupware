const addTaskBtn=document.getElementById('add-task');


//$('#toggle-slide-List').

const leftToggle=document.getElementById('minimize-toggle')
             
             leftToggle.addEventListener("click", function() {
                 if ((document.querySelector('body').classList.contains('sidebar-toggle-display')) || (document.querySelector('body').classList.contains('sidebar-absolute'))) {
                	 document.querySelector('body').classList.toggle('sidebar-hidden');
                 } else {
                	 document.querySelector('body').classList.toggle('sidebar-icon-only');
                 }
               });


const rightToggle=document.getElementById('todolist-toggle')

rightToggle.addEventListener('click',function(){
    console.log('클릭 확인')
    $('.toggle-slide-List').toggleClass('active')

})

/**
 * notification 
 */

const alarmUL = document.querySelector("#alarmUL");
const alarmI = document.querySelector("#alarmI");
const alarmDiv = document.querySelector("#alarmDiv");
var sock = null;

$(document).ready(function(){
	connectWs();

});

//소켓
// function connectWs(){
// 	var ws = new SockJS("http://localhost:82/echo");
// 	sock = ws;

// 	ws.onopen = function() {
// 		console.log("연결완료");
//  		ws.send($('#socketuserID').val());
// 	};

// 	ws.onmessage = function(event) {
// 		/* 받을 알람이 있을 때 */
// 		console.log(event.data);
// 		if(event.data.length>0){
// 			let newAlarm = '';
// 			newAlarm += '<li scope="col">' + event.data + "</li>"
// 			$('#alarmUL').append(newAlarm);
// 			alarmDiv.style.visibility = "visible";
// 		}
// 	};

// 	ws.onclose = function() {
// 	    console.log('close');
// 	};

// };

/* 알람창 추가 */

// alarmI.addEventListener('click', function(){
// 	alarmUL.classList.toggle('visible');
// 	$(this).stop(false, false);
// });

// alarmUL.addEventListener('click', function(e){
// 	var endIdx = e.target.textContent.indexOf(")");
// 	var idx = e.target.textContent.substr(1, endIdx-1);

// 	$.ajax({
// 		url : '/alarmDel',
// 		data : {"idx" : idx},
// 		type : 'post',
// 		success : function(data){
// 			console.log(data);
// 			alert("성공");
// 		}
// 	})
	
// 	$(e.target).remove();
// 	if(alarmUL.children.length == 0){
// 		alarmDiv.style.visibility = "hidden";
// 	}
	
// })