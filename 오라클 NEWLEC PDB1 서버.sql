CREATE TABLE MEMBER
(
    ID VARCHAR2(50),
    PWD NVARCHAR2(50),
    NAME NVARCHAR2(50),
    GENDER NCHAR(2), -- ���� / ���� UTF
    AGE NUMBER(3),
    BIRTHDATY CHAR(10),-- 2000-02-02
    PHONE CHAR(13), -- 010-1234-2345
    REGDATE DATE
);

INSERT INTO MEMBER (GENDER) VALUES('����');

SELECT LENGTHB(GENDER) FROM MEMBER;

DROP TABLE MEMBER;

SELECT LENGTH('����') FROM DUAL;
SELECT LENGTHB('����') FROM DUAL;

SELECT * FROM NLS_DATABASE_PARAMETERS

--�÷� ������ Ÿ�� ����
ALTER TABLE MEMBER MODIFY ID NVARCHAR2(50);

--�÷� ����
ALTER TABLE MEMBER DROP COLUMN AGE;

--�÷� �߰�
ALTER TABLE MEMBER ADD EMAIL VARCHAR2(200);

CREATE TABLE NOTICE
(
     ID		NUMBER,
     TITLE 		NVARCHAR2(100),
     WRITER_ID	NVARCHAR2(50),
     CONTENT	CLOB,
     REGDATE  	TIMESTAMP,
     HIT		NUMBER,
     FILES		NVARCHAR2(1000)
);

CREATE TABLE "COMMENT"
(
     ID		NUMBER,
     CONTENT	NVARCHAR2(2000),
     REGDATE  	TIMESTAMP,
     WRITER_ID	NVARCHAR2(50),
     NOTICE_ID	NUMBER
);

CREATE TABLE ROLE
(
     ID		VARCHAR2(50),
     DISCRIPTION 	NVARCHAR2(500)
);

CREATE TABLE MEMBER_ROLE
(
     MEMBER_ID	NVARCHAR2(50),
     ROLE_ID		VARCHAR2(50)
);

--�� �ֱ�
INSERT INTO MEMBER(ID, PWD) VALUES ('newlec', '1111');
INSERT INTO MEMBER(ID, PWD) VALUES ('test', '1111');
--�÷� ��Ī �ֱ�
SELECT ID "USER ID", NAME, PWD FROM MEMBER;
--��� ���� PWD�� '111'�� �����ϱ�
UPDATE MEMBER SET PWD='222';

--Ư�� ������ PWD ����
UPDATE MEMBER SET PWD='222', NAME='�տ���' WHERE ID='dragon';

--�� ����
DELETE MEMBER WHERE ID='test';

COMMIT;
ROLLBACK;

SELECT HIT+1 HIT FROM NOTICE;

--����� ���� ���̺� DUAL
SELECT 1+'A' FROM DUAL;

--���ڿ� ���ϱ�
SELECT 1 || '3' FROM DUAL;

--��� ȸ���� �̸��� ��ȸ�Ͻÿ�. �� �̸��� ID�� �ٿ��� ��Ÿ���ÿ�. ȫ�浿(HONG)
SELECT NAME||'('||ID||')' NAME FROM MEMBER;

DROP TABLE NOTICE;
SELECT * FROM NOTICE;

--�Խñ� �߿��� �ۼ��ڰ� 'newlec'�� �Խñ۸� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE WRITER_ID='newlec';

--�Խñ� �߿��� ��ȸ���� 3�� �Ѵ� �۸� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT > 3;

--�Խñ� �߿��� ������ �Է����� ���� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE CONTENT IS NULL;

--��ȸ���� 0,1,2�� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT BETWEEN 0 AND 2;

--��ȸ���� 0,2,7�� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT IN(0,2,7);

--��ȸ���� 0,2,7�� �ƴ� �Խñ��� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE HIT NOT IN(0,2,7);

--ȸ�� �߿��� '��'�� ���� ��ȸ�Ͻÿ�.
UPDATE NOTICE SET WRITER_ID='�ڶ���' WHERE ID=1;

SELECT * FROM NOTICE WHERE WRITER_ID LIKE '��%';

--ȸ�� �߿��� '��'���̰� �̸��� ������ ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE WRITER_ID LIKE '��__';

--ȸ�� �߿��� '��'�� ���� ������ ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM NOTICE WHERE WRITER_ID NOT LIKE '��%';

