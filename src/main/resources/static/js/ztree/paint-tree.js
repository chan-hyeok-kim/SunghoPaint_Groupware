var zTreeObj1;
// zTree configuration information, refer to API documentation (setting details)
var humanSetting = {
	check: {
		autoCheckTrigger: false,
		chkStyle: "checkbox",
		enable: true,
		chkboxType: { "Y": "p", "N": "ps" },
		nocheckInherit: false,
		chkDisabledInherit: false,
		radioType: "level"
	},
	callback: {
		onCheck: myOnCheck,

	}
	,data: {
		simpleData: {
			enable: true,
			pIdKey: "pid",
		}
	}
	
};



/**
 * 인사코드 가져오기*/
var humanNodes=new Array();



$.ajax({
	type: 'GET',
	url: '/code/approvalLineDept',
	success: function(result) {
		console.log(result);
             humanNodes=result;
			 humanNodes.push({name: "페인트 오피스", 
			 id:'0', open: true, 
			 pid: 'root', iconOpen:'/css/zTreeStyle/img/diy/1_open.png',
			 iconClose:'/css/zTreeStyle/img/diy/1_close.png'
			,checked:true,
		}); 
	}
})

$.ajax({
	type:'GET',
	 url:'/approval/search',
	 data:{
		search:''
	 },success:function(result){
		console.log(result);

		
		zNodesList=result
		
		
		
		 /** 두번째 트리 세팅*/
		 var settingList = {
			
			callback: {
				onClick: employeeOnCheck,
			},view:{
				showLine: false,
				
			}
			,
		};

		/**노드에 값 넣어서 표시해주기 */
		function employeeOnCheck(event, treeId, treeNode) {
			dept=treeNode.dept;
			rank=treeNode.rank;
			employeeName = treeNode.name;
			empId=treeNode.empId
		}





		zTreeObj1 = $.fn.zTree.init($("#tree_list"), settingList, zNodesList);
		
	
	 }
	})
console.log(humanNodes)

/**
   * 체크 시 데이터 표시*/

var employeeNum;
var employeeName = '';
var rank;
var dept;
var empId;

var zNodesList;
function myOnCheck(event, treeId, treeNode) {

    otherNodes = $('#' + treeNode.tId).siblings();
	
	
	for (let i=0; i<otherNodes.length; i++){
		node=otherNodes.get(i);
		
		span=node.children.item(1)
		span.className='button chk checkbox_false_full';
		
	}

	nodes=treeNode.getParentNode();
    if(!nodes && treeNode.checked==true){
		$.ajax({
			type:'GET',
			 url:'/approval/search',
			 data:{
				search:''
			 },success:function(result){
				console.log(result);
	
				
				zNodesList=result
				
				
				
				 /** 두번째 트리 세팅*/
				 var settingList = {
					
					callback: {
						onClick: employeeOnCheck,
					},view:{
						showLine: false
					}
					,
				};
		
				/**노드에 값 넣어서 표시해주기 */
				function employeeOnCheck(event, treeId, treeNode) {
					dept=treeNode.dept;
					rank=treeNode.rank;
					employeeName = treeNode.name;
					empId=treeNode.empId
				}
		
		
		
		
		
				zTreeObj1 = $.fn.zTree.init($("#tree_list"), settingList, zNodesList);
				
				return;
			 }
			})
	}
	let childArr = nodes.children;
	
	for (i of childArr) {
		if (treeNode.name != i.name) {
			i.checked = false;
			zTreeObj1.updateNode(i)
		}
		

	}






    console.log(treeNode.name)

	let deptCode = ''
	if (treeNode.name=="인사부") {
		deptCode = 'D001'
	} else if (treeNode.name=="총무부") {
		deptCode = 'D002'
	} else if (treeNode.name=="생산부") {
		deptCode = 'D003'
	} else if (treeNode.name=="구매부") {
		deptCode = 'D004'
	} else if(treeNode.name=="영업부"){
		deptCode = 'D005'
	} else {


	}



	$.ajax({
		url: "/approval/ajaxTeamList",
		type: "POST",
		data: {
			departmentCd: deptCode
		}
		, success: function(result) {
			console.log(result);
			if (result=='' || result==undefined || result.length<=0) {
				zNodesList = null;
			}
			
			var resultArr=new Array();
			for (r of result) {
				
				let emp=new Array();
				emp.who=r.name
				emp.name=r.positionCd+' '+r.name;
				emp.dept=r.departmentCd;
                emp.rank=r.positionCd;
				emp.empId=r.employeeID;
				emp.icon='/css/zTreeStyle/img/diy/emp.png';
				/*		delete r.employeeName;
						delete r.deptCode;*/
            
				resultArr.push(emp)
			

				zNodesList = resultArr;
			}

			/** 두번째 트리 세팅*/
			var settingList = {
				
				callback: {
					onClick: employeeOnCheck,
				},view:{
					showLine: false
				}
				,
			};

			/**노드에 값 넣어서 표시해주기 */
			function employeeOnCheck(event, treeId, treeNode) {
				dept=treeNode.dept;
				rank=treeNode.rank;
				employeeName = treeNode.name;
				empId=treeNode.empId
			}





			zTreeObj1 = $.fn.zTree.init($("#tree_list"), settingList, zNodesList);

		}
	})


};





