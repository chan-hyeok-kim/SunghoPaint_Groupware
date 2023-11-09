/**
 * 
 */
const linkTabs=document.getElementsByClassName('link-tab')
const contentDiv=document.getElementById('content');



$('.nav-tabs li').each(function(){
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