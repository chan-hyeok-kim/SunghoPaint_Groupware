/**
 * 
 */
   var zTreeObj;
   
   // zTree configuration information, refer to API documentation (setting details)
   
   

  
   /**
	* 문서 상위분류 리스트 뿌려주기
    */
   var upArr=new Array();
   let r=[];
   let y=[];
   let x=new Array();
   $('.get-up-code-name').each(function(i,item){
    upCodeName=$(this).text();
    codeName=$(this).attr('data-code-name');
    console.log(codeName)
    console.log(y.name)
    if(y.name!=codeName){
    y.name=codeName;
    x.push(y);
    
    }
    console.log(x)
	  if(r.name!=upCodeName){
		  r.name=upCodeName;
		  
		  upArr.push(r);
		  upArr.children=x;
		  console.log(upArr)
	  }
	  
  })
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

	}
	   
	   
	   
   };
   
   function upDocumentCheck(event, treeId, treeNode) {
	
    
	
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
   
   
  
   /**UpTypeNo로 양식리스트뽑기 */
   function ajaxList(checkNo){
	   let ajaxArr=new Array();
	   $.ajax({
		   type:'GET',
		    url:'ajaxList',
		    success:function(result){
				
				for(r of result){
					r.name=r.codeName
					if(r.approvalUpTypeNo==checkNo){
						ajaxArr.push(r);
					}
				}
			}
			
	   })
	   return ajaxArr;
   }
  
   // zTree data attributes, refer to the API documentation (treeNode data details)
  
  
  
  
  
			
			 var zNodes= [
             {name:"성호페인트 문서함", children: upArr},
             ];
			
			$(document).ready(function(){
			zTreeObj = $.fn.zTree.init($("#document-tree"), setting, zNodes);
		
 })
   
  
  
  
  
  
  
 

  