--ȸ�� �߿��� �̸��� '��'�ڰ� �� ȸ���� ��ȸ�Ͻÿ�.
INSERT INTO NOTICE(WRITER_ID) VALUES ('���ö�');

SELECT * FROM NOTICE WHERE WRITER_ID LIKE '%��%';

--���� ��ȣ�� �� ������ ���
INSERT INTO NOTICE(TITLE) VALUES('�Ƹ��� 016-0000-2320');

SELECT * FROM NOTICE WHERE REGEXP_LIKE(TITLE, '01[016-9]-\d{3,4}-\d{4}');

--�� ����
SELECT * FROM NOTICE WHERE ROWNUM BETWEEN 1 AND 3;

SELECT * FROM (SELECT ROWNUM NUM, NOTICE.* FROM NOTICE)
WHERE NUM BETWEEN 1 AND 5;

SELECT DISTINCT AGE FROM MEMBER;
UPDATE MEMBER SET AGE=25 WHERE NAME='����';

--�����Լ�
SELECT SUBSTR('TRIANGLE', 1, 3) FROM DUAL;
--SUBSTRB 3��° BYTE���� �ڸ�
SELECT SUBSTRB('TRIANGLE', 1, 2) FROM DUAL;

SELECT SUBSTR(NAME, 2) FROM MEMBER;

--MEMBER ���̺� BIRTHDAY �� �ֱ�
SELECT * FROM MEMBER;
UPDATE MEMBER SET BIRTHDAY='1999-07-11' WHERE NAME='����ó';
UPDATE MEMBER SET BIRTHDAY='1989-02-01' WHERE NAME='�տ���';
UPDATE MEMBER SET BIRTHDAY='2000-11-23' WHERE NAME='���缮';
UPDATE MEMBER SET BIRTHDAY='2005-09-03' WHERE NAME='������';
UPDATE MEMBER SET BIRTHDAY='1995-08-21' WHERE NAME='��ȣ��';
UPDATE MEMBER SET BIRTHDAY='1987-12-29' WHERE NAME='����';

UPDATE MEMBER SET NAME='����ó' WHERE BIRTHDAY=1999-01-11;

--�÷� �̸� ����
ALTER TABLE MEMBER RENAME COLUMN BIRTHDATY TO BIRTHDAY;

--��� �л��� �̸��� ��� ������ ��ȸ�Ͻÿ�.
SELECT SUBSTR(NAME, 2, 2), SUBSTR(BIRTHDAY,6, 2) MONTH FROM MEMBER;

--MEMBER ���̺� PHONE �� �ֱ�
UPDATE MEMBER SET PHONE='010-2323-2321' WHERE NAME='����ó';
UPDATE MEMBER SET PHONE='011-5656-8235' WHERE NAME='�տ���';
UPDATE MEMBER SET PHONE='010-6267-6565' WHERE NAME='���缮';
UPDATE MEMBER SET PHONE='011-2323-7521' WHERE NAME='������';
UPDATE MEMBER SET PHONE='011-7546-8524' WHERE NAME='��ȣ��';
UPDATE MEMBER SET PHONE='010-2133-2531' WHERE NAME='����';

--ȸ�� �߿��� ��ȭ��ȣ�� 011���� �����ϴ� ȸ���� ��� ������ ����Ͻÿ�.
SELECT SUBSTR(PHONE, 1, 3) FROM MEMBER;
SELECT * FROM MEMBER WHERE SUBSTR(PHONE, 1, 3)='011';
SELECT * FROM MEMBER WHERE PHONE LIKE '011%';

--ȸ�� �߿��� ���� ���� 7,8,9���� ȸ���� ��� ������ ����Ͻÿ�.
SELECT * FROM MEMBER WHERE SUBSTR(BIRTHDAY, 6, 2) NOT IN ('07','08', '09');

--MEMBER ���̺� �� �ֱ�
INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, PHONE, AGE) VALUES('nunusi', '123', '������', '1966-01-23', '010-2321-2556', 27);
INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, PHONE, AGE) VALUES('fish', '567', '���ﱹ', '1978-05-13', '010-5651-6456', 51);
INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, PHONE, AGE) VALUES('haha', '999', '������', '1978-01-23', '011-7821-2896', 33);
INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, PHONE, AGE) VALUES('mom', '789', '���½�', '1988-01-23', '011-2241-2646', 45);

INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, AGE) VALUES('didi', '111', '������', '2008-07-18', 15);
INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, AGE) VALUES('mian', '233', '���½�', '2006-07-18', 17);
INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, AGE) VALUES('ki', '111', '������', '1991-07-18', 32);
INSERT INTO MEMBER(ID, PWD, NAME, BIRTHDAY, AGE) VALUES('ku', '000', '������', '2000-03-18', 23);

--��ȭ��ȣ�� ������� ���� ȸ�� �߿��� ���� ���� 7,8,9���� ȸ���� ��� ������ ����Ͻÿ�.
SELECT * FROM MEMBER WHERE SUBSTR(BIRTHDAY, 7, 1) IN ('7', '8', '9') AND PHONE IS NULL;

--���ڿ� ���� �Լ��� ����
SELECT CONCAT('ȫ', '�浿') FROM DUAL;
SELECT 3||'4' FROM DUAL;

--���ڿ� Ʈ�� �Լ�
SELECT LTRIM('   HELLO   ') FROM DUAL; --LTRIM : ����
SELECT RTRIM('   HELLO   ') FROM DUAL; --RTRIM : ������
SELECT TRIM('   HELLO   ') FROM DUAL; --TRIM : ��ü

--���ڿ� �ҹ��� �Ǵ� �빮�ڷ� �����ϱ�
SELECT LOWER('NeWleC') FROM DUAL;
SELECT UPPER('NeWleC') FROM DUAL;

--ȸ���� ���̵� 'newlec'�� ȸ���� ��ȸ�Ͻÿ�.(��/�ҹ��ڸ� ������ �ʰ�)
SELECT * FROM MEMBER WHERE UPPER(ID)='NEWLEC';

--���ڿ� ��ġ �Լ� REPLACE/TRANSLATE
SELECT REPLACE('WHERE WE ARE', 'WE', 'YOU') FROM DUAL;
SELECT TRANSLATE('WHERE WE ARE', 'WE', 'YOU') FROM DUAL;

--ȸ���� �̸��� �ּҸ� ��ȸ�Ͻÿ�.(��. �ּҴ� ��ĭ ���� ����Ͻÿ�.)
SELECT NAME, REPLACE(ADDRESS, ' ') FROM MEMBER;
SELECT * FROM MEMBER;

--���ڿ� �е� �Լ�
SELECT LPAD('HELLO', 10, '0') FROM DUAL; --������ 0���� ä����.
SELECT RPAD('HELLO', 10, '0') FROM DUAL;  --�������� 0���� ä����.

--ȸ���� �̸��� ��ȸ�Ͻÿ�.(�� �̸��� ���̰� 3�ڰ� �ȵǴ� ���� �̸� �������� ����ٷ� ä��ÿ�.)
SELECT RPAD(NAME, 8, '0') NAME FROM MEMBER;

--ù ���ڸ� �빮�ڷ� �ٲٴ� �Լ� INITCAP(���ڿ�)
SELECT INITCAP('the imp����ortant th������ing is') FROM DUAL;

--���ڿ� �˻� �Լ� INSTR(���ڿ�, �˻����ڿ�, ��ġ, ã�� ��)
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO') SEARCH FROM DUAL;
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO', 15) SEARCH FROM DUAL;
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO', 1, 2) SEARCH FROM DUAL;

--ȸ���� ��ȭ��ȣ���� �� ��° ���(-) ���ڰ� �����ϴ� ��ġ�� ����Ͻÿ�.
SELECT INSTR(PHONE, '-', 1, 2) SEARCH FROM MEMBER;

--ȸ���� ��ȭ��ȣ���� ù ���� ���(-) ���ڿ� �� ��° ���(-) ���ڰ� ������ ������?
SELECT (INSTR(PHONE, '-', 1, 2) - INSTR(PHONE, '-', 1, 1)) FROM MEMBER;

--��ȭ��ȣ���� ù ��°�� �� ��° ������ ����
SELECT INSTR(PHONE,'-', 1, 2) FROM MEMBER;
SELECT INSTR(PHONE,'-', 1, 1)-1 FROM MEMBER;

SELECT SUBSTR(PHONE, 5, INSTR(PHONE,'-', 1, 2)-INSTR(PHONE,'-', 1, 1)-1) PHONE FROM MEMBER;

