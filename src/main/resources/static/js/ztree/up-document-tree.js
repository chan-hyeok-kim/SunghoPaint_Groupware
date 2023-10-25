/**
 * 
 */
   var zTreeObj;
   
   // zTree configuration information, refer to API documentation (setting details)
   
   

  
   /**
	* 문서 상위분류 리스트 뿌려주기
    */
   let upArr=new Array();
   let r=[];
   $('.get-up-code-name').each(function(i,item){
    codeName=$(this).text();
    
	  if(r.name!=codeName){
		  r.name=codeName;
		  upArr.push(r);
	  }
	  
  })
  
  
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
	  
	  
	  
	   
   if(treeNode.name=='인사'){
	    ajaxList(treeNode.approvalUpTypeNo);
	    console.log(ajaxList(treeNode.approvalUpTypeNo));
	    upArr.children=ajaxList(treeNode.approvalUpTypeNo)
   }
	  
	  
	  
	  
	}
   
   
  
   
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
             {name:"성호페인트 문서함", open:true, children: upArr},
             ];
			
			$(document).ready(function(){
			zTreeObj = $.fn.zTree.init($("#document-tree"), setting, zNodes);
		});
	
 
   
  
   
  