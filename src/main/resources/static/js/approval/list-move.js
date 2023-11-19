/**
 * 
 */
linkTabs=document.getElementsByClassName('link-tab')
contentDiv=document.getElementById('content');



$('.total-list-tabs li').each(function(){
	console.log('check')
	this.addEventListener("click",function(){
		console.log(this.getAttribute('data-cd'))
		
        let cd=this.getAttribute('data-cd')
		for(let i=0; i<linkTabs.length; i++){
		   linkTabs[i].parentElement.className=''
		}
        this.className='active';
		
		$.ajax({
			type:'GET',
			url:'/approval/ajaxTotalList',
			data:{
                approvalStatusCd:cd
			},success:function(result){
                contentDiv.innerHTML=result;

				
			},error:function(){
				console.log('실패')
			}
			
		})

	})

})



$('.my-list-tabs li').each(function(){
	console.log('check')
	this.addEventListener("click",function(){
		console.log(this.getAttribute('data-cd'))
		
        let cd=this.getAttribute('data-cd')
		for(let i=0; i<linkTabs.length; i++){
		   linkTabs[i].parentElement.className=''
		}
        this.className='active';
		
		$.ajax({
			type:'GET',
			url:'/approval/ajaxList',
			data:{
                approvalStatusCd:cd
			},success:function(result){
                contentDiv.innerHTML=result;

				
			},error:function(){
				console.log('실패')
			}
			
		})

	})

})