-- ���ڿ� ���̸� ��� �Լ�
SELECT LENGTH('WHERE WE ARE') FROM DUAL;

--��� ȸ���� �ڵ��� ��ȣ�� ��ȣ�� ���ڿ� ���̸� ��ȸ�Ͻÿ�.
SELECT PHONE, LENGTH(PHONE) FROM MEMBER;

--�Լ� ��ø : ���࿡ ȸ���� ��ȭ��ȣ �÷��� ���Ե� ���� '-'�� ���� ��ȭ��ȣ�� ���̸� ����Ͻÿ�.
SELECT LENGTH(PHONE) FROM MEMBER;

SELECT LENGTH(REPLACE(PHONE, '-', '')) FROM MEMBER;

--�ڵ� ���� ��ȯ�ϴ� �Լ�
SELECT ASCII('A') FROM DUAL;

--�ڵ� ���� ���ڷ� ��ȯ�ϴ� �Լ�
SELECT CHR(65) FROM DUAL;

--�����Լ�
--���밪�� ���ϴ� �Լ� ABS(n)
SELECT ABS(35), ABS(-35) FROM DUAL;

--����/����� �˷��ִ� �Լ� SIGN(n)
SELECT SIGN(35), SIGN(-35), SIGN(0) FROM DUAL;

--������ �ݿø� ���� �˷��ִ� �Լ� ROUND(n, i)
SELECT ROUND(34.456789), ROUND(34.56789) FROM DUAL;
SELECT ROUND(12.3456789, 2), ROUND(12.3456789, 3) FROM DUAL;

--������ ������ ���ϴ� �Լ��� �������� ���ϴ� �Լ� POWER(n1, n2)/SQRT(n)
SELECT POWER(5,2), SQRT(25) FROM DUAL;
SELECT POWER(7,3), SQRT(64) FROM DUAL;

--���� �ð��� ��� �Լ�
--SYSTIMESTAMP:����Ŭ ������ �ð���
--CURRENT_TIMESTAMP:���� ������ �ð���
SELECT SYSDATE, CURRENT_DATE, SYSTIMESTAMP, CURRENT_TIMESTAMP FROM DUAL;

--���� �ð��� ���� ����
ALTER SESSION SET TIME_ZONE='09:00';
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
SELECT SYSDATE, CURRENT_DATE FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;

