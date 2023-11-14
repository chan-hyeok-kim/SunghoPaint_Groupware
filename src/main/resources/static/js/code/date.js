const regDate=document.getElementsByClassName('reg-date');
const modDate=document.getElementsByClassName('mod-date');

console.log(regDate)
console.log(modDate)

for(r of regDate){
   date=javaDatetoScript(r.innerText)
   r.innerText=date;
}

for(m of modDate){
    date=javaDatetoScript(m.innerText)
    m.innerText=date;
}

//서버(백단)쪽에서 온 날짜 타입을 프론트단에서 쓸수있게 'yyyy/MM/dd'형식으로 바꿔주는 함수 
function javaDatetoScript(date){

    date=date.split(' ');
    
    //['Fri', 'Nov', '03', '22:48:52', 'KST', '2023']
    
    let param1=date[1]+' '+date[2]
    let param2=date[5]+' '+date[3]
    let param3=param1+', '+param2
    
    //var date2 = new Date('Jan 06, 2023 16:20:00');
    
    date2=new Date(param3);
    
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
    
    return returnStr1
    }