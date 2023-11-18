





// 상단 버튼
const mainCheckBtn=document.getElementsByClassName('main-btn-check');
const mainBtn=document.getElementsByClassName('main-btn');


//보라
mainCheckBtn[0].addEventListener('click',function(){
    console.log('보라 클릭 확인')

    if($('#app-list').hasClass('active')){
      $('#app-list').toggleClass('active')
      $('#my-app-list').toggleClass('active')
      return;
    }
    if($('#message-list').hasClass('active')){
      $('#message-list').toggleClass('active')
      $('#my-app-list').toggleClass('active')
      return;
    }
    if($('#notice-list').hasClass('active')){
      $('#notice-list').toggleClass('active')
      $('#my-app-list').toggleClass('active')
      return;
    }

    $('#my-app-list').toggleClass('active')
    $('#material-product-amount').toggleClass('active');
    
   


  })


mainBtn[0].addEventListener('click',function(){
  $(this).parent().parent().parent().remove();
    console.log(이동);
    
})


//초록
mainCheckBtn[1].addEventListener('click',function(){
  console.log('초록 클릭 확인')
  if($('#my-app-list').hasClass('active')){
    $('#my-app-list').toggleClass('active')
    $('#app-list').toggleClass('active')
    return;
  }
  if($('#message-list').hasClass('active')){
    $('#message-list').toggleClass('active')
    $('#app-list').toggleClass('active')
    return;
  }
  if($('#notice-list').hasClass('active')){
    $('#notice-list').toggleClass('active')
    $('#app-list').toggleClass('active')
    return;
  }


  $('#app-list').toggleClass('active')
  $('#material-product-amount').toggleClass('active');
})


mainBtn[1].addEventListener('click',function(){
  $(this).parent().parent().parent().remove();
    
})



mainCheckBtn[2].addEventListener('click',function(){
  console.log('클릭 확인')
  if($('#my-app-list').hasClass('active')){
    $('#my-app-list').toggleClass('active')
    $('#message-list').toggleClass('active')
    return;
  }
  if($('#app-list').hasClass('active')){
    $('#app-list').toggleClass('active')
    $('#message-list').toggleClass('active')
    return;
  }
  if($('#notice-list').hasClass('active')){
    $('#notice-list').toggleClass('active')
    $('#message-list').toggleClass('active')
    return;
  }

  $('#message-list').toggleClass('active')
  $('#material-product-amount').toggleClass('active');
})


mainBtn[2].addEventListener('click',function(){
  $(this).parent().parent().parent().remove();
    
})



mainCheckBtn[3].addEventListener('click',function(){
  console.log('클릭 확인')
  if($('#my-app-list').hasClass('active')){
    $('#my-app-list').toggleClass('active')
    $('#notice-list').toggleClass('active')
    return;
  }
  if($('#app-list').hasClass('active')){
    $('#app-list').toggleClass('active')
    $('#notice-list').toggleClass('active')
    return;
  }
  if($('#message-list').hasClass('active')){
    $('#message-list').toggleClass('active')
    $('#notice-list').toggleClass('active')
    return;
  }

  $('#notice-list').toggleClass('active')
  $('#material-product-amount').toggleClass('active');
})


mainBtn[3].addEventListener('click',function(){
  $(this).parent().parent().parent().remove();
    
})


//chart.js 차트

$(window).ready(function(){
   draw(80, '.pie-chart1', 'rgba(75, 192, 192, 0.2)');
   draw(50, '.pie-chart2', 'rgba(153, 102, 255, 0.2)');
   draw(30, '.pie-chart3','#90caf9');
   draw(80, '.pie-chart4', '#1bcfb4');
   draw(50, '.pie-chart5', '#8b22ff');
   draw(30, '.pie-chart6','#ff0');
 });
 
 function draw(max, classname, colorname){
    var i=1;
     var func1 = setInterval(function(){
       if(i<max){
           color1(i,classname,colorname);
           i++;
       } else{
         clearInterval(func1);
       }
     },10);
 }
 function color1(i, classname,colorname){
    $(classname).css({
         "background":"conic-gradient("+colorname+" 0% "+i+"%, #ffffff "+i+"% 100%)"
    });
 }
 



  const ctx = document.getElementById('myChart');

var marArr=new Array();
var marAmountArr=new Array();
$.ajax({
    type:'GET',
    url:'/home/getMaterial',
    success:function(result){
          console.log(result);

          for(let i=0; i<7; i++){
             marArr.push(result[i].materialProductName);
             marAmountArr.push(Math.round(result[i].materialProductStock/7));
          }
          // marArr.push(result[9].materialProductName);
          // marAmountArr.push(Math.round(result[9].materialProductStock/7));
          
    }

})

  new Chart(ctx, {
    type: 'bar',
    data: {
        labels: marArr,
        datasets: [
          {
            label: '주간 생산량',
            data: marAmountArr,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 205, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(201, 203, 207, 0.2)'
              ],
              borderColor: [
                'rgb(255, 99, 132)',
                'rgb(255, 159, 64)',
                'rgb(255, 205, 86)',
                'rgb(75, 192, 192)',
                'rgb(54, 162, 235)',
                'rgb(153, 102, 255)',
                'rgb(201, 203, 207)'
              ]
          }
        ]
    },
   
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });


  
