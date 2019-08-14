
DROP TABLE REPLY;
DROP TABLE BOARD;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_BID;
DROP SEQUENCE SEQ_RID;

--------------------------------------------------
--------------     MEMBER ����	------------------	
--------------------------------------------------

CREATE TABLE MEMBER (
  USER_ID VARCHAR2(30) PRIMARY KEY,
  USER_PWD VARCHAR2(100) NOT NULL,
  USER_NAME VARCHAR2(30) NOT NULL,
  NICKNAME VARCHAR2(30) NOT NULL,
  EMAIL VARCHAR2(100),
  BIRTHDAY DATE,
  GENDER VARCHAR2(1) CHECK (GENDER IN('M', 'F')),
  PHONE VARCHAR2(13),
  ADDRESS VARCHAR2(100),
  ENROLL_DATE DATE DEFAULT SYSDATE,
  UPDATE_DATE DATE DEFAULT SYSDATE,
  M_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(M_STATUS IN('Y', 'N'))
);

INSERT INTO MEMBER 
VALUES ('admin', '1234', '������', '���', 'admin@kh.or.kr', '19800918', 'F', '010-1111-2222', '����� ������ ���ﵿ', '20180101', '20180101', DEFAULT);

INSERT INTO MEMBER 
VALUES ('user01', 'pass01', 'ȫ�浿', '�̽���ȫ', 'user01@kh.or.kr', '19900213', 'M','010-3333-4444', '����� ��õ�� ��', '20180201', '20180202', DEFAULT);

COMMIT;



----------------------------------------------------
-----------------     BOARD ����        ------------------	
----------------------------------------------------

CREATE TABLE BOARD(
  BID NUMBER PRIMARY KEY,
  BTYPE NUMBER, 
  BTITLE VARCHAR2(100) NOT NULL,
  BCONTENT VARCHAR2(4000),
  BWRITER VARCHAR2(30),
  BCOUNT NUMBER DEFAULT 0,
  B_CREATE_DATE DATE,
  B_MODIFY_DATE DATE,
  B_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (B_STATUS IN('Y', 'N')),
  FOREIGN KEY (BWRITER) REFERENCES MEMBER
);

CREATE SEQUENCE SEQ_BID;

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, 'ù��° �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. ù �Խ����Դϴ�.', 'admin', DEFAULT, '20180210', '20180210', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '�ι�° �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. 2 �Խ����Դϴ�.', 'user01', DEFAULT, '20180211', '20180211', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '���� ���긮�� �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. 3 �Խ����Դϴ�.', 'admin', DEFAULT, '20180212', '20180212', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '�ȳ�.. ���̹�Ƽ���� ó������?', '�ȳ��ϼ���. ù �Խ����Դϴ�.', 'user01', DEFAULT, '20180220', '20180220', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '��� ��������', '�ݰ����ϴ�.', 'admin', DEFAULT, '20180220', '20180220', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '����¡ ó�������� ���õ����� ���� �־���´�...', '�ȳ��Ͻʴϱ�', 'admin', DEFAULT, '20180221', '20180221', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '�Խ��� ����', '�ȳ��ϼ���. �Խ����Դϴ�.', 'admin', DEFAULT, '20180221', '20180221', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '���õ����͵� ', '�ȳ��ϼ���.', 'user01', DEFAULT, '20180224', '20180225', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '��ε� ȭ����!!', 'ȭ���� �ϼ���!!', 'admin', DEFAULT, '20180301', '20180301', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '��������!!!', ' �Խ����Դϴ�.', 'admin', DEFAULT, '20180301', '20180301', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '�Խ��� ����', '�����ӿ�ũ�� ó������?', 'admin', DEFAULT, '20180301', '20180301', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '�����ϰڽ��ϴ�.', '���ݺ��� ����!!', 'user01', DEFAULT, '20181021', '20181021', DEFAULT);

INSERT INTO BOARD 
VALUES(SEQ_BID.NEXTVAL, 1, '������ �Խ��� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. ������ �Խ����Դϴ�.', 'admin', DEFAULT, '20181021', '20181021', DEFAULT);



----------------------------------------------------
----------------    REPLY ����         -------------------	
----------------------------------------------------

CREATE TABLE REPLY(
  RID NUMBER PRIMARY KEY,
  RCONTENT VARCHAR2(400),
  REF_BID NUMBER,
  RWRITER VARCHAR2(30),
  R_CREATE_DATE DATE,
  R_MODIFY_DATE DATE,
  R_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (R_STATUS IN ('Y', 'N')),
  FOREIGN KEY (REF_BID) REFERENCES BOARD,
  FOREIGN KEY (RWRITER) REFERENCES MEMBER
);

CREATE SEQUENCE SEQ_RID;

INSERT INTO REPLY
VALUES(SEQ_RID.NEXTVAL, 'ù��° ����Դϴ�.', 1, 'user01', '20180213', '20180213', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RID.NEXTVAL, 'ù��° ����Դϴ�.', 13, 'user01', '20181030', '20181030', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RID.NEXTVAL, '�ι�° ����Դϴ�.', 13, 'user01', '20181030', '20181030', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RID.NEXTVAL, '������ ����Դϴ�.', 13, 'user01', '20181030', '20181030', DEFAULT);



COMMIT;


