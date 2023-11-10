const price = document.getElementById('price');
const maker = document.getElementById('maker');
const update = document.getElementById('update');
const frm = document.getElementById('frm');

let checkResult = [true, true];

price.addEventListener("blur", function() {
    const pVal = price.value;

    if (!/^[1-9]\d*$/.test(pVal) || pVal.trim() === '') {
        swal('가격은 숫자만 입력 가능합니다.\n 다시 입력해주세요.');
        checkResult[0] = false;
    } else {
        checkResult[0] = true;
    }
});

maker.addEventListener("blur", function() {
    const mVal = maker.value;

    if (mVal.trim() === '') {
        // 빈칸을 입력한 경우에 경고 메시지 표시
        swal('빈칸을 입력해주세요.');
        checkResult[1] = false;
    } else {
        checkResult[1] = true;
    }
});

/*update.addEventListener("click", function() {

    if(!checkResult.includes(false)){
        $('#frm').submit();
    } else{
		swal('정상적인 입력이 아닙니다.');
	}

    
});*/

update.addEventListener("click", function() {
    if (checkResult.includes(false)) {
        swal('정상적인 입력이 아닙니다.');
    } else {
        const confirmed = confirm('수정하시겠습니까?');
        if (confirmed) {
            $('#frm').submit();
        }
    }
});


