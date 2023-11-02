/**
 *  간격 사이에 날짜 표시.
 * 기준은 오늘 날짜로부터 두달 전까지*/

var approvalToday=new Date();
var approvalMonth=approvalToday.getMonth()+1;

var today=approvalToday.getFullYear()
var month=approvalToday.getMonth()
var day=approvalToday.getDate()


var approvalPreDate=today+'/'+month+'/'+day
var approvalDate=today+'/'+approvalMonth+'/'+day


$('#grid-top-date').text(approvalPreDate+'~'+approvalDate)

