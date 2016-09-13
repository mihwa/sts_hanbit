select * from tab;
-- select sequence_owner, sequence_name from dba_sequences where sequence_owner = 'GKSQLC';
drop sequence seq;

--CREATE
DROP SEQUENCE grade_seq;
DROP SEQUENCE art_seq;
DROP SEQUENCE subj_seq;
DROP SEQUENCE major_seq;
DROP SEQUENCE exam_seq;

CREATE SEQUENCE grade_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE art_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE subj_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE major_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE exam_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;

SELECT SEQUENCE_OWNER, SEQUENCE_NAME FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = 'HANBIT';

DROP TABLE Major CASCADE CONSTRAINT;
DROP TABLE Member CASCADE CONSTRAINT;
DROP TABLE Grade CASCADE CONSTRAINT; 
DROP TABLE Board CASCADE CONSTRAINT;
DROP TABLE Subject CASCADE CONSTRAINT;
DROP TABLE Exam CASCADE CONSTRAINT;

CREATE TABLE Major(
       major_seq INT  PRIMARY KEY,
       title VARCHAR2(20) NOT NULL
);   
CREATE TABLE Member(
          mem_id VARCHAR2(20)  PRIMARY KEY,
          pw VARCHAR2(20) NOT NULL,
          name VARCHAR2(20) NOT NULL,
          gender VARCHAR2(10) NOT NULL,
          reg_date VARCHAR2(20) NOT NULL,
          ssn VARCHAR2(10) NOT NULL,
          email VARCHAR2(30),
          profile_img VARCHAR2(100) DEFAULT 'default.jpg',
          role VARCHAR2(10) DEFAULT 'STUDENT',
          phone VARCHAR2(13) NOT NULL,
          major_seq INT,
          CONSTRAINT gender_ck CHECK (gender IN ('MALE', 'FEMALE')),
          CONSTRAINT major_member_fk FOREIGN KEY (major_seq) REFERENCES Major(major_seq) ON DELETE CASCADE 
          );
CREATE TABLE Grade(
        grade_seq INT  PRIMARY KEY,
        grade VARCHAR2(5) NOT NULL,
        term VARCHAR2(10) NOT NULL,
        mem_id VARCHAR2(20) NOT NULL,
        CONSTRAINT member_grade_fk FOREIGN KEY (mem_id) REFERENCES Member(mem_id) ON DELETE CASCADE 
);
CREATE TABLE Board(
       art_seq INT  PRIMARY KEY,
       category VARCHAR2(20) NOT NULL,
       title VARCHAR2(30) DEFAULT 'NO TITLE',
       reg_date VARCHAR2(20) NOT NULL,
       content VARCHAR2(100) DEFAULT 'NO CONTENT',
       mem_id VARCHAR2(20),
       CONSTRAINT member_board_fk FOREIGN KEY (mem_id) REFERENCES Member(mem_id) ON DELETE CASCADE 
);  
CREATE TABLE Subject(
       subj_seq INT   PRIMARY KEY,
       subj_name VARCHAR2(20) NOT NULL,
       mem_id VARCHAR2(20) NOT NULL,
       CONSTRAINT member_subject_fk FOREIGN KEY (mem_id) REFERENCES Member(mem_id) ON DELETE CASCADE 
);
CREATE TABLE Exam(
       exam_seq INT  PRIMARY KEY,
       term VARCHAR2(10) NOT NULL,
       score INT DEFAULT 0,
       subj_seq INT,
       mem_id VARCHAR2(20),
       CONSTRAINT subject_exam_fk FOREIGN KEY (subj_seq) REFERENCES Subject(subj_seq) ON DELETE CASCADE,
       CONSTRAINT member_exam_fk FOREIGN KEY (mem_id) REFERENCES Member(mem_id) ON DELETE CASCADE 
);

--Major
CREATE OR REPLACE PROCEDURE insertMajor(
   sp_major_seq IN Major.major_seq%TYPE,
   sp_title IN Major.title%TYPE
) AS 
BEGIN
   INSERT INTO Major(major_seq,title)
   VALUES(sp_major_seq,sp_title)
END; 
--Member
CREATE OR REPLACE PROCEDURE insertMember(
   sp_mem_id IN Member.mem_id%TYPE,
   sp_pw IN member.pw%TYPE,
   sp_name IN Member.name%TYPE,
   sp_gender IN Member.gender%TYPE,
   sp_reg_date IN Member.reg_date%TYPE,
   sp_ssn IN Member.ssn%TYPE,
   sp_email IN Member.email%TYPE,
   sp_profile_img IN Member.profile_img%TYPE,
   sp_role IN Member.role%TYPE,
   sp_phone IN Member.phone%TYPE,
   sp_major_seq IN Member.major_seq%TYPE 
) AS 
BEGIN
   INSERT INTO Member(mem_id,pw,name,gender,reg_date,ssn,email,profile_img,role,phone,major_seq)
   VALUES(sp_mem_id,sp_pw,sp_name,sp_gender,sp_reg_date,sp_ssn,sp_email,sp_profile_img,sp_role,sp_phone,sp_major_seq)
END;
--Grade
CREATE OR REPLACE PROCEDURE insertGrade(
   sp_grade_seq IN Grade.grade_seq%TYPE,
    sp_grade IN Grade.grade%TYPE,
   sp_term IN Grade.term%TYPE,
   sp_mem_id IN Grade.mem_id%TYPE
) AS 
BEGIN
   INSERT INTO Grade(grade_seq,grade,term,mem_id)
   VALUES(sp_grade_seq,sp_grade,sp_term,sp_mem_id)
