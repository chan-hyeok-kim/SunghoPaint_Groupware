/**
 * 
 */
var zTreeObj;

// zTree configuration information, refer to API documentation (setting details)




/**
 * 문서 상위분류 리스트 뿌려주기
 */

var upArr = new Array();


let x = new Array();
let z = new Array();
//두번째 자식

$('.get-up-code-name').each(function(i, item) {

	upCodeName = $(this).attr('data-up-code-name');
	codeName = $(this).attr('data-code-name');
	cd = $(this).attr('data-up-type-cd');
	no = $(this).attr('data-up-no');
	approvalForm = $(this).html();


	let y = [];
	if (y.name != codeName && codeName != '') {
		y.name = codeName;
		y.pId = '1';
		y.id = '11';
		y.cd = cd;
		y.no = no;
		y.form = approvalForm;
		upArr.push(y);
	}


	//첫번째 자식
	let r = [];
	var equalCheck;



	r.name = upCodeName;
	r.pId = '0';
	r.id = '1'
	r.cd = cd
	r.no = no;
	r.open = 'true'
	z.push(r)
	console.log(z)
	if (i > 1) {
		console.log(z[i - 1].name);
		equalCheck = z[i - 1].name;


		if (r.name == equalCheck) {
			upArr.push(r);
		} else {
			r.id = r.id * 1 + 1;
			upArr.push(r);
		}
	}
	console.log(upArr)

})
x.name = '성호페인트 문서함';
x.id = '0';
x.pId = 'root';
x.open = 'true';
upArr.push(x);

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


	nodes = treeNode.getParentNode();

	let childArr = nodes.children;
	for (i of childArr) {
		if (treeNode.name != i.name) {
			i.checked = false;
               zTreeObj.updateNode(i)
		}
		if (i.children!=null){
			for(n of i.children){
			   n.checked = false;
			   zTreeObj.updateNode(n);
			}
		}

	}


	if (treeNode.children != null) {
		console.log('자식 있음')
	} else {
		console.log('자식 없음')
	}

	console.log(treeNode.cd)
	console.log(treeId)
	console.log(event)
	$('#up-type-cd').val(treeNode.cd);
    $('#up-type-no').val(treeNode.no);

	/** add*/
	let checkHtml = treeNode.form;

	$('#form_list').html(checkHtml);


}





// zTree data attributes, refer to the API documentation (treeNode data details)





var zNodes = upArr;
//[{name:"성호페인트 문서함", id: '0'}]


console.log(zNodes)
$(document).ready(function() {
	zTreeObj = $.fn.zTree.init($("#document-tree"), setting, zNodes);

})







/**
 *   여기서부터 결재 add임
 * 
 */

var formNodes = new Array();
formNodes.push(x);
$.ajax({
	type: 'GET',
	url: '/document/ajaxList',
	success: function(result) {
		list = result.list;
		total = result.total;
		console.log(list);
		for (let i in total) {
			console.log(list[i].codeName);

			if (list[i].codeName == '') {
				continue;
			} else {
				ajaxList(i, total[i].codeName, list[i].codeName, total[i].approvalUpTypeCd,
					list[i].approvalForm)
			}

		}
		/*for (let i = 0; i < result.length; i++) {
			let name = result[i].codeName;
			let formContents = result[i].approvalForm;

			let arr = new Array();
			arr.name = name;
			arr.open = true;
			arr.content = formContents
			formNodes.push(arr);
		}
*/
	}

})

$('#form-modal-btn').click(function() {
	var modalNodes = formNodes;
	zTreeObj = $.fn.zTree.init($("#form"), setting, modalNodes);
});



function ajaxList(i, upCodeName, codeName, cd, approvalForm) {

	z = new Array();
	let y = [];
	if (y.name != codeName && codeName != '') {
		y.name = codeName;
		y.pId = '1';
		y.id = '11';
		y.cd = cd;
		y.form = approvalForm;
		formNodes.push(y);
	}


	//첫번째 자식
	let r = [];
	var equalCheck;



	r.name = upCodeName;
	r.pId = '0';
	r.id = '1'
	r.open = 'true'
	z.push(r)
	console.log(z)

	console.log(z[i].name);
	equalCheck = z[i].name;


	if (r.name == equalCheck) {
		formNodes.push(r);
	} else {
		r.id = r.id * 1 + 1;
		formNodes.push(r);
	}

	console.log(formNodes)
}
