/**
 * 도장 이미지
 */
var file;
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
    console.log(fileUrl);
    $('#small-image-show').html('<img src='+fileUrl+' width="60px" height="40px">')
    $('#file').val();
    console.log( $('#file').val())
    console.log(file);
};

let cdcheck=$('#check').attr('data-check');
console.log(cdcheck);



/**
 *  서명
 *  */ 
const canvas = document.querySelector("canvas");

const signaturePad = new SignaturePad(canvas,{
    minWidth: 5,
    maxWidth: 10,
    backgroundColor: 'rgb(255, 255, 255)'
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
 *  btn save as
 */
const wrapper = document.getElementById("signature-pad");
const clearButton = wrapper.querySelector("[data-action=clear]");
const undoButton = wrapper.querySelector("[data-action=undo]");
const savePNGButton = wrapper.querySelector("[data-action=save-png]");
const saveJPGButton = wrapper.querySelector("[data-action=save-jpg]");
const saveSVGButton = wrapper.querySelector("[data-action=save-svg]");

clearButton.addEventListener("click", () => {
  signaturePad.clear();
});

undoButton.addEventListener("click", () => {
  const data = signaturePad.toData();

  if (data) {
    data.pop(); // remove the last dot or line
    signaturePad.fromData(data);
  }
});

savePNGButton.addEventListener("click", () => {
  if (signaturePad.isEmpty()) {
    alert("먼저 서명해주세요");
  } else {
    const dataURL = signaturePad.toDataURL();
    download(dataURL, "signature.png");
  }
});

saveJPGButton.addEventListener("click", () => {
  if (signaturePad.isEmpty()) {
    alert("먼저 서명해주세요");
  } else {
    const dataURL = signaturePad.toDataURL("image/jpeg");
    download(dataURL, "signature.jpg");
  }
});

saveSVGButton.addEventListener("click", () => {
  if (signaturePad.isEmpty()) {
    alert("먼저 서명해주세요");
  } else {
    const dataURL = signaturePad.toDataURL('image/svg+xml');
    download(dataURL, "signature.svg");
  }
});

/**서명 설정 */


function download(dataURL, filename) {
  const blob = dataURLToBlob(dataURL);
  const url = window.URL.createObjectURL(blob);

  const a = document.createElement("a");
  a.style = "display: none";
  a.href = url;
  a.download = filename;

  document.body.appendChild(a);
  a.click();

  window.URL.revokeObjectURL(url);
}

// One could simply use Canvas#toBlob method instead, but it's just to show
// that it can be done using result of SignaturePad#toDataURL.
function dataURLToBlob(dataURL) {
  // Code taken from https://github.com/ebidel/filer.js
  const parts = dataURL.split(';base64,');
  const contentType = parts[0].split(":")[1];
  const raw = window.atob(parts[1]);
  const rawLength = raw.length;
  const uInt8Array = new Uint8Array(rawLength);

  for (let i = 0; i < rawLength; ++i) {
    uInt8Array[i] = raw.charCodeAt(i);
  }

  return new Blob([uInt8Array], { type: contentType });
}


/** 사인 전송  
 * 
 * 
*/
$('#sign-submit-btn').click(function(){
	
	var file=document.querySelector('#file')
	console.log($('#file').val());
	
	if($('#file').val()==0){
		return;
	}
	var form=$('#sign-frm')[0];
	
	var formData=new FormData(form);
	formData.append('file', $('#file')[0].files[0]);
	console.log(formData)
	
	$.ajax({
		type:"POST",
		 url:"/sign/signUpdate",
		 data: formData
		 ,
		 contentType: false, 
		 processData: false
		 ,success:function(result){
			if(result.trim()>0){
				console.log('성공')
				
			}
		 },error:function(){
			console.log('실패')
		 }
		 
	})
	$('#sign-close').click();
	
})
