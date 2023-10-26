/**
 * 도장 이미지
 */
 function loadFile(input) {
    var file = input.files[0];	//선택된 파일 가져오기

    //미리 만들어 놓은 div에 text(파일 이름) 추가
    var name = document.getElementById('fileName');
    name.textContent = file.name;

  	//새로운 이미지 div 추가
    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');
    newImage.setAttribute("id", 'file-img');
    
    //이미지 source 가져오기
    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
      //버튼을 누르기 전까지는 이미지를 숨긴다
    newImage.style.objectFit = "contain";

    //이미지를 image-show div에 추가
    var container = document.getElementById('image-show');
    if(container.hasChildNodes()){
    container.removeChild(container.firstChild);
    }
    console.log(newImage)
    container.appendChild(newImage);
  
    document.getElementById('fileName').textContent = null; 
    
    var fileUrl = $('#file-img').attr('src');
    console.log();
    $('#small-image-show').html('<img src='+fileUrl+' width="60px" height="40px">')
    
};

let cdcheck=$('#check').attr('data-check');
console.log(cdcheck);



/**
 *  서명
 *  */ 
const canvas = document.querySelector("canvas");

const signaturePad = new SignaturePad(canvas,{
    minWidth: 5,
    maxWidth: 10
});

// Returns signature image as data URL (see https://mdn.io/todataurl for the list of possible parameters)
signaturePad.toDataURL(); // save image as PNG
signaturePad.toDataURL("image/jpeg"); // save image as JPEG
signaturePad.toDataURL("image/jpeg", 0.5); // save image as JPEG with 0.5 image quality
signaturePad.toDataURL("image/svg+xml"); // save image as SVG data url

$('#clear-sign').click(function(){
	signaturePad.clear();
})


signaturePad.fromData(signaturePad.toData())


/**
 * 
 */
