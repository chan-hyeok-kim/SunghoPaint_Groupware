const appDate=document.getElementById('approvalStartDate')
const curDate=document.getElementById('currentDate')

/**
 * 
 */

if(curDate){
curDate.value = new Date().toISOString().substring(0, 10);;
}


console.log(appDate.innerText);
console.log(typeof appDate.innerText);
//Fri Nov 03 22:48:52 KST 2023

let date=appDate.innerText;
date1=javaDatetoScript(date);
console.log(date1);

// date=date.split(' ');
// console.log(date)
// //['Fri', 'Nov', '03', '22:48:52', 'KST', '2023']

// let param1=date[1]+' '+date[2]
// let param2=date[5]+' '+date[3]
// let param3=param1+', '+param2
// console.log(param1)
// console.log(param2)
// console.log(param3)
// //var date2 = new Date('Jan 06, 2023 16:20:00');

// date2=new Date(param3);
// console.log(date2)

// function CF_toStringByFormatting(source){
// 	var date = new Date(source);
// 	const year = date.getFullYear();
// 	const month = CF_leftPad(date.getMonth() + 1);
// 	const day = CF_leftPad(date.getDate());
// 	return [year, month, day].join('/');
// }

// function CF_leftPad(value){
// 	if (Number(value) >= 10) {
// 		return value;
// 	}
// 	return "0" + value;
// }

// returnStr1=CF_toStringByFormatting(date2)
// console.log(returnStr1)
// //2023/11/03

// appDate.innerText=returnStr1;

// 결재일자 설정


function javaDatetoScript(date){

date=date.split(' ');
console.log(date)
//['Fri', 'Nov', '03', '22:48:52', 'KST', '2023']

let param1=date[1]+' '+date[2]
let param2=date[5]+' '+date[3]
let param3=param1+', '+param2
console.log(param1)
console.log(param2)
console.log(param3)
//var date2 = new Date('Jan 06, 2023 16:20:00');

date2=new Date(param3);
console.log(date2)

function CF_toStringByFormatting(source){
	var date = new Date(source);
	const year = date.getFullYear();
	const month = CF_leftPad(date.getMonth() + 1);
	const day = CF_leftPad(date.getDate());
	return [year, month, day].join('/');
}

function CF_leftPad(value){
	if (Number(value) >= 10) {
		return value;
	}
	return "0" + value;
}

returnStr1=CF_toStringByFormatting(date2)
console.log(returnStr1)
return returnStr1
}