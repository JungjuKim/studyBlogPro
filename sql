-- 계정 생성문

-- 계정 생성
CREATE USER studyBlog IDENTIFIED BY madle;
-- ip 주소 : 192.168.10.165

-- 데이터베이스 접속권한, 테이블, 뷰, 프로시저, 시퀀스 생성 권한
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE, UNLIMITED TABLESPACE TO studyBlog;


-- 타 pc의 계정 연결 방법
-- https://record-than-remember.tistory.com/entry/Oracle-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%A0%91%EC%86%8D-%EC%84%A0%ED%83%9D-%EB%8B%A4%EB%A5%B8-PC%EC%9D%98-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%A0%91%EA%B7%BC%ED%95%98%EA%B8%B0

-- 테이블, 데이터 import, export
-- https://wakestand.tistory.com/372


-- 테이블, 시퀀스 생성문
CREATE TABLE users
(
    username VARCHAR2(50) NOT NULL PRIMARY KEY
    , password VARCHAR2(100) NOT NULL
    , name NVARCHAR2(20) NOT NULL
    , nickname NVARCHAR2(20) NOT NULL
);

CREATE TABLE board
(
    bno NUMBER(30) NOT NULL PRIMARY KEY
    , title NVARCHAR2(100) NOT NULL
    , contents CLOB NOT NULL
    , username VARCHAR2(50) NOT NULL
    , CONSTRAINT fk_board_username FOREIGN KEY(username) REFERENCES users(username)
    , CONSTRAINT fk_category_no FOREIGN KEY(category_no) REFERENCES category(category_no)
);

CREATE TABLE CATEGORY (
    category_no NUMBER(7) PRIMARY KEY
    , username VARCHAR2(50) NOT NULL
    , major_category VARCHAR2(255) NOT NULL
    , medium_category VARCHAR2(255)
    , minor_category VARCHAR2(255)
    , detail_category VARCHAR2(255)
    , CONSTRAINT fk_category_username FOREIGN KEY(username) REFERENCES users(username)
);

CREATE SEQUENCE seq_board;
