--���� ���̺�
create table reservation (
    reCode number not null primary key,
    accNo number not null,
    hotelNo number not null,
    booked_room_count number not null
)

--��������̺�
create table reservation_detail (
    reDetailNo number not null primary key,
    reCode number not null,
    room_type varchar2(20),
    people_num number,
    check_In_Date date not null,
    check_Out_Date date not null
)

--������ ���̺�
CREATE TABLE ADMIN (
    adminNo NUMBER NOT NULL,
    adminName VARCHAR(20) NOT NULL,
    adminId VARCHAR(20) NOT NULL,
    adminPwd VARCHAR(20) NOT NULL
);

--ȣ�� ���̺�
CREATE TABLE HOTEL (
    hotelNo NUMBER NOT NULL,
    hotelName VARCHAR(50) NOT NULL,
    longitude NUMBER NOT NULL,
    latitude NUMBER NOT NULL,
    address VARCHAR2(200) NOT NULL,
    hotelGrade NUMBER NULL,
    hotelDetail  VARCHAR2(500) NULL,
    adminNo NUMBER NOT NULL
);

--�������� ���̺�
CREATE TABLE announcement (
    annNo NUMBER NOT NULL,
    annTitle VARCHAR(20) NOT NULL,
    annContent VARCHAR(1000) NOT NULL,
    regdate DATE NOT NULL,
    adminNo NUMBER NOT NULL,
    fileName VARCHAR(100) NULL,
    originFileName VARCHAR(100) NULL,
    fileSize NUMBER NULL,
    CONSTRAINT pk_annNo PRIMARY KEY(annNo),
    CONSTRAINT fkadminNo FOREIGN KEY(adminNo)
        REFERENCES ADMIN(adminNo)
);

--ȸ�� ���̺�
CREATE TABLE MEMBER (
    accNo NUMBER NOT NULL PRIMARY KEY,
    id VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    pwd VARCHAR(20) NOT NULL,
    age NUMBER NOT NULL,
    email VARCHAR(30) NOT NULL,
    tel VARCHAR(30) NOT NULL,
    point NUMBER NOT NULL
);

--�ı� ���̺�
CREATE TABLE REVIEW (
    reviewNo NUMBER NOT NULL PRIMARY KEY,
    score NUMBER NOT NULL,
    content VARCHAR2(500) NOT NULL,
    regdate DATE NOT NULL,
    accNo NUMBER NOT NULL,
    hotelNo NUMBER NOT NULL,
    room_type varchar2(20) not null
);

--���ø���Ʈ ���̺�
CREATE TABLE WISHLIST (
    wishNo NUMBER NOT NULL PRIMARY KEY,
    accNo NUMBER NOT NULL,
    hotelNo NUMBER NOT NULL
);

--������ ���̺�
CREATE TABLE INQUIRY (
    InqNo NUMBER NOT NULL PRIMARY KEY,
    title VARCHAR2(30) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    regdate DATE NOT NULL,
    accNo NUMBER NOT NULL,
    fileName VARCHAR2(100) NULL,
    originFileName VARCHAR2(100) NULL,
    fileSize NUMBER NULL
);

--1:1 ���� ���̺�
CREATE TABLE DIRECTINQUIRY (
    directNo NUMBER NOT NULL PRIMARY KEY,
    title VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE NOT NULL,
    id VARCHAR2(20) NOT NULL,
    groupNo NUMBER NOT NULL,
    step NUMBER NOT NULL,
    sortNo NUMBER NOT NULL,
    delFlag VARCHAR2(10) NOT NULL
);

--���������з� ���̺�
create table room_type (
    typeNo number not null primary key,
    room_type varchar2(20) not null,
    hotelNo number not null
)

--���ǻ����� ���̺�
create table room_detail (
    roomNo number not null primary key,
    typeNo number not null,
    total_room number not null,
    price_per_day number not null,
    bed number not null,
    wifi number null,
    kitchen number null,
    ac number null
)

--�ܿ�������ȸ ���̺�
create table remained_room (
    remained_roomNo number not null primary key,
    ask_date date,
    remained_room number,
    typeNo number,
    hotelNo number
)

--�δ�ü� ���̺�
CREATE TABLE facilities (
    hotelNo NUMBER NOT NULL primary key,
    conv_store NUMBER NULL,
    laundry_Room NUMBER NULL,
    accompany_pet NUMBER NULL,
    parking NUMBER NULL,
    valet_parking NUMBER NULL,
    breakfast NUMBER NULL,
    pool NUMBER NULL,
    lounge_bar NUMBER NULL
);

--���� ���̺� ��������
alter table reservation
add constraint fk_reservation_accNo FOREIGN KEY (accNo) references member(accNo);

