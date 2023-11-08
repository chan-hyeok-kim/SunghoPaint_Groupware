var zTreeObj1;
// zTree configuration information, refer to API documentation (setting details)
var humanSetting = {
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
		onCheck: myOnCheck,

	}
	,data: {
		simpleData: {
			enable: true,

		}
	},

};



/**
 * 인사코드 가져오기*/
$.ajax({
	type: 'POST',
	url: 'getList',
	success: function() {

	}
})



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

	let childArr = nodes.children;
	for (i of childArr) {
		if (treeNode.name != i.name) {
			i.checked = false;
			zTreeObj1.updateNode(i)
		}
		

	}




	let deptCode = ''
	if (treeNode.name=="인사부") {
		deptCode = 'D001'
	} else if (treeNode.name=="총무부") {
		deptCode = 'D002'
	} else if (treeNode.name=="생산부") {
		deptCode = 'D003'
	} else if (treeNode.name=="구매부") {
		deptCode = 'D004'
	} else {
		deptCode = 'D005'
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
				/*		delete r.employeeName;
						delete r.deptCode;*/
                console.log(emp);
				resultArr.push(emp)
				console.log(resultArr)

				zNodesList = resultArr;
			}

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


};


/*$('.checkbox_false_full').mouseover(function(){
	$(this).attr('class','checkbox_false_full');
})
*/

// zTree data attributes, refer to the API documentation (treeNode data details)
var humanNodes = [
	{name: "페인트 오피스", id:0, open: true, pId: 'root'}, 
			{ name: "인사부", id:1, pId:0 }, { name: "총무부", id:1, pId:0 },
			{ name: "구매부", id:1, pId:0 }, { name: "생산부", id:1, pId:0 }, 
			{ name: "영업부", id:1, pId:0 }
	
];
$(document).ready(function() {
	zTreeObj1 = $.fn.zTree.init($("#tree"), humanSetting, humanNodes);
});


let appStr = '<tr style="height: 20%"><td>추가 검토자</td><td class="add-app"></td></tr>'

/** 결재 버튼 누르면 맨 우측에 결재자로 설정*/
$('#tree-last-app').click(function() {
	console.log(employeeName)
	if (employeeName != '') {
		$('#last-app').text(employeeName);
		$('#last-app').attr("data-id",empId);
	}
})


$('#tree-mid-app').click(function() {
	console.log(employeeName)
	if (employeeName != '') {
		$('#mid-app').text(employeeName);
		$('#mid-app').attr("data-id",empId);
	}
})

$('#tree-add-app').click(function() {
	console.log(employeeName)
	if (employeeName != '') {
		$('#add-app').text(employeeName);
		$('#add-app').attr("data-id",empId);
	}
})

/**
 * 
 */
$('#tree-line-btn').click(function() {
    
	const last = $('#last-app').text();
	const mid = $('#mid-app').text();
	const add = $('#add-app').text();

    const lastId = $('#last-app').attr("data-id"); 
	const midId = $('#mid-app').attr("data-id"); 
	const addId = $('#add-app').attr("data-id"); 

	console.log(last)
	console.log(mid)
	console.log(add)
	
     
    if(mid=='' || last==''){
		swal('최소 둘 이상의 검토자가 필요합니다')
		return;
	} 
    if(last===mid || last===add || mid===add){
		swal('결재자는 중복될 수 없습니다')
		return;
	}
		
	$('#last-approver').val(last);
	$('#mid-approver').val(mid);
	$('#add-approver').val(add);	
		
	$('#last-data-id').val(lastId);
	$('#mid-data-id').val(midId);
	$('#add-data-id').val(addId);

	employeeName = '';
	$('#last-app').text('');
	$('#mid-app').text('');
	$('#add-app').text('');
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





/*
$('#form-modal-btn').click(function() {
	zTreeObj = $.fn.zTree.init($("#form"), formSetting, formNodes);
});

*/


