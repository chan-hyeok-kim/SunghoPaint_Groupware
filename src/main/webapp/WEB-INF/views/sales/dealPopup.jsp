<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>거래명세서</title>
<style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            height:650px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .invoice-details {
            margin-bottom: 30px;
        }
        .invoice-details span {
            display: inline-block;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
        }
        .items-table th, .items-table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        .invoice-details-wrapper .invoice-details {
		    border: 2px solid #000;
		    padding: 10px;
}
.invoice-details-wrapper2 .invoice-details {
		    border: 1px solid #000;
		    padding: 10px;
		    width: 30%;
}
    </style>
</head>
<body>
<div class="container">
        <div class="header">
            <h1>거래명세서</h1>
        </div>
        <div class="invoice-details-wrapper2">
        <div class="invoice-details">
            <p>거래처명 : <span class="clientName"></span></p>
            주소 : <span class="clientAddress"></span>
            <span class="clientRefAddress"></span>
            <span class="clientDetailAddress"></span>
            
            <p><span>☎ </span> <span class="clientNumber"></span></p>
        </div>
        </div>

        <div class="invoice-details-wrapper">
        <div class="invoice-details">
        <span style="font-weight: bold;">금액 : <span id="result"></span></span>
            <span style="float: right; font-weight: bold;">(￦<span class="totalPrice"></span>)</span>
        </div>
        </div>
        
        
        <table class="items-table">
            <thead>
                <tr>
                    <th>일자</th>
                    <th>품목명</th>
                    <th>수량</th>
                    <th>단가</th>
                    <th>합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><span class="purchaseDate"></span></td>
                    <td><span class="codeName"></span></td>
                    <td>?</td>
                    <td>?</td>
                    <td><span class="totalPrice"></span> 원</td>
                </tr>
            </tbody>
        </table>
        <br>
        
        <div class="invoice-details" style="text-align: right;">
            <span>수량: </span> ?<br>
            <span>공급가액: </span> ?<br>
            <span>부가세 (VAT):</span> ?<br>
            <span>총 금액: </span> <span class="totalPrice"></span> 원<br>
        </div>
        <div style="text-align: center;">
        <br>
            <span style="font-size:xx-large;">성호페인트</span>
            <div style="text-align: right;">
            
            <form action="./excelDownload" method="get">
            <input type="hidden" name="purDate" value="">
	        <input type="hidden" name="cliName" value="">
	        <input type="hidden" name="codName" value="">
	        <input type="hidden" name="toPrice" value="">
    			<button id="submit">엑셀 다운로드</button>
        	</form>
	</div>
        </div>
    </div>
    
 
    
    
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    let purDate = window.opener.purDate;
    let cliName = window.opener.cliName;
    let codName = window.opener.codName;
    let toPrice = window.opener.toPrice;
    let result = toPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    let empId = window.opener.empId;
    let clientZipCode = window.opener.clientZipCode;
    let clientAddress = window.opener.clientAddress;
    let clientRefAddress = window.opener.clientRefAddress;
    let clientDetailAddress = window.opener.clientDetailAddress;
    let clientNumber = window.opener.clientNumber;

    
    document.querySelectorAll('.purchaseDate').forEach(function(element) {
        element.innerText = purDate;
    });

    document.querySelectorAll('.clientName').forEach(function(element) {
        element.innerText = cliName;
    });

    document.querySelectorAll('.codeName').forEach(function(element) {
        element.innerText = codName;
    });

    document.querySelectorAll('.totalPrice').forEach(function(element) {
        element.innerText = result;
    });

    document.querySelectorAll('.employeeId').forEach(function(element) {
        element.innerText = empId;
    });
    
    document.querySelectorAll('.clientZipCode').forEach(function(element) {
        element.innerText = clientZipCode;
    });
    
    document.querySelectorAll('.clientAddress').forEach(function(element) {
        element.innerText = clientAddress;
    });
    
    document.querySelectorAll('.clientRefAddress').forEach(function(element) {
        element.innerText = clientRefAddress;
    });
    
    document.querySelectorAll('.clientDetailAddress').forEach(function(element) {
        element.innerText = clientDetailAddress;
    });
    
    document.querySelectorAll('.clientNumber').forEach(function(element) {
        element.innerText = clientNumber;
    });

let a = num2han(toPrice) + '원 정';
document.getElementById('result').innerText=a;
console.log(a);

console.log(num2han(1234));

function num2han(num) { 
	num = parseInt((num + '').replace(/[^0-9]/g, ''), 10) + '';  	// 숫자/문자/돈 을 숫자만 있는 문자열로 변환  
	
	if(num == '0')    
		return '영';  
	
	var number = ['영', '일', '이', '삼', '사', '오', '육', '칠', '팔', '구'];  
	var unit = ['', '만', '억', '조'];  
	var smallUnit = ['천', '백', '십', '']; 
	
	var result = [];  //변환된 값을 저장할 배열  
	
	var unitCnt = Math.ceil(num.length / 4);	//단위 갯수. 숫자 10000은 일단위와 만단위 2개이다.  
	num = num.padStart(unitCnt * 4, '0')	//4자리 값이 되도록 0을 채운다  

	var regexp = /[\w\W]{4}/g;  //4자리 단위로 숫자 분리  
	var array = num.match(regexp);  
	
	//낮은 자릿수에서 높은 자릿수 순으로 값을 만든다(그래야 자릿수 계산이 편하다)  
	for(var i = array.length - 1, unitCnt = 0; i >= 0; i--, unitCnt++) {  
		var hanValue = _makeHan(array[i]);	//한글로 변환된 숫자   
		if(hanValue == '')  //값이 없을땐 해당 단위의 값이 모두 0이란 뜻.       
		continue;
		
		result.unshift(hanValue + unit[unitCnt]);  //unshift는 항상 배열의 앞에 넣는다.  
	}  
	
		//여기로 들어오는 값은 무조건 네자리이다. 1234 -> 일천이백삼십사  
		function _makeHan(text) {    
			var str = '';    
			for(var i = 0; i < text.length; i++) {      
				var num = text[i];      
				if(num == '0')  //0은 읽지 않는다        
				continue;  
				
				str += number[num] + smallUnit[i];    
				}    
			return str;  
			}  
		return result.join('');
		}
		
		

console.log(cliName)
console.log("zzz")
});


</script>
</body>
</html>