END;
--Board
CREATE OR REPLACE PROCEDURE insertBoard(
   sp_art_seq IN Board.art_seq%TYPE,
   sp_categor IN Board.categor%TYPE,
   sp_title IN Board.title%TYPE,
   sp_reg_date IN Board.reg_date%TYPE,
   sp_content IN Board.content%TYPE,
   sp_mem_id IN Board.mem_id%TYPE
) AS 
BEGIN
   INSERT INTO Grade(art_seq,category,title,reg_date,content,mem_id)
   VALUES(sp_art_seq,sp_categor,sp_title,sp_reg_date,sp_content,sp_mem_id)
END;
--Subject
CREATE OR REPLACE PROCEDURE insertSubject(
   sp_subj_seq IN Subject.subj_seq%TYPE,
   sp_subj_name IN Subject.subj_name%TYPE,
   sp_mem_id IN Subject.mem_id%TYPE,
) AS 
BEGIN
   INSERT INTO Grade(subj_seq,subj_name,mem_id)
   VALUES(sp_subj_seq,sp_subj_name,sp_mem_id)
END;
--Exam
CREATE OR REPLACE PROCEDURE insertExam(
   sp_exam_seq IN Exam.exam_seq%TYPE,
   sp_term IN Exam.term%TYPE,
   sp_score IN Exam.score%TYPE,
   sp_subj_seq IN Exam.subj_seq%TYPE,
   sp_mem_id IN Exam.mem_id%TYPE
) AS 
BEGIN
   INSERT INTO Grade(exam_seq,term,score,subj_seq,mem_id)
   VALUES(sp_exam_seq,sp_term,sp_score,sp_subj_seq,sp_mem_id)
END;
CREATE or replace VIEW Major_view 
AS 
SELECT 
 m.major_seq as major_seq,
 m.title AS major_title,
 u.mem_id AS mem_id,
 u.pw AS pw,
 u.name AS name,
 u.gender AS gender,
 u.reg_date AS reg_date,
 u.ssn AS ssn,
 u.email AS email,
 u.profile_img AS profime_img,
 u.role AS role,
 u.phone AS phone
FROM Major m, Member u 
WHERE m.major_seq = u.major_seq; 

CREATE or replace VIEW Grade_view
AS
SELECT 
 u.mem_id AS mem_id,
 u.pw AS pw,
 u.name AS name,
 u.gender AS gender,
 u.reg_date AS reg_date,
 u.ssn AS ssn,
 u.email AS email,
 u.profile_img AS profime_img,
 u.role AS role,
 u.phone AS phone,
 g.grade_seq AS grade_seq,
 g.grade AS grade,
 g.term AS term,
 s.subj_seq AS subj_seq,
 s.subj_name AS subj_name,
 x.exam_seq AS exam_seq,
 x.score AS score
FROM Member u, Grade g, Subject s, Exam x 
WHERE u.mem_id = g.mem_id AND u.mem_id = s.mem_id AND u.mem_id = x.mem_id;

CREATE or replace VIEW Board_view
AS
SELECT 
 u.mem_id AS mem_id,
 u.pw AS pw,
 u.name AS name,
 u.gender AS gender,
 u.reg_date AS reg_date,
 u.ssn AS ssn,
 u.email AS email,
 u.profile_img AS profime_img,
 u.role AS role,
 u.phone AS phone,
 b.title AS title,
 b.art_seq AS art_seq,
 b.category AS category,
 b.reg_date AS write_date,
 b.content AS content
FROM Member u, Board b  
WHERE u.mem_id = b.mem_id;

AS
BEGIN
INSERT INTO Member(mem_id,pw,name,,gender,reg_date,ssn,email,profile_img,role,phone,major_seq) 
VALUES(sp_mem,sp_pw,sp_name ,sp_gender,sp_reg_date,sp_ssn,sp_email,sp_profile_img,sp_role,sp_phone,)
END;
EXEC insertMajor(major_seq,'컴퓨터공학')
EXEC insertMember('lee','1','이순신','MALE','2016-07-01','800101-1','lee@test.com','lee.jpg','STUDENT','010-1234-5678',1000)
select * from tab;

DROP TABLE account CASCADE CONSTRAINTS;
DROP TABLE account_member CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;
DROP view grade_member CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE subject CASCADE CONSTRAINTS;
DROP view subject_member CASCADE CONSTRAINTS;
DROP TABLE test CASCADE CONSTRAINTS;

-- CREATE
insert into member(id,pw,name,reg_date,ssn,email,profile_img) 
values('lee','1','이순신','2016-07-01','800101-1','lee@test.com','lee.jpg');
insert into member(id,pw,name,reg_date,ssn,email,profile_img) 
values('hong2','1','홍길동','2015-07-01','100701-1','hong2@test.com','hong2.jpg');
insert into member(id,pw,name,reg_date,ssn,email,profile_img) 
values('kim','1','김유신','2013-07-01','090701-3','kim@test.com','kim.jpg');

-- READ ()
select * from Member;
select * from subject;
select * from member where id = 'hong';
select * from member where gender = '남';
select count(*) as count from member where id = 'hong'; 

-- UPDATE
update member set email = id || '@test.com'; 
update member set email = 'hong@test.com'where id = 'hong';
alter table member add email varchar2(30);
alter table member add profile_img varchar2(100);
update member set ssn = '900301-1' where id = 'park';
update member set profile_img = id ||'.jpg' where profile_img IS NULL;
-- DELETE
delete from member where id = 'test';
select * from member;
select * from member where id='hong';