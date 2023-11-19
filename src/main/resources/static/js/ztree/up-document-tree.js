/**
 * 
 */
var zTreeObj;

// zTree configuration information, refer to API documentation (setting details)


var zNodes;

/**
 * 문서 상위분류 리스트 뿌려주기
 */

var upArr = new Array();


let x = new Array();
let z = new Array();
i=0;
$.ajax({
	type:'GET',
	url:'/document/ajaxFullList',
	success:function(response){
		console.log(response);

for(res of response){

	upCodeName = res.upCodeName;
	codeName = res.codeName;
	cd = res.cd;
	num = res.num;
	no = res.no;
	refNo = res.refNo;
	approvalForm = res.approvalForm;
    icon=res.icon;
    
	//첫번째 자식
	let r = [];
	i++;


	r.name = upCodeName;
	r.pId = 0;
	r.id = i;
	r.cd = cd
	r.no = no;
	r.open = 'true'
	r.psId = i;

	upArr.push(r)


	/* JSON타입 배열의 중복제거
   *  객체 보존 가능
   */
	const result = upArr.reduce((acc, v) => {
		return acc.find(x => x.name === v.name) ? acc : [...acc, v];
	}, []);



	upArr = result;


	//두번째 자식
	let y = [];


	/*중복제거한 후에 
* 부모값있는지체크. 객체 보존 안됨
*/
	const unique = upArr.map(function(val, index) {
		return val['psId'];
	}).filter(function(val, index, arr) {
		return arr.indexOf(val) === index;
	});

	const uniqueNo = upArr.map(function(val, index) {
		return val['no'];
	}).filter(function(val, index, arr) {
		return arr.indexOf(val) === index;
	});


	if (codeName != '') {
		y.num = num;
		y.name = codeName;
		y.pId = r.psId;
		y.id = '10' + i;
		y.cd = cd;
		y.refNo = refNo;
		y.upCd = upCodeName;
		y.form = approvalForm;
        y.icon = icon;


		if (!unique.includes(y.pId)) {

			for (u of upArr) {
				if (u.no == y.refNo && u.psId != undefined) {
					y.pId = u.psId;
				}

			}


			/*unique.pop();
			y.pId=unique.at(-1);*/
		}
          
        if(!y.name){
           continue;
		}

		upArr.push(y)
		
		zNodes=upArr

		$(document).ready(function() {
			zTreeObj = $.fn.zTree.init($("#document-tree"), setting, zNodes);
		
		})
	}
}
}

});

/*const result=upArr.reduce((acc, v) => {
	return acc.find(x => x.name === v.name) ? acc : [...acc, v];
}, []);

console.log(result)
upArr=result;
*/


x.name = '성호페인트 문서함';
x.id = 0;
x.pId = 'root';
x.open = 'true';
x.iconOpen='/css/zTreeStyle/img/diy/1_open.png';
x.iconClose='/css/zTreeStyle/img/diy/1_close.png';
			
upArr.push(x);
console.log(upArr)
/** 트리 설정
 * 
*/
var setting = {
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
		onCheck: upDocumentCheck,

	},
	data: {
		simpleData: {
			enable: true,

		}
	},





};

function upDocumentCheck(event, treeId, treeNode) {



	otherNodes = $('#' + treeNode.tId).siblings();

	/*	for (let i = 0; i < otherNodes.length; i++) {
			node = otherNodes.get(i);
	
			span = node.children.item(1)
			span.className = 'button chk checkbox_false_full';
	
		}*/
     
	$('#up-type-no').val(treeNode.no);
	$('#up-type-cd').val(treeNode.cd);
	
	nodes = treeNode.getParentNode();

	let childArr = nodes.children;
	for (i of childArr) {
		if (treeNode.name != i.name) {
			i.checked = false;
			zTreeObj.updateNode(i)
		}
		console.log(i.children)
		//if (i.children != null && i.children != undefined)
		if (i.children) {
			for (n of i.children) {
				n.checked = false;
				zTreeObj.updateNode(n);
			}
		}

	}

	parentNodes = treeNode.getParentNode().getParentNode();

	console.log(parentNodes);
	
	if(!parentNodes){
		
		return;
	}

	
	childDept = parentNodes.children;

	for (c of childDept) {
		if (c.tId != treeNode.parentTId) {
			c.checked = false;
			zTreeObj.updateNode(c);
		}
		if (c.children != null && c.children != undefined) {
			for (c1 of c.children) {
				if (c1.name != treeNode.name) {
					console.log(c1.name)
					console.log(treeNode.name)
					c1.checked = false;
					zTreeObj.updateNode(c1);
				}
			}
		}
	}



	
	$('#up-type-no').val(treeNode.refNo);

	/** add*/
	let checkHtml = treeNode.form;
	let addTypeNo = treeNode.num;
	let formName = treeNode.name;
	$('#form_list').html(checkHtml);
	$('#form-add-no').val(addTypeNo);
	$('#form_list').attr('data-name', formName);


	/* 결재선 추가 */
	let approvalTest = '<span id="docs-internal-guid-fe95ce02-7fff-fe80-414b-be8c661eb408"><div dir="ltr" style="margin-left:0pt;" align="center"></div></span><span id="docs-internal-guid-d2c86d64-7fff-7309-2473-a557a501100f"><div dir="ltr" style="margin-left:0pt;" align="center"><table id="app-test-tbl" class="__se_tbl_ext" style="border:none;border-collapse:collapse;"><tbody><tr style="height:5.5872802734375pt" id="top-tap"><td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">기 안</span></p></td><td id="top-drafter-tab" style="text-align:center; height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:62.25pt" id="mid-tap"><td id="mid-drafter-tab" style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><span class="form-sign-span"></span></td></tr><tr style="height:0pt" id="bot-tap"><td id="bot-drafter-tab" style="text-align:center;height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr>';
	
       
	$('#approval-line-add-blank').text('');
	$('#approval-line-add-blank').append(approvalTest);

	const imgTag='<img width="70px" height="40px" src="'+formSign+'">'
	mid=document.getElementById('mid-drafter-tab');
	mid.innerHTML=imgTag;

	setTimeDept();
  
	//서명시간, 부서 입력
	function setTimeDept(){
		$.ajax({
			type:'GET',
			url:'/approval/signTime'
			,success:function(result){
			
				$('#top-drafter-tab').text(result.deptName);
				$('#bot-drafter-tab').text(result.signTime);
			}
		})
		}

   
   


}





// zTree data attributes, refer to the API documentation (treeNode data details)






//[{name:"성호페인트 문서함", id: '0'}]












/*
$('#form-modal-btn').click(function() {
	var modalNodes = formNodes;
	zTreeObj = $.fn.zTree.init($("#form"), setting, modalNodes);
    
});

*/


