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
CREATE SEQUENCE grade_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE exam_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE Member CASCADE CONSTRAINT;
CREATE TABLE Member(
          mem_id VARCHAR2(20) CONSTRAINT member_pk PRIMARY KEY,
          pw VARCHAR2(20) NOT NULL,
          name VARCHAR2(20) NOT NULL,
          gender VARCHAR2(10) NOT NULL,
          reg_date VARCHAR2(20)NOT NULL,
          ssn VARCHAR2(10)NOT NULL,
          email VARCHAR2(30),
          profile_img VARCHAR2(100)DEFAULT ,
          role VARCHAR2(5),
          phone VARCHAR2(13)
          major_seq INT,
           CONSTRAINT gender_ck CHECK(gender IN('MAIL','FEMAIL'))
          CONSTRAINT major_member_fk FOREIGN KEY (major_seq) REFERENCES Major(major_seq)ON DELETE CASCADE
          );
          
DROP TABLE Grade CASCADE CONSTRAINT;;          
CREATE TABLE Grade(
grade_seq INT CONSTRAINT grade_pk PRIMARY KEY,
grade VARCHAR2(5)NOT NULL,
term VARCHAR2(10)NOT NULL,
mem_id VARCHAR2(20)NOT NULL,
CONSTRAINT member_grade_fk FOREIGN KEY (mem_id) REFERENCES Member(mem_id)ON DELETE CASCADE
);

DROP TABLE Board CASCADE CONSTRAINT;
CREATE TABLE Board(
art_seq INT CONSTRAINT board_pk PRIMARY KEY,
category VARCHAR2(5)NOT NULL,
title VARCHAR2(5)DEFAULT 'NO TITLE',
reg_date  VARCHAR2(10) NOT NULL,
content  VARCHAR2(10) DEFAULT 'NO CONTENT',
mem_id VARCHAR2(20),
CONSTRAINT member_ board_fk FOREIGN KEY (mem_id) REFERENCES Member(mem_id)ON DELETE CASCADE
);  

DROP TABLE Subject CASCADE CONSTRAINT;;
CREATE TABLE Subject(
subj_seq INT CONSTRAINT subject_pk PRIMARY KEY,
subj_name VARCHAR2(20)NOT NULL,
mem_id VARCHAR2(20)NOT NULL,
CONSTRAINT member_subject_fk FOREIGN KEY (mem_id) REFERENCES Member (mem_id)ON DELETE CASCADE
); 

DROP TABLE Major CASCADE CONSTRAINT;;
CREATE TABLE Major(
major_seq INT CONSTRAINT major_pk PRIMARY KEY,
title VARCHAR2(20)NOT NULL
);


DROP TABLE Exam CASCADE CONSTRAINT;
CREATE TABLE Exam(
exam_seq INT CONSTRAINT exam_pk PRIMARY KEY,
term VARCHAR2(10)NOT NULL,,
score INT DEFAULT,
subj_seq INT
mem_id VARCHAR2(20),
CONSTRAINT subject_exam_fk FOREIGN KEY (subj_id) REFERENCES Subject (subj_seq)ON DELETE CASCADE
CONSTRAINT member_exam_fk FOREIGN KEY (mem_id) REFERENCES Member (mem_id)ON DELETE CASCADE
);       
select * from tab;
DROP TABLE account CASCADE CONSTRAINT;
DROP view account_member CASCADE CONSTRAINT;
DROP TABLE grade CASCADE CONSTRAINT;
DROP view grade_member CASCADE CONSTRAINT;
DROP TABLE member CASCADE CONSTRAINT;
DROP TABLE subject CASCADE CONSTRAINT;
DROP view subject_member CASCADE CONSTRAINT;
DROP TABLE test CASCADE CONSTRAINT;

-- CREATE
insert into member(id,pw,name,reg_date,ssn,email,profile_img) 
values('lee','1','이순신','2016-07-01','800101-1','lee@test.com','lee.jpg');
insert into member(id,pw,name,reg_date,ssn,email,profile_img) 
values('hong2','1','홍길동','2015-07-01','100701-1','hong2@test.com','hong2.jpg');
insert into member(id,pw,name,reg_date,ssn,email,profile_img) 
values('kim','1','김유신','2013-07-01','090701-3','kim@test.com','kim.jpg');
-- READ ()
select * from member; 
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