$(document).ready(function() {
	zTreeObj1 = $.fn.zTree.init($("#tree"), humanSetting, humanNodes);
});


let appStr = '<tr style="height: 20%"><td>추가 검토자</td><td class="add-app"></td></tr>'


// 내 기안 정보 설정
$('#my-rank').text(myRank);
$('#my-dept').text(myDept);
$('#my-rank').next().next().text(myName);

/** 결재 버튼 누르면 맨 우측에 결재자로 설정*/

$('#tree-last-app').click(function() {
	console.log(employeeName)
	if(!appMeCheck()){
		return;
	}

	if (employeeName != '') {
		$('#last-app').text(rank);
		$('#last-app-dept').text(dept);
        names=employeeName.split(' ');
        empName=names[1];

		$('#last-app').next().next().text(empName);
		$('#last-app').attr("data-id",empId);
       
	}
})


$('#tree-mid-app').click(function() {
	console.log(employeeName)
	if(!appMeCheck()){
		return;
	}

	if (employeeName != '') {
		$('#mid-app').text(rank);
		$('#mid-app-dept').text(dept);
        names=employeeName.split(' ');
        empName=names[1];

		$('#mid-app').next().next().text(empName);
		$('#mid-app').attr("data-id",empId);
	}
})

$('#tree-add-app').click(function() {
	console.log(employeeName)
	if(!appMeCheck()){
		return;
	}

	if (employeeName != '') {
		console.log(rank)
		$('#add-app').text(rank);
		$('#add-app-dept').text(dept);
        names=employeeName.split(' ');
        empName=names[1];

		$('#add-app').next().next().text(empName);

		$('#add-app').attr("data-id",empId);
	}
})

function appMeCheck(){
	if(empId===me){
		swal('기안자 본인은 결재선에 추가할 수 없습니다.')
		return false;
	}else{
		return true;
	}
    
}


/**
 * 
 */
$('#tree-line-btn').click(function() {
    
	const last = $('#last-app').text();
	const mid = $('#mid-app').text();
	const add = $('#add-app').text();

	const last1 = $('#last-app').next().next().text();
	const mid1 = $('#mid-app').next().next().text();
	const add1 = $('#add-app').next().next().text();

    const lastId = $('#last-app').attr("data-id"); 
	const midId = $('#mid-app').attr("data-id"); 
	const addId = $('#add-app').attr("data-id"); 
	
	console.log(lastId)
	console.log(midId)
	console.log(add)
	
     
    if(mid=='' || last==''){
		swal('최소 둘 이상의 검토자가 필요합니다')
		return;
	} 
    if(lastId===midId || lastId===addId || midId===addId){
		swal('결재자는 중복될 수 없습니다')
		return;
	}
		
	$('#last-approver').val(last+' '+last1);
	$('#mid-approver').val(mid+' '+mid1);
	$('#add-approver').val(add+' '+add1);	
		
	$('#last-data-id').val(lastId);
	$('#mid-data-id').val(midId);
	$('#add-data-id').val(addId);

	employeeName = '';
	$('#last-app').text('');
	$('#mid-app').text('');
	$('#add-app').text('');

    $('#last-app').next().next().text('');
	$('#mid-app').next().next().text('');
	$('#add-app').next().next().text('');

	$('#last-app-dept').text('');
	$('#mid-app-dept').text('');
	$('#add-app-dept').text('');


	$('#tree-list').empty();
	$('#line-confirm-close').click();
       










})


