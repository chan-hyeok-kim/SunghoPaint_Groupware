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

$('.get-up-code-name').each(function(i, item) {

	upCodeName = $(this).attr('data-up-code-name');
	codeName = $(this).attr('data-code-name');
	cd = $(this).attr('data-up-type-cd');
	num = $(this).attr('data-no')
	no = $(this).attr('data-up-up-no');
	refNo = $(this).attr('data-up-no');
	approvalForm = $(this).html();




	//첫번째 자식
	let r = [];
	i = i + 1;


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



		if (!unique.includes(y.pId)) {

			for (u of upArr) {
				if (u.no == y.refNo && u.psId != undefined) {
					y.pId = u.psId;
				}

			}


			/*unique.pop();
			y.pId=unique.at(-1);*/
		}



		upArr.push(y)
	}
})

/*const result=upArr.reduce((acc, v) => {
	return acc.find(x => x.name === v.name) ? acc : [...acc, v];
}, []);

console.log(result)
upArr=result;
*/


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
		console.log(i.children)
		if (i.children != null && i.children != undefined) {
			for (n of i.children) {
				n.checked = false;
				zTreeObj.updateNode(n);
			}
		}

	}

	parentNodes = treeNode.getParentNode().getParentNode();

	console.log(parentNodes);
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



	$('#up-type-cd').val(treeNode.cd);
	$('#up-type-no').val(treeNode.no);

	/** add*/
	let checkHtml = treeNode.form;
	let addTypeNo = treeNode.num;
	let formName = treeNode.name;
	$('#form_list').html(checkHtml);
	$('#form-add-no').val(addTypeNo);
	$('#form_list').attr('data-name', formName);


	/* 결재선 추가 */
	let approvalTest = '<span id="docs-internal-guid-fe95ce02-7fff-fe80-414b-be8c661eb408"><div dir="ltr" style="margin-left:0pt;" align="center"></div></span><span id="docs-internal-guid-d2c86d64-7fff-7309-2473-a557a501100f"><div dir="ltr" style="margin-left:0pt;" align="center"><table id="app-test-tbl" class="__se_tbl_ext" style="border:none;border-collapse:collapse;"><colgroup><col width="58"><col width="86"><col width="86"></colgroup><tbody><tr style="height:5.5872802734375pt" id="top-tap"><td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">기 안</span></p></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:62.25pt" id="mid-tap"><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><span class="form-sign-span"></span></td></tr><tr style="height:0pt" id="bot-tap"><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr>';
	let approvalLine1 = '<span id="docs-internal-guid-fe95ce02-7fff-fe80-414b-be8c661eb408"><div dir="ltr" style="margin-left:0pt;" align="center"></div></span><span id="docs-internal-guid-d2c86d64-7fff-7309-2473-a557a501100f"><div dir="ltr" style="margin-left:0pt;" align="center"><table id="app-test-tbl" class="__se_tbl_ext" style="border:none;border-collapse:collapse;"><colgroup><col width="58"><col width="86"><col width="86"></colgroup><tbody><tr style="height:5.5872802734375pt"><td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">기 안</span></p></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:62.25pt"><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><span class="form-sign-span"></span></td></tr><tr style="height:0pt"><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr></tbody></table></div></span>';

       
	$('#approval-line-add-blank').text('');
	$('#approval-line-add-blank').append(approvalTest);
}





// zTree data attributes, refer to the API documentation (treeNode data details)





var zNodes = upArr;
//[{name:"성호페인트 문서함", id: '0'}]



$(document).ready(function() {
	zTreeObj = $.fn.zTree.init($("#document-tree"), setting, zNodes);

})








/*
$('#form-modal-btn').click(function() {
	var modalNodes = formNodes;
	zTreeObj = $.fn.zTree.init($("#form"), setting, modalNodes);
    
});

*/


