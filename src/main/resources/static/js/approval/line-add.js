/**
 * 결재선 줄수에 따라 뒤에 숫자 달라짐
 * ex) approvalLine1=>결재선에 기안자 확인란만 있음
 */

let approvalLine3 = '<span id="docs-internal-guid-154649cb-7fff-4066-e4b2-8ebdc9ce0973"><div dir="ltr" align="center"><table class="__se_tbl_ext" style="border:none;border-collapse:collapse;"><colgroup><col width="58"><col width="86"><col width="86"><col width="86"></colgroup><tbody><tr style="height:5.5872802734375pt"><td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">결 재</span></p></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:62.25pt"><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:0pt"><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr></tbody></table></div></span>';

let approvalLine1 = '<span id="docs-internal-guid-fe95ce02-7fff-fe80-414b-be8c661eb408"><div dir="ltr" align="center"><table class="__se_tbl_ext" style="border:none;border-collapse:collapse;"><colgroup><col width="58"><col width="86"><col width="86"></colgroup><tbody><tr style="height:5.5872802734375pt"><td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">결 재</span></p></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:62.25pt"><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:0pt"><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr></tbody></table></div></span>';
let approvalLine2 = '<colgroup><col width="58"><col width="86"><col width="86"></colgroup><tr style="height:5.5872802734375pt"><td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">결 재</span></p></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:62.25pt"><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:0pt"><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr>';
let approvalLine4 = '<span id="docs-internal-guid-dd2f4b54-7fff-483f-b05c-461fdee09e8e"><div dir="ltr" align="center"><table class="__se_tbl_ext" style="border:none;border-collapse:collapse;"><colgroup><col width="58"><col width="86"><col width="86"><col width="86"><col width="86"></colgroup><tbody><tr style="height:5.5872802734375pt"><td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">결 재</span></p></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:62.25pt"><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:62.25pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr><tr style="height:0pt"><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td><td style="height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td></tr></tbody></table></div></span>';

/*$('#approval-line-add-blank').text('');
*/

var tabCount;

const appTab1 ='<th rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;" scope="col"><br><br><p dir="ltr" style="line-height: 1.2; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 400; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">결</span></p><br><p dir="ltr" style="line-height: 1.2; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 400; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">재</span></p></th>'

const appTab = '<td rowspan="3" style="height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;background-color:#cccccc;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br><br><br><p dir="ltr" style="line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 10pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;">결 재</span></p></td>'
const topTab = '<td class="top-sign-tab" style="text-align:center; height:5.5872802734375pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td>'
const midTab = '<td class="mid-sign-tab" style="height:62.25pt; width:82px; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td>'
const botTab = '<td class="bot-sign-tab" style="text-align:center; height:0pt; border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;"><br></td>'







console.log($('.mid-sign-tab'))
if(!$('.mid-sign-tab') || $('.mid-sign-tab').length==0){
    $('#top-tap').append(appTab);
    if ($('#add-app').text()=='') {
        //추가 검토자가 없을때 둘만 필요
        //$('#app-test-tbl').append(approvalLine3)
        tabCount = 2;
           console.log(tabCount)
        for (let i=0; i < tabCount; i++) {
        $('#top-tap').append(topTab);
        $('#mid-tap').append(midTab);
        $('#bot-tap').append(botTab);
	       }
    }else{
        for (let i=0; i < 3; i++) {
        $('#top-tap').append(topTab);
        $('#mid-tap').append(midTab);
        $('#bot-tap').append(botTab);
        }

    }
}







/* 삭제
*/

$('#app-delete-btn').click(function() {

	Swal.fire({
		text: '정말로 삭제하시겠습니까?',
		showCancelButton: true,
		confirmButtonText: '승인',
		confirmButtonColor: 'red',
		cancelButtonText: '취소',
		reverseButtons: true,
		icon: 'warning',
	}).then(function(result) {
		if (result.isConfirmed) {
			let deleteNo = $('#add-app').attr('data-no');
            console.log(deleteNo)
			$.ajax({
				type: 'POST',
				url: '/approval/delete',
				data: {
					approvalNo: deleteNo
				}, success: function(result) {
					if (result.trim() > 0) {
						swal('삭제 성공')
						location.replace('/approval/totalList')
					}
					

				}, error: function() {
					console.log('삭제 실패')
				}
			})
		}
	})
})



