## 🏭 페인트제조회사_그룹웨어

## :open_file_folder: 목차
* <a href="#project-outline">프로젝트 개요</a>
* <a href="#my-role">내 담당 기능</a>
* <a href="#team-role">팀원 역할</a>
* <a href="#development-configuration">개발 환경 및 도구</a>
* <a href="#function-implementation">기능 구현</a>

## :date: <a id="project-outline">프로젝트 개요</a>
<p>

 ![logo-clear](https://github.com/chan-hyeok-kim/GDJ68_FinalProject/assets/132668682/a1857600-4f7d-49d3-9a61-ea070618dd08)

</p>

><p><strong>프로젝트</strong>: 페인트제조회사_그룹웨어</p>
><p><strong>기획 및 제작</strong>: 김찬혁, 김민진, 김성호, 장재혁, 김호진</p>
><p><strong>분류</strong>: 팀 프로젝트</p>
><p><strong>제작 기간</strong>: 2023.10.6 ~ 11.19</p>
><p><strong>배포일</strong>: 2023.11.22</p>
><p><strong>사용 기술</strong>: SPRING BOOT</p>
><p><strong>문의</strong>: daiolous@gmail.com</p>

## 🏃 <a id="my-role">내 담당 기능</a>
><p><strong>팀장</strong>: 김찬혁(나)</p>
> - 메인 페이지, 전자결재, 결재선 관리(zTree API), 서명 등록(signature_pad로 생성 & 다운로드-base64인코딩), 실시간 알림(WebSocket), PDF다운로드(iText7 API), 공지사항(파일 업로드), 코드 관리, 문서양식함 관리, 주간 제품 생산량 현황(ChartAPI)

## :speech_balloon: <a id="team-role">팀원 역할</a>
><p><strong>팀원</strong>: 김민진</p>
> - 로그인, 근태 관리, 인사 관리, 발령 관리, 관리자, 주소록 화면(엑셀 다운로드-POI), 내 인사정보 사진(base64인코딩), 인사 등록(DAUM주소 API), 비밀번호 찾기(Gmail SMTP)

><p><strong>팀원</strong>: 김성호</p>
> - 예약 관리(FullCalendar API), 부서별 일정 관리(FullCalendar API), 차량 관리, 거래처 관리, 거래처 등록(DAUM주소 API), 거래내역 출력(엑셀 다운로드-POI)

><p><strong>팀원</strong>: 김호진</p>
> - 기기 관리,품목 관리, 공장/창고 관리

><p><strong>팀원</strong>: 장재혁</p>
> - 구매 관리


## :computer: <a id="development-configuration">개발 환경</a>
<img src="https://img.shields.io/badge/Framework-%23121011?style=for-the-badge"> <img alt="Spring" src ="https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white"/> <img src="https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white"/> <img src="https://img.shields.io/badge/mybatis-004088?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMCIgd2lkdGg9IjEwOC4wMDAwMDBwdCIgaGVpZ2h0PSI4OC4wMDAwMDBwdCIgdmlld0JveD0iMCAwIDEwOC4wMDAwMDAgODguMDAwMDAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJ4TWlkWU1pZCBtZWV0Ij4KCjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDAuMDAwMDAwLDg4LjAwMDAwMCkgc2NhbGUoMC4xMDAwMDAsLTAuMTAwMDAwKSIgZmlsbD0id2hpdGUiIHN0cm9rZT0ibm9uZSI+CjxwYXRoIGQ9Ik0zNTQgNzk1IGMtOSAtMjMgMTUgLTQ1IDQ3IC00NSAxNSAwIDMxIC01IDM1IC0xMSA1IC05IC0xIC0xMCAtMjEgLTUgLTE3IDQgLTQ5IDAgLTgzIC0xMCBsLTU1IC0xOCAtMjMgMjkgYy0yOSAzNyAtNTIgMjQgLTMzIC0xOCAxNiAtMzQgMzIgLTM5IDczIC0yMiA0NCAxOSAxMTAgMTkgMTI1IDIgNiAtOCAxNCAtMjkgMTggLTQ3IGw2IC0zMyAtNDkgNiBjLTI3IDQgLTYxIDEwIC03NSAxMyAtMjUgNiAtMjYgNCAtMjUgLTMzIGwxIC0zOCAtNTcgLTMgYy0zMiAtMiAtNTggLTcgLTU4IC0xMyAwIC0yMiAyOSAtNzggNTkgLTExMSAxNyAtMjAgMzEgLTQzIDMxIC01MSAwIC0yMCAtNDggLTU2IC0xMzAgLTk3IGwtNjUgLTMzIDQ4IC00MyBjNjEgLTU1IDE1MyAtMTAwIDI0MiAtMTE5IDg3IC0xOCAxMzQgLTE4IDIwNiAtMSAxNDAgMzIgMjI1IDEyMiAyODUgMzAwIDEzIDM4IDMyIDc1IDQxIDgyIDE0IDEwIDE1IDEzIDQgMTQgLTExIDAgLTEwIDMgMyAxMyAxNiAxMiAxNyAxNSAzIDIwIC04IDMgLTMwIDM1IC00NyA3MiAtNDIgODggLTg4IDEyMCAtMTc0IDEyMCAtNDQgMCAtNzQgLTcgLTEwOCAtMjQgLTU3IC0yOSAtNzggLTIzIC03OCAyMiAwIDQzIC0xNSA1NyAtNjIgNTcgLTI3IDAgLTQwIDUgLTQ4IDIwIC0xMyAyNCAtMjggMjYgLTM2IDV6IG00NDYgLTIxNSBjMTIgLTggMTEgLTEwIC03IC0xMCAtNDIgMCAtMzIgLTU5IDEwIC02MSAxMiAwIDE2IC0zIDkgLTYgLTIzIC05IC02MyA3IC03MSAzMCAtMTYgNDMgMjAgNzIgNTkgNDd6IG0zMCAtMzAgYzAgLTUgLTQgLTEwIC05IC0xMCAtNiAwIC0xMyA1IC0xNiAxMCAtMyA2IDEgMTAgOSAxMCA5IDAgMTYgLTQgMTYgLTEweiIvPgo8L2c+Cjwvc3ZnPg=="/>

<img src="https://img.shields.io/badge/library-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white"/> <img src="https://img.shields.io/badge/sweetalert-FF3850?style=for-the-badge"/> <img src="https://img.shields.io/badge/lombok-46E3B7?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMCIgd2lkdGg9IjIwMC4wMDAwMDBwdCIgaGVpZ2h0PSIyMDAuMDAwMDAwcHQiIHZpZXdCb3g9IjAgMCAyMDAuMDAwMDAwIDIwMC4wMDAwMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaWRZTWlkIG1lZXQiPgoKPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMDAwMDAsMjAwLjAwMDAwMCkgc2NhbGUoMC4xMDAwMDAsLTAuMTAwMDAwKSIgZmlsbD0id2hpdGUiIHN0cm9rZT0ibm9uZSI+CjxwYXRoIGQ9Ik0zNzAgMTgyMiBjLTExMSAtMTI0IC0xNzAgLTMxNSAtMTcwIC01NTUgMCAtNjMgLTMgLTcyIC0zNSAtMTExIC02MCAtNzMgLTgwIC0xMzAgLTc5IC0yMjEgMSAtMTAzIDIxIC0xNDYgMTE3IC0yNTYgMTMxIC0xNTAgMjg2IC0yNjkgNDYyIC0zNTUgMjc2IC0xMzQgNTU2IC0xNjkgNzcwIC05NSAxMTkgNDEgMzQzIDE1MiAzODMgMTg5IDQwIDM4IDQzIDc4IDcgOTIgLTI5IDExIC03NiAzIC0yNTUgLTQyIC0yOTAgLTc0IC01MTAgLTI4IC02NzggMTQwIC02MSA2MCAtNjUgNjMgLTk0IDUzIC0yNiAtOSAtMzUgLTcgLTc0IDIwIC01MCAzNCAtNTQgNDYgLTE4IDU1IDIyIDYgMjQgMTAgMTkgMzUgLTUgMjIgLTMgMjkgOSAyOSAyMCAwIDIwIDQgLTMgNjUgLTEwIDI4IC0yNCA3NyAtMzEgMTEwIC0zMyAxNjQgLTE1MiAyODUgLTI4MSAyODUgLTQ2IDAgLTQ2IDAgLTUzIDM4IC0zIDIwIC02IDc5IC02IDEyOSAwIDc0IDUgMTA2IDI1IDE1OCAyNiA3MCA2NyAxMzUgMTA5IDE3NCAxNCAxNCAyNiAyNyAyNiAzMSAwIDQgLTIyIDI2IC00OSA0OCBsLTQ5IDQyIC01MiAtNTh6IG04NCAtMTEgYzE3IC0xOCAxNiAtMjEgLTIwIC02OCAtODggLTExNCAtMTE5IC0yMzMgLTEwNCAtMzk4IDEyIC0xMjkgMTIgLTEyNSAtMyAtMTI1IC03IDAgLTI5IC05IC01MCAtMTkgbC0zNyAtMTkgMCAxMTcgYzAgMjI3IDQ2IDM4MCAxNDggNDk0IDM5IDQzIDQzIDQ0IDY2IDE4eiBtLTE1NyAtNzA3IGMzIC05IC0yIC02MCAtMTIgLTExMyAtMjEgLTExNSAtMTYgLTE2MiAyNSAtMjUwIDUxIC0xMDYgMjExIC0yNDggNDAzIC0zNTUgNDggLTI2IDg3IC01MCA4NyAtNTEgMCAtNiAtMTAyIDM2IC0xNTggNjQgLTE4OSA5NiAtNDQxIDMzMiAtNDgxIDQ1MCAtMzUgMTA2IDI2IDI3MSAxMDAgMjcxIDE4IDAgMzIgLTYgMzYgLTE2eiBtMTg4IC0yODEgYzM0IC0xMCA3MyAtMTMgMTIxIC05IDY3IDUgNzIgNCA3NyAtMTYgMTAgLTM2IC0yIC00MSAtOTIgLTM1IC0xMTEgNiAtMTk1IDM0IC0xOTkgNjcgLTMgMjAgLTEgMjIgMjAgMTUgMTIgLTQgNDYgLTEzIDczIC0yMnoiLz4KPC9nPgo8L3N2Zz4="/> 

<img src="https://img.shields.io/badge/IDE-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/Spring Tool Suite4-6DB33F?style=for-the-badge&logo=spring&logoColor=white"/> <img src="https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code"/> <img src="https://img.shields.io/badge/DBeaver-4D2B1A?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMCIgd2lkdGg9IjEyOC4wMDAwMDBwdCIgaGVpZ2h0PSIxMjguMDAwMDAwcHQiIHZpZXdCb3g9IjAgMCAxMjguMDAwMDAwIDEyOC4wMDAwMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaWRZTWlkIG1lZXQiPgoKPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMDAwMDAsMTI4LjAwMDAwMCkgc2NhbGUoMC4xMDAwMDAsLTAuMTAwMDAwKSIgZmlsbD0id2hpdGUiIHN0cm9rZT0ibm9uZSI+CjxwYXRoIGQ9Ik02OTkgMTA5MiBjLTI0IC0xNiAtNTYgLTQzIC03MCAtNjAgLTE4IC0yMSAtMzcgLTMyIC02MCAtMzQgLTMzIC0zIC0zNCAtNCAtMzIgLTQzIDEgLTIyIDQgLTU0IDggLTcwIDUgLTI1IC0yIC00OSAtMzggLTExOSBsLTQ0IC04OCA1IDU0IGM2IDc2IC0xNCAyMjAgLTM3IDI2NiAtNDYgOTAgLTE4MyA5MiAtMjM2IDIgLTE3IC0zMCAtMjAgLTUyIC0yMCAtMTUwIDAgLTEwNiAzIC0xMjMgMzcgLTIxNyA2MSAtMTc0IDE3MiAtMzU1IDI1OCAtNDIzIDY3IC01MyAxMTYgLTcwIDIwNyAtNzAgNTAgMCA4NSA0IDg5IDExIDQgOCAyMiA5IDUzIDQgNjIgLTEwIDExNyAtOCAxNDEgNSAyMiAxMiAyNyA0NSA5IDU2IC04IDUgLTkgMjYgLTMgNzMgNSAzNiA5IDExNiA5IDE3NiAwIDkwIC00IDEyMyAtMjQgMTgyIGwtMjQgNzIgMjcgNjEgYzI5IDY1IDM3IDE1MSAxNyAxODkgLTYgMTEgLTExIDMyIC0xMSA0NyAwIDI2IC0xIDI2IC00NyAyMCAtMjcgLTMgLTYyIC04IC04MCAtMTIgLTIwIC00IC00MyAwIC02NCAxMCAtNTUgMjcgLTY0IDIyIC01OSAtMzMgMSAtMTUgLTExIC0zNyAtMzMgLTYwIC03NSAtNzkgLTg4IC0xMjggLTM5IC0xNDkgMjYgLTExIDI1IC0xMSAtMTQgLTggbC00MiA0IC0yNiAtNjcgYy00MSAtMTAxIC01NiAtMTY5IC01NiAtMjUyIDAgLTc4IDIwIC0xNjUgNDcgLTIwOSBsMTYgLTI1IC0yMSAxOSBjLTEyIDExIC0zNCA0NCAtNDkgNzUgLTM3IDc4IC00MiAxNzIgLTE1IDI4MCAyMyA4OSA3MCAyMDMgODIgMTk2IDMgLTIgNyAxNSA3IDM4IDAgNTMgMzMgMTIzIDg1IDE4MiA0NyA1MyA4MyA3NCAxNDcgODUgbDQ2IDggLTUxIDEgYy0zOSAxIC02MCAtNSAtOTUgLTI3eiBtMjI5IC0zMTUgYy03IC0yMCAtMTcgLTM2IC0yMiAtMzYgLTUgMSAtMTIgLTUgLTE2IC0xMiAtMTIgLTE5IC00MCAtMiAtNDAgMjUgMCAxOSA3IDI2IDI5IDMxIDE2IDMgMzUgMTMgNDIgMjEgMTggMjIgMjEgMTEgNyAtMjl6Ii8+CjwvZz4KPC9zdmc+">

<img src="https://img.shields.io/badge/Language-%23121011?style=for-the-badge"> <img alt="Html" src ="https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white"/> <img alt="Css" src ="https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white"/> <img alt="JavaScript" src ="https://img.shields.io/badge/JavaScriipt-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=black"/> <img src="https://img.shields.io/badge/java-%23ED8B00?style=for-the-badge&logo=openjdk&logoColor=white"> 

<img src="https://img.shields.io/badge/DB-%23121011?style=for-the-badge"> <img alt="Maria" src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white"/> 

<img src="https://img.shields.io/badge/server-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black"/>

<img src="https://img.shields.io/badge/OS-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white"/>

<img src="https://img.shields.io/badge/hosting-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white"/>

<img src="https://img.shields.io/badge/other-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white"/> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white"/> <img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/> <img src="https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white"/> 

#### :hammer: API 및 기타 도구들
Category| Detail
:--:|:--:
API | ```JavaMail API```, ```Apache Commons FileUpload```, ```Fullcalendar```, ```iText7```, ```zTree```, ```Gmail SMTP```, ```WebSocket```, ```Daum 주소 검색 API```,```JDBC```,```Chart API```
Diagram | ```ERDCloud```

## <a id="function-implementation">기능 구현</a>
### 1.접속

#### 1-1.로그인(인사 등록부터 시작하기 때문에 영상이 좀 깁니다.)

![login](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/fb3b37f0-9b0e-4083-a9e0-fbe87ef784dd)

* 먼저, 회사에서 인사 등록을 해야 사번과 임시 비밀번호가 이메일로 발급(gmail SMTP).
* 따라서 회원가입은 없으며 최초 로그인 시, 비밀번호를 변경해야 한다.

#### 1-2.메인 페이지

![mainpage](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/f5a76639-4bf9-4030-829a-10abe6407849)


* 사이드바에서 출근 및 퇴근이 가능.
* 상단바에서는 실시간 알림 확인, Todolist를 적거나 수정 삭제.
* Full-Calendar API 캘린더에서 일정 확인이 가능하며 일정을 등록 가능.
* 상단바 밑의 버튼을 클릭하면 스크롤 바를 내리지 않고도 필요한 정보를 신속하게 확인할 수 있음.
* Chart API를 활용하여 주간 제품 생산량 표시

### 2.인사관리

#### 2-1.근태관리
![attendance](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/5c5ff8b0-a93e-4f73-867f-009e5d4b9e69)
* 월마다 누적, 연장 근무 시간 확인 가능 
* 주마다 누적 근무 시간, 초과 근무 시간, 잔여 근무 시간을 확인 가능. 
* 날마다 업무 시작 시간, 종료 시간, 초과 근무, 누적 근무 시간 확인 가능.

#### 2-2.내 인사정보 & 연차 현황
![mypage](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/eed0b629-263f-4282-ae9f-c888ac487840)
* 자신의 인사등록된 정보를 확인할 수 있고,
* 발생 연차, 총 연차, 사용 연차, 잔여 연차 확인 가능

### 3.전자결재

#### 3-1.결재 리스트
![approvalList](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/410d166d-f119-40c5-a9ee-bfa963868f75)
* 현재 로그인한 사원이 서명이 없을 경우, 기안서 확인 또는 결재 작성을 하는 버튼을 클릭하면 서명 모달이 자동으로 뜸
* signature_pad라이브러리를 적용한 캔버스에 서명을 그리고 jpg나 png로 다운받을 수도 있으며, 등록 버튼을 누르면 내 정보에 자동 등록.(base64인코딩)
  
#### 3-2.기안서 작성
![approvalAdd](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/c836cdf0-677c-411e-864f-8639c6a379ec)
* 트리 구조로 된 결재선(zTree API)으로 결재라인 등록
* 결재양식 미리볼 수 있음.

#### 3-3.반려
![approvalReject](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/b34c34f5-98fb-4d41-b1ed-24ba1fd13c25)
* 반려 시에만 첨언 작성이 가능.
* 반려된 기안서는 다음 결재자들에게 보이지 않으며, 반려한 사람과 반려된 사람에게만 보임.

#### 3-4.승인
![approvalOK](https://github.com/chan-hyeok-kim/SunghoPaint_Groupware/assets/132668682/c7e0267a-5295-43e2-bea5-809cd00ae5e6)

#### 3-5.


### 4. 예약 
#### 4-1.









