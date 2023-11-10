const update = document.getElementById('update');
const frm = document.getElementById('frm');

let checkResult = [true];

update.addEventListener("click", function() {
        const confirmed = confirm('수정하시겠습니까?');
        if (confirmed) {
            $('#frm').submit();
        }
    
});