/**
 * form-tree-list
 *  */
var formSetting = {
	check: {
		autoCheckTrigger: false,
		chkStyle: "checkbox",
		enable: true,
		chkboxType: { "Y": "ps", "N": "ps" },
		nocheckInherit: false,
		chkDisabledInherit: false,
		radioType: "level"
	},
	callback: {
		onCheck: formCheck
	}
}

function formCheck(event, treeId, treeNode) {
	otherNodes = $('#' + treeNode.tId).siblings();


	for (let i = 0; i < otherNodes.length; i++) {
		node = otherNodes.get(i);

		span = node.children.item(1)
		span.className = 'button chk checkbox_false_full';

	}


	nodes = treeNode.getParentNode();

	let childArr = nodes.children
	for (let i in childArr) {
		if (treeNode.name != childArr[i].name) {
			childArr[i].checked = false;

		}
	}





}


// 검색

// function searchTeamList(){
// 	if(keyCode==13){
// 	let word=$('input[name=search]').val();

// 	$.ajax({
// 		type:'GET',
// 		 url:'/approval/search',
// 		 data:{
// 	        search:word
// 		 },success:function(result){
// 			console.log(result);

			
// 			zNodesList=result
			
            
			
// 			 /** 두번째 트리 세팅*/
// 			 var settingList = {
				
// 				callback: {
// 					onClick: employeeOnCheck,
// 				}
// 			};
	
// 			/**노드에 값 넣어서 표시해주기 */
// 			function employeeOnCheck(event, treeId, treeNode) {
// 				dept=treeNode.dept;
// 				rank=treeNode.rank;
// 				employeeName = treeNode.name;
// 				empId=treeNode.empId
// 			}
	
	
	
	
	
// 			zTreeObj1 = $.fn.zTree.init($("#tree_list"), settingList, zNodesList);
	
// 		 }


		
// 	})
//   }
// }

$('input[name=search]').keypress(function(e){
	if(e.keyCode && e.keyCode==13){
		let word=$('input[name=search]').val();
	
		$('#searchTeamList').click();
	}
})

$('#searchTeamList').click(function(){
  let word=$('input[name=search]').val();
    
    if(word.trim()==''){
       swal('검색어를 입력해주세요')
	   return;
	}
	$.ajax({
		type:'GET',
		 url:'/approval/search',
		 data:{
	        search:word
		 },success:function(result){
			console.log(result);

			
			zNodesList=result
			
            
			
			 /** 두번째 트리 세팅*/
			 var settingList = {
				
				callback: {
					onClick: employeeOnCheck,
				}
			};
	
			/**노드에 값 넣어서 표시해주기 */
			function employeeOnCheck(event, treeId, treeNode) {
				dept=treeNode.dept;
				rank=treeNode.rank;
				employeeName = treeNode.name;
				empId=treeNode.empId
			}
	
	
	
	
	
			zTreeObj1 = $.fn.zTree.init($("#tree_list"), settingList, zNodesList);
	
		 }


		
	})
})


let nowTime=new Date();

let year = nowTime.getFullYear(); // 년도
let month = nowTime.getMonth() + 1;  // 월
let date = nowTime.getDate();  // 날짜
let day = nowTime.getDay();  // 요일

nowDate=year + '/' + month + '/' + date;

let hours = nowTime.getHours(); // 시
let minutes = nowTime.getMinutes();  // 분
let seconds = nowTime.getSeconds();  // 초
let milliseconds = nowTime.getMilliseconds(); // 밀리초

if(hours<10){
	hours='0'+hours;
}

if(minutes<10){
	minutes='0'+minutes;
}
appTime=hours + ':' + minutes;

$('#app-date-span').text(nowDate+' '+appTime);