function validation(file){
    var file_path = file.value;
    var reg = /(.*?)\.(jpg|bmp|jpeg|png)$/;
    
    if(file_path != "" && (file_path.match(reg) == null || reg.test(file_path) == false)){
        file.value = "";			
        alert("이미지 파일만 업로드 가능합니다.");
    }
}

function processFile(file){
    let reader = new FileReader();
    reader.readAsDataURL(file);

    reader.onload = function(){
        let result = reader.result; // result : Base64
        $("#profile > img").attr("src", result);
    }
}

$(function(){
    $("#profile > input[type='file']").change(function(event){
        processFile(event.target.files[0]);
    });
});