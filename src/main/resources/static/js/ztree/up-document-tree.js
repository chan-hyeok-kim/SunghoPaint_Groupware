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
	i=i+1;
    
   
	r.name = upCodeName;
	r.pId = 0;
	r.id = i;
	r.cd = cd
	r.no = no;
	r.open = 'true'
    r.psId= i;
    
    upArr.push(r)
    
    
     /* JSON타입 배열의 중복제거
    *  객체 보존 가능
    */
const result=upArr.reduce((acc, v) => {
    return acc.find(x => x.name === v.name) ? acc : [...acc, v];
}, []);



upArr=result;


    //두번째 자식
    let y = [];
    
    
    /*중복제거한 후에 
* 부모값있는지체크. 객체 보존 안됨
*/
   const unique = upArr.map(function (val, index) {
	return val['psId'];
}).filter(function (val, index, arr) {
	return arr.indexOf(val) === index;
});

const uniqueNo = upArr.map(function (val, index) {
	return val['no'];
}).filter(function (val, index, arr) {
	return arr.indexOf(val) === index;
});
 
   
	if (codeName!='') {
		y.num = num;
		y.name = codeName;
		y.pId = r.psId;
		y.id = '10'+i;
		y.cd = cd;
		y.refNo = refNo;
		y.upCd = upCodeName;
		y.form = approvalForm;

   

   if(!unique.includes(y.pId)){
	  
	   for(u of upArr){
		   if(u.no==y.refNo && u.psId!=undefined){
			  y.pId=u.psId; 
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


	nodes=treeNode.getParentNode();

	let childArr = nodes.children;
	for (i of childArr) {
		if (treeNode.name != i.name) {
			i.checked = false;
			zTreeObj.updateNode(i)
		}
		console.log(i.children)
		    if(i.children!=null && i.children!=undefined){
			for (n of i.children) {
				n.checked = false;
				zTreeObj.updateNode(n);
			}
		}

	}
	
	parentNodes=treeNode.getParentNode().getParentNode();
	
	
	

	$('#up-type-cd').val(treeNode.cd);
	$('#up-type-no').val(treeNode.no);

	/** add*/
	let checkHtml=treeNode.form;
    let addTypeNo=treeNode.num;
	$('#form_list').html(checkHtml);
    $('#form-add-no').val(addTypeNo);

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