COMMIT;
--��¥ �����Լ� EXTRACT(YEAR/MONTH/DAY/HOUR/MINUTE/SECOND FROM...)
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(DAY FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(HOUR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MINUTE FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(SECOND FROM SYSDATE) FROM DUAL;

--MEMBER TABLE�� ���Գ�¥ �÷� �߰�
ALTER TABLE MEMBER ADD (JOINDATE DATE);

--MEMBER TABLE ���Գ�¥ �� �ֱ�
UPDATE MEMBER SET JOINDATE='2023-05-23' WHERE NAME='������';

--���� ȸ�� �߿� �����(2,3,11,12)�� �޿� ������ ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER;
SELECT * FROM MEMBER WHERE  EXTRACT(MONTH FROM JOINDATE) IN (2,3,11,12);

--��¥�� �����ϴ� �Լ� ADD_MONTH(��¥, ����)
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, -1) FROM DUAL;

--���� ȸ�� �߿� �������� 6������ �� �Ǵ� ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE ADD_MONTHS(SYSDATE, -6) > JOINDATE;

--��¥�� ���̸� �˾Ƴ��� �Լ� MONTHS_BETWEEN(��¥, ��¥)
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2013-12-25')) FROM DUAL;

--���� ȸ�� �߿� �������� 6������ �� �Ǵ� ȸ���� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER WHERE MONTHS_BETWEEN(SYSDATE, JOINDATE) < 6;

--���� ������ �˷��ִ� �Լ� NEXT_DAY(���糯¥, ��������)
SELECT NEXT_DAY(SYSDATE, '������') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL; --�Ͽ���

--���� ������ ���ڸ� �˷��ִ� �Լ� LAST_DAY(��¥)
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY(ADD_MONTHS(SYSDATE, 2)) FROM DUAL;

--������ �������� ��¥�� �ݿø��ϴ�/�ڸ��� �Լ� ROUND/TRUNC(��¥, ����)
SELECT ROUND(TO_DATE('2051-02-03'), 'CC'), TRUNC(SYSDATE, 'CC') FROM DUAL;
SELECT ROUND(SYSDATE, 'YEAR'), TRUNC(SYSDATE, 'YEAR') FROM DUAL;
SELECT ROUND(SYSDATE, 'Q'), TRUNC(SYSDATE, 'Q') FROM DUAL;

--NUMBER ������ ���ڿ�(VARCHAR2)�� ��ȯ TO_CHAR(NUMBER)
-- '$99,999,999,999.99' ���� ���̺��� ���� �Ѵ�.
SELECT TO_CHAR(12345678, '$99,999,999,999.99') FROM DUAL; 

SELECT TO_CHAR (12345678, '99999,999') || 'HELLO' FROM DUAL;

--���� ���� �������� �� ��Ÿ���� ������ �� ������ ���ְ� ����Ͻÿ�.
SELECT LTRIM(TO_CHAR (1234567890.345, '99,99999,99999.99')) || ' ��' ���� FROM DUAL;

--DATE ������ ���ڿ�(VARCHAR2)�� ��ȯ TO_CHAR(DATETIME)
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH:MI:SS') FROM DUAL;

--���ڿ��� ������������ ��ȯ�ϴ� �Լ� TO_NUMBER(���ڿ�)
SELECT TO_NUMBER('1994') FROM DUAL;
SELECT TO_NUMBER ('2')+3 FROM DUAL;

--��ȯ ���� NULL�� ��쿡 ��ü ���� �����ϴ� NVL(NULL, ��ü��) �Լ�
SELECT * FROM MEMBER;
SELECT NVL(AGE, 0) FROM MEMBER;

--���ɴ� ǥ��
SELECT TRUNC(AGE/10)*10||'��' FROM MEMBER;
SELECT NVL(TRUNC(AGE/10)*10,0) FROM MEMBER;

--NVL���� ������ �ϳ� �� Ȯ���� NVL2(�Է°�, NULL��ü��, NOTNULL ��ü��) �Լ�
SELECT NVL2(AGE, TRUNC(AGE/10)*10, 0) ���ɴ� FROM MEMBER;

--�� ���� ���� ��� NULL �׷��� ���� ��� ù ��° �� ��ȯ NULLIF(��1, ��2) �Լ�
SELECT NAME, NULLIF(AGE,51) FROM MEMBER;

--���ǿ� ���� �����ϱ� DECODE(���ذ�, �񱳰�, ��°�, �񱳰�, ��°�)
SELECT DECODE(GENDER, '����', 1, 2) FROM MEMBER;
SELECT DECODE(SUBSTR(PHONE, 1, 3), '011', 'SK', '016', 'KT', '�űԹ�ȣ'), PHONE, NAME FROM MEMBER;

--�̸��� �������� �������� �����ؼ� ��ȸ�Ͻÿ�.
SELECT * FROM MEMBER ORDER BY AGE DESC; 

--ȸ�� �߿��� '��'�� ���� ���� ȸ���� ��ȸ�Ͻÿ�. �� ���̸� (������)������ ����.
SELECT * FROM MEMBER WHERE NAME LIKE '��%' ORDER BY AGE ASC;

--���� �Լ�
SELECT * FROM NOTICE;
SELECT WRITER_ID, COUNT(ID) COUNT FROM NOTICE GROUP BY WRITER_ID ORDER BY COUNT(ID) DESC;
COMMIT;

--ȸ���� �Խñ� ���� ��ȸ�Ͻÿ�.
SELECT WRITER_ID, COUNT(N.ID) FROM NOTICE N 
GROUP BY WRITER_ID HAVING COUNT(N.ID) <= 2;

SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT DESC), ID, TITLE, WRITER_ID,HIT
FROM NOTICE;
--ORDER BY HIT;

--��������
SELECT * FROM
(SELECT * FROM MEMBER ORDER BY JOINDATE DESC) 
WHERE ROWNUM BETWEEN 1 AND 3; 

--���̰� 30 �̻��� ȸ�� ��� ��ȸ
SELECT * FROM MEMBER WHERE AGE >= 30;

--��ճ��� �̻��� ȸ��
SELECT * FROM MEMBER 
WHERE AGE >= (SELECT AVG(AGE) FROM MEMBER);

SELECT AVG(AGE) FROM MEMBER;

