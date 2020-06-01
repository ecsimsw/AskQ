# AnyQ

![logo](/screenshots/anyQ.png)

  1. JSP, Servlet / JDBC (mySql)을 연습하고 싶었습니다.    
  
  2. 제 블로그에 사람들이 질문을 남겨주시는 걸 보고,    
       
     유튜버 - 구독자 / 스타 - 팬 / 블로거 - 방문자 / 쇼핑몰 - 구매자 등, 질문자와 답변자가 명확히 분리된 관계에서    
      
     기존의 절차가 필요한 방식의 댓글보다 좀 더 유연하고 자유롭게 질문을 남기고 답변할 수 있으면     
     
     재밌을 것 같아서 만들게 되었습니다.     
     
  3. 질문자는 로그인을 하지 않아도, 답변자의 아이디만 알면 질문할 수 있는,    
  
     답변자는 질문자의 로그인 여부에 상관없이 본인 아이디만 홍보하면 사람들이 질문을 남길 수 있는 기능이 핵심인 서비스 입니다.  

        
# 버전 정보 

아파치/ 톰캣 : apache-tomcat-8.5.54

mySql : Ver 8.0.20 for Win64 on x86_64

JDBC : mysql-connector-java-8.0.20

ConnectionPool : commons-collections4-4.4 / commons-dbcp2-2.7.0 / commons-pool2-2.8.0
  
Jquery : jQuery JavaScript Library v3.5.1  
  
    
# 실행 화면  

## 메인 페이지     
  - 중앙의 검색창에 유저 아이디를 입력하여 해당 유저의 질문창으로 이동합니다.
![mainPage](https://user-images.githubusercontent.com/46060746/83357305-994bc600-a3a6-11ea-9fd0-6fddc5c1e298.PNG)

## 유저 검색  
  - 검색창에 문자열을 입력하면, 일치하는 id 목록을 추천해쥽니다. 
![userRecommend](/screenshots/recommend1.PNG)

## 유저의 질문과 답변 목록
  - 검색 유저가 받은 질문과 답변을 볼 수 있는 페이지 입니다. 해당 유저의 소갯말과, 받은 질문 / 답변한 질문의 수를 상단에서 보여주고, 하단에는 질문들과 답변을 확인할 수 있습니다.
  
  - 질문자가 유저라면 해당하는 아이콘과 id가, 익명 사용자라면 익명에 맞는 아이콘과 질문자가 정한 이름이 표시됩니다.
  
  - 유저인 질문자를 클릭하면 해당 유정의 질문과 답변 목록으로 페이지가 전환 됩니다.
    
![searchedPage](/screenshots/searchedPage.PNG)

## 질문하기   
  - 검색 유저 소개글 옆에 아이콘으로 질문할 수 있습니다.  
![ask](/screenshots/질문하기.PNG)

## 사이드 바   
  - 메뉴를 편하게 이동하기 위한 사이드바 입니다. 로그인 여부, 현재 페이지에 따라 다른 메뉴를 갖고 있습니다.
  
  - 새로운 질문이 도착하면 이를 표시합니다.
![sideBar2](/screenshots/sideBar.png)


## 로그인과 회원 가입      
  - 기본적으로 로그인 화면이나, 아래 Create an account를 누르면 페이지 이동없이 form 전환이 일어납니다.

  - 항목을 놓쳤거나 조건에 맞지 않는 정보가 입력되면, submit을 처리하지 않고, 해당 칸을 강조합니다. 
![loginPage](/screenshots/login,signIn.png)

## 내 질문 내역    

  - 받은 질문에 답을 하거나, 답 한 질문의 답변을 수정할 수 있습니다. 또는 질문을 삭제할 수 있습니다.
![myQuestions](/screenshots/myQuestions.PNG)

## 답변하기    

  - 이미 답한 질문이라면, answer에 기존 작성한 답변이 출력됩니다. 수정을 원한다면 이를 고쳐 submit 할 수 있습니다.

![answerNew2](/screenshots/answerNew2.PNG)

## 마이 페이지  

  - 본인 소개글이나, 비밀번호를 변경할 수 있습니다. 
![myPage](/screenshots/myPage.PNG)

## 작은 화면 / 모바일 화면    

  - 화면 크기에 따라 반응할 수 있도록 화면을 구성하였습니다.
  
  - 작은 화면이나 모바일에서는 구성 요소의 크기나 작아지고, 요소간 거리가 좁아지며, 필수적이지 않은 요소는 제거하여 좀 더 유연한 화면을 만들고자 하였습니다.  

![mobile](/screenshots/모바일.png)
![mobile](/screenshots/모바일1.png)


# 만든이

김진환
  
블로그 : https://ecsimsw.tistory.com/

깃허브 : https://github.com/ecsimsw

제작 : 2020.05 
  
      
# 후기