alter table reservation
add constraint fk_resravation_hotelNo FOREIGN KEY (hotelNo) references hotel(hotelNo);

--����� ���̺� ��������
alter table reservation_detail
add constraint fk_reservation_detail_reCode FOREIGN KEY (reCode) references reservation(reCode);

--������ ���̺� ��������
ALTER TABLE ADMIN
ADD CONSTRAINT PK_ADMINNO PRIMARY KEY(adminNo);

--ȣ�� ���̺� ��������
ALTER TABLE HOTEL
ADD CONSTRAINT PK_HOTELNO PRIMARY KEY(hotelNo);

ALTER TABLE HOTEL
ADD CONSTRAINT FK_adminNo FOREIGN KEY(adminNo) 
REFERENCES ADMIN(adminNo);

--�ı� ���̺� ��������
ALTER TABLE REVIEW
ADD CONSTRAINT fk_review_accNo FOREIGN KEY (accNo) 
REFERENCES MEMBER(accNo);

ALTER TABLE REVIEW
ADD CONSTRAINT fk_review_hotelNo FOREIGN KEY (hotelNo) 
REFERENCES HOTEL(hotelNo);

--���ø���Ʈ ���̺� ��������
ALTER TABLE WISHLIST
ADD CONSTRAINT fk_wishlist_accNo FOREIGN KEY (accNo) 
REFERENCES MEMBER(accNo);

ALTER TABLE WISHLIST
ADD CONSTRAINT fk_wishlist_hotelNo FOREIGN KEY (hotelNo) 
REFERENCES HOTEL(hotelNo);

--������ ���̺� ��������
ALTER TABLE INQUIRY
ADD CONSTRAINT fk_inquiry_accNo FOREIGN KEY (accNo) 
REFERENCES MEMBER(accNo);

--���������з� ���̺� ��������
ALTER TABLE room_type
ADD CONSTRAINT fk_room_type_hotelNo FOREIGN KEY (hotelNo) 
REFERENCES Hotel(hotelNo);

--���ǻ����� ���̺� ��������
ALTER TABLE room_detail
ADD CONSTRAINT fk_room_detail_typeNo FOREIGN KEY (typeNo) 
REFERENCES room_type(typeNo);

--�ܿ�������ȸ ���̺� ��������
ALTER TABLE remained_room
ADD CONSTRAINT fk_remained_room_typeNo FOREIGN KEY (typeNo) 
REFERENCES room_type(typeNo);

--�δ�ü� ���̺� ��������
ALTER TABLE facilities ADD CONSTRAINT FK_facilities_hotelNo FOREIGN KEY (hotelNo)
REFERENCES hotel(hotelNo);

--������
create sequence reservation_seq
start with 1
increment by 1
nocache;

create sequence reservation_detail_seq
start with 1
increment by 1
nocache;

--üũ�� Ʈ����
CREATE OR REPLACE TRIGGER tr_remained_room_check_in
AFTER INSERT ON reservation
FOR EACH ROW
DECLARE
  CURSOR c_remained_room IS
    SELECT remained_room
    FROM remained_room
    WHERE hotelno = :new.hotelNo;
  remained_room NUMBER;
  booked_room_count number;
BEGIN
  OPEN c_remained_room;
  FETCH c_remained_room INTO remained_room;

  IF :new.booked_room_count <= remained_room THEN
    UPDATE remained_room
    SET remained_room = remained_room - :new.booked_room_count
    WHERE hotelno = :new.hotelNo;
  ELSE
    RAISE_APPLICATION_ERROR(-20001, '�ܿ������� �����ϴ�.');
  END IF;
  CLOSE c_remained_room;
END;

--üũ�ƿ� Ʈ����
CREATE OR REPLACE TRIGGER tr_remained_room_check_out
AFTER INSERT ON reservation
FOR EACH ROW
DECLARE
  CURSOR c_reservation_detail IS
    SELECT rd.check_out_date, r.hotelNo, r.booked_room_count
    FROM reservation_detail rd
    INNER JOIN reservation r ON rd.recode = r.recode
    WHERE rd.recode = :old.recode
      AND rd.check_out_date <= TRUNC(SYSDATE);
  v_check_out_date DATE;
  v_hotelno NUMBER;
  v_booked_room_count NUMBER;
BEGIN
  OPEN c_reservation_detail;
  LOOP
    FETCH c_reservation_detail INTO v_check_out_date, v_hotelno, v_booked_room_count;
    EXIT WHEN c_reservation_detail%NOTFOUND;
    
    UPDATE remained_room
    SET remained_room = remained_room + v_booked_room_count
    WHERE hotelno = v_hotelno;
  END LOOP;
  CLOSE c_reservation_detail;
END;

drop trigger tr_remained_room_check_in;
drop trigger tr_remained_room_check_out;

