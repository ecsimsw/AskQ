---- Info ----

김진환

목적 :
  
  1. JSP, Servlet / JDBC (mySql)을 연습하고 싶었습니다.
  
  2. 블로그에 사람들이 질문을 남겨주시는 걸 보고,
     유튜버와 구독자 / 스타와 팬 / 블로거와 방문자 의 관계에서 좀 더 자유롭게 질문을 남기고 답변하는 서비스가 있으면
     좋을 것 같아서 만들게 되었습니다.

블로그 : https://ecsimsw.tistory.com/

깃허브 : https://github.com/ecsimsw

제작 : 2020.05

---- Screen Shots ----






---- 버젼 정보 ----



---- To do ----

앞으로 더 추가할 기능 들

1. 좋아요 기능 

2. 사용자 아이콘 선택 
  
3. 파일, 변수명 리펙토링

4. 회원 삭제


---- style 정보 ----

1. ask / login / update Form

  background: #b0b0b0;

  #contact button[type="submit"]:hover {
  background: #808080;
  
  #contact button[type="submit"]:active {
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
  }
  

---- DB DAO ----

1. MerberDAO  

 - private MemberDAO()
 - static MemberDAO getInstance()
 - String getPwById(String id)
 - LinkedList<String> getMemebersIdList()
 - int insertMember(String new_id, String new_pw)
 - int loginCheck(String inputId, String inputPw)
 - int changePwById(String currentId, String newPw)
 - int getAnsweredById(String id)
 - int changeAskedById(String id, int asked)
 - int changeIntroduceById(String id, String introduce)
 - String getIntroduceById(String id)
 
 - static int USER_NONEXISTENT = 1;
 - static int WRONG_PASSWORD = 2;
 - static int VALID_USER = 0;
 
2. QuesitonDAO

  - private QuestionDAO()
  - static QuestionDAO getInstance()  
  - int insertQuestion(QuestionDTO question) 
  - int updateAnswer(int no, String answer, int status)
  - ArrayList<QuestionDTO> searchPublicQ(String searchedUser)
  - ArrayList<QuestionDTO> searchPrivateQ(String searchedUser)
  - int deleteByNo(int no)
  - QuestionDTO getQuestionByNo(int no) 
  
  
---- DB INFO ----

DB_name : anyq

1. members
mysql> DESC members;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| no        | int         | NO   | PRI | NULL    | auto_increment |
| id        | varchar(11) | YES  |     | NULL    |                |
| pw        | varchar(11) | YES  |     | NULL    |                |
| introduce | text        | YES  |     | NULL    |                |
| status    | int         | YES  |     | NULL    |                |
| icon      | int         | YES  |     | NULL    |                |
| asked     | int         | YES  |     | NULL    |                |
| answered  | int         | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
status

0 : default
1 : new arrived question

icon

0 : default

2. questions
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| no              | int         | NO   | PRI | NULL    | auto_increment |
| questioner      | varchar(11) | YES  |     | NULL    |                |
| questioner_type | int         | YES  |     | NULL    |                |
| question_date   | date        | YES  |     | NULL    |                |
| receiver        | varchar(11) | YES  |     | NULL    |                |
| question        | text        | YES  |     | NULL    |                |
| answer          | text        | YES  |     | NULL    |                |
| status          | int         | YES  |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

questioner_type

0 : non-user
1 : user

status

0 : nonAnswered, non-public
1 : Answered, public
