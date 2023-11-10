  const code = document.getElementById('code');
  const price = document.getElementById('price');
  const maker = document.getElementById('maker');
  const add = document.getElementById('add');

let checkResult = [false, false, false];

code.addEventListener("blur", function() {
    let val = code.value;

    const pattern = /^[A-Z]{1}[A-Z0-9]{3,4}$/;
    if (!pattern.test(val)) {
        swal('코드는 알파벳 대문자 한글자와 숫자 조합으로 4~5자리만 가능합니다. 다시 입력해주세요.');
        checkResult[0] = false;
    } else {
        checkInsCode(val, function(result) {
            if (result.trim() > 0) {
                swal('이미 존재하는 코드입니다. 확인 후 다시 입력해주세요');
                checkResult[0] = false;
            } else {
                swal('사용 가능한 코드입니다');
                checkResult[0] = true;
            }
        });
    }
});

function checkInsCode(code, callback) {
    $.ajax({
        type: 'POST',
        url: '/instrument/instrumentCheck',
        data: {
            instrumentCd: code
        },
        success: function(result) {
            callback(result);
        }
    });
}

price.addEventListener("blur", function() {
    let val = price.value;
    i = 1;

    if (val.trim() === '' || !/^[1-9]\d*$/.test(val)) {
        swal('정수를 입력해주세요.');
        checkResult[1] = false;
    } else {
        checkResult[1] = true;
    }
});

maker.addEventListener("blur", function() {
    let val = maker.value;
    i = 2;

    if (val.trim() === '') {
        swal('빈칸을 입력해주세요.');
        checkResult[2] = false;
    } else {
        checkResult[2] = true;
    }
});

add.addEventListener("click", function(event) {
    // 필수 입력 필드가 모두 입력되었는지 확인
    if (code.value.trim() === '' || price.value.trim() === '' ||
        maker.value.trim() === '') {
      event.preventDefault(); // 저장 버튼의 기본 동작(제출) 막기
      alert('모든 입력사항을 작성해야 합니다.');
    }else{
		if(!checkResult.includes(false)){
        $('#frm').submit();
    }
	}
  });
  

