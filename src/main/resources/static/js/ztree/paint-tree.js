var zTreeObj;
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
var employeeName='';
var zNodesList;
function myOnCheck(event, treeId, treeNode) {
	
    
	
	otherNodes = $('#' + treeNode.tId).siblings();
	
	
	for (let i=0; i<otherNodes.length; i++){
		node=otherNodes.get(i);
		
		span=node.children.item(1)
		span.className='button chk checkbox_false_full';
		
	}
	
   
	nodes=treeNode.getParentNode();
	
	let childArr=nodes.children
	for(let i in childArr){
		if(treeNode.name!=childArr[i].name){
			childArr[i].checked=false;
			
               }
	}




    let deptCode=''
	if (treeNode.name=="인사부") {
	    deptCode='D001'
	} else if (treeNode.name=="총무부") {
		deptCode='D002'
	} else if (treeNode.name=="생산부") {
		deptCode='D003'
	} else if (treeNode.name == "구매부") {
		deptCode='D004'
	} else {
		deptCode='D005'
	}



	$.ajax({
		url: "/approval/ajaxTeamList",
		type: "POST",
		data:{
			departmentCd: deptCode
		}
		, success: function(result) {
			console.log(result);
			if(result==''){
				zNodesList=null;
			}
			var resultArr = new Array();
			for (r of result) {
				console.log(r);
				r.name=r.accountHolder;
				r.dept=r.codeName;
				
		/*		delete r.employeeName;
				delete r.deptCode;*/

				resultArr.push(r)
				console.log(resultArr)
                  
				zNodesList = resultArr;
			}
            
            /** 두번째 트리 세팅*/
			var settingList = {
				check: {
					autoCheckTrigger: false,
					chkStyle: "checkbox",
					enable: true,
					chkboxType: { "Y": "", "N": "" },
					nocheckInherit: false,
					chkDisabledInherit: false,
					radioType: "level"
				},
				callback: {
					onCheck: employeeOnCheck,
				}
			};
			
			/**노드에 값 넣어서 표시해주기 */
			function employeeOnCheck(event, treeId, treeNode) {
				employeeNum = treeNode.employeeNum;
				employeeName = treeNode.name;
			}



			

			zTreeObj = $.fn.zTree.init($("#tree_list"), settingList, zNodesList);

		}
	})


};


/*$('.checkbox_false_full').mouseover(function(){
	$(this).attr('class','checkbox_false_full');
})
*/

// zTree data attributes, refer to the API documentation (treeNode data details)
var humanNodes = [
	{
		name: "페인트 오피스", open: true, children: [
			{ name: "인사부" }, { name: "총무부" },
			{ name: "구매부" }, { name: "생산부" }, { name: "영업부" }]
	},
	{
		name: "test", open: true, children: [
			{ name: "test_1" }, { name: "test_2" }]
	}
];
$(document).ready(function() {
	zTreeObj = $.fn.zTree.init($("#tree"), humanSetting, humanNodes);
});


/** 결재 버튼 누르면 맨 우측에 결재자로 설정*/
$('#tree_list_add').click(function() {
	console.log(employeeName)
	if(employeeName!=''){
	$('#tree-table-body').append('<tr>' +
		'<td>결재</td>' + '<td>' + employeeName + '</td>'
		+ '</tr>');
}
    

})

/**
 * 
 */
$('#tree-line-btn').click(function(){
	$('#last-approver').val(employeeName);
	$('#line-confirm-close').click();
	employeeName='';
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
	
	
	for (let i=0; i<otherNodes.length; i++){
		node=otherNodes.get(i);
		
		span=node.children.item(1)
		span.className='button chk checkbox_false_full';
		
	}
	
   
	nodes=treeNode.getParentNode();
	
	let childArr=nodes.children
	for(let i in childArr){
		if(treeNode.name!=childArr[i].name){
			childArr[i].checked=false;
			
               }
	}
	
	
	
	

}





/*
$('#form-modal-btn').click(function() {
	zTreeObj = $.fn.zTree.init($("#form"), formSetting, formNodes);
});

*/


