CLEAR SCREEN;

alter session set 
nls_date_format = 'YYYY-MM-DD';

SET LINESIZE 450;
SET PAGESIZE 400;

SET SERVEROUTPUT ON;

DELETE FROM     OCENA;
DROP TABLE      OCENA;
--
DELETE FROM     WYCH_KLASA;
DROP TABLE      WYCH_KLASA;
--
DELETE FROM     WYCHOWAWCA;
DROP TABLE      WYCHOWAWCA;
--
DELETE FROM     UCZEN_KLASA;
DROP TABLE      UCZEN_KLASA;
--
DELETE FROM     KLASA_PRZEDMIOT;
DROP TABLE      KLASA_PRZEDMIOT;
--
DELETE FROM     KLASA;
DROP TABLE      KLASA;
--
DELETE FROM     NAUCZYCIEL_PRZEDMIOT;
DROP TABLE      NAUCZYCIEL_PRZEDMIOT;
--
DELETE FROM     NAUCZYCIEL;
DROP TABLE      NAUCZYCIEL;
--
DELETE FROM     UCZEN_RODZIC;
DROP TABLE      UCZEN_RODZIC;
--
DELETE FROM     RODZIC;
DROP TABLE      RODZIC;
--
DELETE FROM     UCZEN;
DROP TABLE      UCZEN;
--
DELETE FROM     UZYTKOWNIK;
DROP TABLE      UZYTKOWNIK;
--
DELETE FROM     LOGOWANIE;
DROP TABLE      LOGOWANIE;
--
DELETE FROM     ADRES;
DROP TABLE      ADRES;
--
DELETE FROM     PRZEDMIOT;
DROP TABLE      PRZEDMIOT;

-- TYP GLOBALNY w schemacie użtkownika - VARRAY
CREATE or REPLACE TYPE bd1_T_v_zestaw IS VARRAY(50) OF varchar2(20);
/

-- TYP GLOBALNY w schemacie użtkownika - TABLE
CREATE or REPLACE TYPE bd1_T_t_zestaw IS TABLE OF varchar2(20);
/

--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE PRZEDMIOT;
PROMPT----------------------------------------;
PROMPT ; 
--
create table PRZEDMIOT
(
PRZEDMIOT_ID				number(4)			NOT NULL,
PRZEDMIOT_NAZWA				varchar2(30)		NOT NULL
); 
--TABLESPACE PRZEDMIOT;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;

alter table PRZEDMIOT
add constraint CSR_PK_PRZEDM
primary key (PRZEDMIOT_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_PRZEDMIOT;
CREATE SEQUENCE SEQ_PRZEDMIOT
INCREMENT BY 1 START WITH 1 MINVALUE 1;
PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_PRZEDMIOT
BEFORE INSERT ON PRZEDMIOT
FOR EACH ROW
	BEGIN
		IF :NEW.PRZEDMIOT_ID IS NULL THEN
			SELECT SEQ_PRZEDMIOT.NEXTVAL 
				INTO :NEW.PRZEDMIOT_ID FROM DUAL;
		END IF;
		--
	END;
	/
	--

--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM PRZEDMIOT
PROMPT------------------------;
PROMPT;	
insert into PRZEDMIOT(PRZEDMIOT_NAZWA)
values ('Matematyka');
insert into PRZEDMIOT(PRZEDMIOT_NAZWA)
values ('Chemia');
insert into PRZEDMIOT(PRZEDMIOT_NAZWA)
values ('Fizyka');
insert into PRZEDMIOT(PRZEDMIOT_NAZWA)
values ('Informatyka');

--
column PRZEDMIOT_ID HEADING 'ID' for 9999
column PRZEDMIOT_NAZWA HEADING 'PRZEDMIOT' for A20
--
select * from PRZEDMIOT;
--
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE ADRES;
PROMPT----------------------------------------;
PROMPT ; 
--
create table ADRES
(
ADRES_ID				number(4)			NOT NULL,
ADRES_MIESJCOWOSC		varchar2(50)   		NOT NULL,
ADRES_ULICA				varchar2(50)   		NOT NULL,
ADRES_NR_DOMU			number(4)  			NOT NULL,
ADRES_NR_MIESZKANIA		number(4)  			,
ADRES_KOD_POCZTOWY		varchar2(20)		NOT NULL
); 
--TABLESPACE ADRES;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;

alter table ADRES
add constraint CSR_PK_ADRES
primary key (ADRES_ID);

PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_ADRES;
CREATE SEQUENCE SEQ_ADRES
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_ADRES
BEFORE INSERT ON ADRES
FOR EACH ROW
	BEGIN
		IF :NEW.ADRES_ID IS NULL THEN
			SELECT SEQ_ADRES.NEXTVAL 
				INTO :NEW.ADRES_ID FROM DUAL;
		END IF;
		--
	END;
	/
	--

	
--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM ADRES
PROMPT------------------------;
PROMPT;	
insert into ADRES(ADRES_MIESJCOWOSC,ADRES_ULICA,ADRES_NR_DOMU,ADRES_NR_MIESZKANIA,ADRES_KOD_POCZTOWY)
	values ('Krakow','Centralna','12','45','34-345');
insert into ADRES(ADRES_MIESJCOWOSC,ADRES_ULICA,ADRES_NR_DOMU,ADRES_NR_MIESZKANIA,ADRES_KOD_POCZTOWY)
	values ('Krakow','Avia','14','56','31-358');
insert into ADRES(ADRES_MIESJCOWOSC,ADRES_ULICA,ADRES_NR_DOMU,ADRES_NR_MIESZKANIA,ADRES_KOD_POCZTOWY)
	values ('Krakow','Rakowicka','87','5','34-865');
insert into ADRES(ADRES_MIESJCOWOSC,ADRES_ULICA,ADRES_NR_DOMU,ADRES_NR_MIESZKANIA,ADRES_KOD_POCZTOWY)
	values ('Krakow','Soltysowska','77','156','34-345');
insert into ADRES(ADRES_MIESJCOWOSC,ADRES_ULICA,ADRES_NR_DOMU,ADRES_NR_MIESZKANIA,ADRES_KOD_POCZTOWY)
	values ('Krakow','Soltysowska','77','153','34-345');
insert into ADRES(ADRES_MIESJCOWOSC,ADRES_ULICA,ADRES_NR_DOMU,ADRES_NR_MIESZKANIA,ADRES_KOD_POCZTOWY)
	values ('Krakow','Centralna','18','19','34-345');
insert into ADRES(ADRES_MIESJCOWOSC,ADRES_ULICA,ADRES_NR_DOMU,ADRES_NR_MIESZKANIA,ADRES_KOD_POCZTOWY)
	values ('Krakow','Al.Pokoju','43','13','34-345');
--
column ADRES_ID HEADING 'ID' for 9999
column ADRES_MIESJCOWOSC HEADING 'MIEJSCOWOSC' for A15
column ADRES_ULICA HEADING 'ULICA' for A15
column ADRES_NR_DOMU HEADING 'NR DOMU' for 9999
column ADRES_NR_MIESZKANIA HEADING 'NR MIESZKANIA' for 9999
column ADRES_KOD_POCZTOWY HEADING 'KOD POCZTOWY' for 9999
--
select * from ADRES;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE LOGOWANIE;
PROMPT----------------------------------------;
PROMPT ; 
--
create table LOGOWANIE
(
LOG_ID					number(4)			NOT NULL,
LOG_NAZWA				varchar2(50)   		NOT NULL,
LOG_HASLO				varchar2(20)		NOT NULL
); 

--TABLESPACE LOGOWANIE;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;

alter table LOGOWANIE
add constraint CSR_PK_LOGOWANIE
primary key (LOG_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_LOGOWANIE;
CREATE SEQUENCE SEQ_LOGOWANIE
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_LOGOWANIE
BEFORE INSERT ON LOGOWANIE
FOR EACH ROW
	BEGIN
		IF :NEW.LOG_ID IS NULL THEN
			SELECT SEQ_LOGOWANIE.NEXTVAL 
				INTO :NEW.LOG_ID FROM DUAL;
		END IF;
		--
	END;
	/

--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM LOGOWANIE
PROMPT------------------------;
PROMPT;	
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('JanKow','123456789');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('AnnaDud','uduwfef');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('KatarzynaKow','qwerty');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('EwaWat','kwiatyq12');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('AnnaMik','ana12343');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('WojciechLoch','wpjtek221');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('AndrzejLoch','andrzej345');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('MonikaKoch','Koch123');
	insert into LOGOWANIE(LOG_NAZWA,LOG_HASLO)
	values ('AdamKrzy','adam1221');
	
--
column LOG_ID HEADING 'ID' for 999
column LOG_NAZWA HEADING 'LOGIN' for A20
column LOG_HASLO HEADING 'HASLO' for A20
--
select LOG_NAZWA,LOG_HASLO from LOGOWANIE;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE UZYTKOWNIK;
PROMPT----------------------------------------;
PROMPT ; 
--
create table UZYTKOWNIK
(
UZY_ID					number(4)			NOT NULL,
UZY_IMIE				varchar2(50)   		NOT NULL,
UZY_NAZWISKO			varchar2(50)		NOT NULL,
UZY_PESEL				number(11)  		,
ADRES_ID				number(4)			,
LOG_ID					number(4)			NOT NULL
); 
--TABLESPACE UZYTKOWNIK;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;

alter table UZYTKOWNIK
add constraint CSR_PK_UZYTKOWNIK
primary key (UZY_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Unique Key;
PROMPT----------------------------------------;
PROMPT ;

alter table UZYTKOWNIK
add constraint CSR_UQ_UZYTKOWNIK 
unique (UZY_PESEL); 

PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;

alter table UZYTKOWNIK 
add constraint CSR_FK_UZYTKOWNIK_ADR
foreign key (ADRES_ID)
references ADRES (ADRES_ID);

alter table UZYTKOWNIK 
add constraint CSR_FK_UZYTKOWNIK_LOG
foreign key (LOG_ID)
references LOGOWANIE (LOG_ID);
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_UZYTKOWNIK;
CREATE SEQUENCE SEQ_UZYTKOWNIK
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_UZYTKOWNIK
BEFORE INSERT ON UZYTKOWNIK
FOR EACH ROW
	BEGIN
		IF :NEW.UZY_ID IS NULL THEN
			SELECT SEQ_UZYTKOWNIK.NEXTVAL 
				INTO :NEW.UZY_ID FROM DUAL;
		END IF;
		--
	END;
	/

--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM UZYTKOWNIK
PROMPT------------------------;
PROMPT;	
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Jan','Kowalski','20050223987',1,1);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Anna','Duda','24080845976',2,2);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Katarzyna','Kowalska','87040845816',1,3);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Ewa','Watroba',NULL,NULL,4);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Anna','Mikula',NULL,NULL,5);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Wojciech','Loch','21010125878',5,6);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Andrzej','Loch','79240124878',5,7);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Monika','Kochanowska',NULL,NULL,8);
insert into UZYTKOWNIK(UZY_IMIE,UZY_NAZWISKO,UZY_PESEL,ADRES_ID,LOG_ID)
	values ('Adam','Krzyzanowski',NULL,NULL,9);
--
column UZY_ID HEADING 'ID' for 9999
column UZY_IMIE HEADING 'IMIE' for A15
column UZY_NAZWISKO HEADING 'NAZWISKO' for A15
column UZY_PESEL HEADING 'PESEL' for 99999999999
column ADRES_ID HEADING 'ADRES_ID' for 9999
column LOG_ID HEADING 'LOGOWANIE_ID' for 9999
--
select * from UZYTKOWNIK;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE UCZEN;
PROMPT----------------------------------------;
PROMPT ; 
--
---------------------------
PROMPT   typy
---------------------------
-- TYP GLOBALNY w schemacie użtkownika - VARRAY
CREATE or REPLACE TYPE T_v_OSIANIECIA IS VARRAY(50) OF varchar2(100);
/

-- TYP GLOBALNY w schemacie użtkownika - TABLE
CREATE or REPLACE TYPE bd1_T_t_zestaw IS TABLE OF varchar2(50);
/

create table UCZEN
(
	UCZEN_ID				number(4)			NOT NULL,
	UZY_ID					number(4)			NOT NULL,
	UCZEN_OSIAG 			T_v_OSIANIECIA
);
	
--TABLESPACE UCZEN;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;

alter table UCZEN
add constraint CSR_PK_UCZEN
primary key (UCZEN_ID);

PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;

alter table UCZEN 
add constraint CSR_FK_UCZEN
foreign key (UZY_ID)
references UZYTKOWNIK (UZY_ID);

PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;	
drop sequence SEQ_UCZEN;
CREATE SEQUENCE SEQ_UCZEN
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_UCZEN
BEFORE INSERT ON UCZEN
FOR EACH ROW
	BEGIN
		IF :NEW.UCZEN_ID IS NULL THEN
			SELECT SEQ_UCZEN.NEXTVAL 
				INTO :NEW.UCZEN_ID FROM DUAL;
		END IF;
		--
	END;
	/
	
PROMPT ---------------------------;
PROMPT   DML
PROMPT ---------------------------	;
PROMPT;
INSERT INTO UCZEN (UZY_ID,UCZEN_OSIAG)
VALUES (1,T_v_OSIANIECIA('Udzial w konkursie matematycznym-III miejsce','Laureat mlodziezowego konkursu matematycznego','udzial w konkursie fizyka'));

INSERT INTO UCZEN (UZY_ID,UCZEN_OSIAG)
VALUES(2,T_v_OSIANIECIA('Udzial w konkursie J.angielskiego-','Laureat ogolnopolskiego konkursu z j.angielskiego','I miejsce w szkolnym konkursie o wiedzy kulturowej Anlglii'));

SHOW ERRORS;

--
column UZY_ID HEADING 'ID_UZYTKOWNIK' for 9999
--
select * from UCZEN;
--

--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE RODZIC;
PROMPT----------------------------------------;
PROMPT ; 
--
create table RODZIC
(
RODZIC_ID				number(4)			NOT NULL,
RODZIC_TELEFON			number(9)			,
UZY_ID					number(4)			NOT NULL
); 
--TABLESPACE RODZIC;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table RODZIC
add constraint CSR_PK_RODZIC
primary key (RODZIC_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table RODZIC 
add constraint CSR_FK_RODZIC
foreign key (UZY_ID)
references UZYTKOWNIK (UZY_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_RODZIC;
CREATE SEQUENCE SEQ_RODZIC
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_RODZIC
BEFORE INSERT ON RODZIC
FOR EACH ROW
	BEGIN
		IF :NEW.RODZIC_ID IS NULL THEN
			SELECT SEQ_RODZIC.NEXTVAL 
				INTO :NEW.RODZIC_ID FROM DUAL;
		END IF;
		--
	END;
	/	

--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM RODZIC
PROMPT------------------------;
PROMPT;	
insert into RODZIC(RODZIC_TELEFON,UZY_ID)
		values ('550937644',3);
insert into RODZIC(RODZIC_TELEFON,UZY_ID)
		values ('715632875',7);

--
column RODZIC_ID HEADING 'ID' for 9999
column RODZIC_TELEFON HEADING 'TELEFON' for 9999999999
column UZY_ID HEADING 'UZY_ID' for 9999
--
select * from RODZIC;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE UCZEN_RODZIC;
PROMPT----------------------------------------;
PROMPT ; 
--
create table UCZEN_RODZIC
(
UCZ_ROD_ID				number(4)			NOT NULL,
UCZEN_ID				number(4)			NOT NULL,
RODZIC_ID				number(4)			NOT NULL
); 
--TABLESPACE UCZEN_RODZIC;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table UCZEN_RODZIC
add constraint CSR_PK_UCZEN_RODZIC
primary key (UCZ_ROD_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table UCZEN_RODZIC
add constraint CSR_FK_UCZEN_RODZIC_UCZ
foreign key (UCZEN_ID)
references UCZEN (UCZEN_ID);
alter table UCZEN_RODZIC
add constraint CSR_FK_UCZEN_RODZIC_ROD
foreign key (RODZIC_ID)
references RODZIC (RODZIC_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_UCZEN_RODZIC;
CREATE SEQUENCE SEQ_UCZEN_RODZIC
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_UCZEN_RODZIC
BEFORE INSERT ON UCZEN_RODZIC
FOR EACH ROW
	BEGIN
		IF :NEW.UCZ_ROD_ID IS NULL THEN
			SELECT SEQ_UCZEN_RODZIC.NEXTVAL 
				INTO :NEW.UCZ_ROD_ID FROM DUAL;
		END IF;
		--
	END;
	/
--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM UCZEN_RODZIC
PROMPT------------------------;
PROMPT;	
insert into UCZEN_RODZIC(UCZEN_ID,RODZIC_ID)
		values (1,1);
insert into UCZEN_RODZIC(UCZEN_ID,RODZIC_ID)
		values (2,2);

--
column UCZ_ROD_ID HEADING 'ID' for 9999
column UCZEN_ID HEADING 'ID_UCZEN' for 9999
column RODZIC_ID HEADING 'ID_RODZIC' for 9999
--
select * from UCZEN_RODZIC;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE NAUCZYCIEL;
PROMPT----------------------------------------;
PROMPT ; 
--
create table NAUCZYCIEL
(
NAUCZ_ID				number(4)			NOT NULL,
NAUCZ_TELEFON			number(9)			,
NAUCZ_EMAIL				varchar2(30)		,
UZY_ID					number(4)			NOT NULL
); 
--TABLESPACE NAUCZYCIEL;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table NAUCZYCIEL
add constraint CSR_PK_NAUCZYCIEL
primary key (NAUCZ_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table NAUCZYCIEL
add constraint CSR_FK_NAUCZYCIEL
foreign key (UZY_ID)
references UZYTKOWNIK (UZY_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_NAUCZYCIEL;
CREATE SEQUENCE SEQ_NAUCZYCIEL
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_NAUCZYCIEL
BEFORE INSERT ON NAUCZYCIEL
FOR EACH ROW
	BEGIN
		IF :NEW.NAUCZ_ID IS NULL THEN
			SELECT SEQ_NAUCZYCIEL.NEXTVAL 
				INTO :NEW.NAUCZ_ID FROM DUAL;
		END IF;
		--
	END;
	/

--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM NAUCZYCIEL
PROMPT------------------------;
PROMPT;	
insert into NAUCZYCIEL(NAUCZ_TELEFON,NAUCZ_EMAIL,UZY_ID)
		values (505670897,'ewawatroba@email.pl',4);
insert into NAUCZYCIEL(NAUCZ_TELEFON,NAUCZ_EMAIL,UZY_ID)
		values (748658965,'annamikula@email.pl',5);

--
column NAUCZ_ID HEADING 'ID' for 9999
column NAUCZ_TELEFON HEADING 'TELEFON' for 999999999
column NAUCZ_EMAIL HEADING 'EMAIL' for A20
column UZY_ID HEADING 'ID_UZYTKOWNIK' for 9999
--
select * from NAUCZYCIEL;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 		CREATE TABLE NAUCZYCIEL_PRZEDMIOT;
PROMPT----------------------------------------;
PROMPT ; 
--
create table NAUCZYCIEL_PRZEDMIOT
(
NAUCZ_PRZED_ID				number(4)			NOT NULL,
NAUCZYCIEL_ID				number(4)			NOT NULL,
PRZEDMIOT_ID				number(4)			NOT NULL
); 
--TABLESPACE PRZEDMIOT;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table NAUCZYCIEL_PRZEDMIOT
add constraint CSR_PK_NAUCZYCIEL_PRZEDMIOT
primary key (NAUCZ_PRZED_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table NAUCZYCIEL_PRZEDMIOT
add constraint CSR_FK_NAUCZYCIEL_PZREDMIOT_NA
foreign key (NAUCZYCIEL_ID)
references NAUCZYCIEL (NAUCZ_ID);
alter table NAUCZYCIEL_PRZEDMIOT
add constraint CSR_FK_NAUCZY_PZREDM_PRZED
foreign key (PRZEDMIOT_ID)
references PRZEDMIOT (PRZEDMIOT_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_NAUCZYCIEL_PRZED;
CREATE SEQUENCE SEQ_NAUCZYCIEL_PRZED
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_NAUCZYCIEL_PRZED
BEFORE INSERT ON NAUCZYCIEL_PRZEDMIOT
FOR EACH ROW
	BEGIN
		IF :NEW.NAUCZ_PRZED_ID IS NULL THEN
			SELECT SEQ_NAUCZYCIEL_PRZED.NEXTVAL 
				INTO :NEW.NAUCZ_PRZED_ID FROM DUAL;
		END IF;
		--
	END;
	/
--
PROMPT;
PROMPT---------------------------;
PROMPT 	DBM NAUCZYCIEL_PRZEDMIOT
PROMPT---------------------------;
PROMPT;	
insert into NAUCZYCIEL_PRZEDMIOT(NAUCZYCIEL_ID,PRZEDMIOT_ID)
		values (1,1);
insert into NAUCZYCIEL_PRZEDMIOT(NAUCZYCIEL_ID,PRZEDMIOT_ID)
		values (2,2);

--
column NAUCZ_PRZED_ID HEADING 'ID' for 9999
column NAUCZYCIEL_ID HEADING 'ID_NAUCZYCIEL' for 9999
column PRZEDMIOT_ID HEADING 'ID_PRZEDMIOT' for 9999
--
select * from NAUCZYCIEL_PRZEDMIOT;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE KLASA;
PROMPT----------------------------------------;
PROMPT ; 
--
create table KLASA
(
KLASA_ID					number(4)			NOT NULL,
KLASA_NAZWA					varchar2(30)		NOT NULL
); 
--TABLESPACE KLASA;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table KLASA
add constraint CSR_PK_KLASA
primary key (KLASA_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_KLASA;
CREATE SEQUENCE SEQ_KLASA
INCREMENT BY 1 START WITH 1 MINVALUE 1;
  
PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_KLASA
BEFORE INSERT ON KLASA
FOR EACH ROW
	BEGIN
		IF :NEW.KLASA_ID IS NULL THEN
			SELECT SEQ_KLASA.NEXTVAL 
				INTO :NEW.KLASA_ID FROM DUAL;
		END IF;
		--
	END;
	/
		--

--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM KLASA
PROMPT------------------------;
PROMPT;	
insert into KLASA(KLASA_NAZWA)
		values ('6c');
insert into KLASA(KLASA_NAZWA)
		values ('3a');

--
column KLASA_ID HEADING 'ID' for 9999
column KLASA_NAZWA HEADING 'kLASA' for A20
--
select * from KLASA;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 		CREATE TABLE KLASA_PRZEDMIOT;
PROMPT----------------------------------------;
PROMPT ; 
--
create table KLASA_PRZEDMIOT
(
KL_PRZED_ID					number(4)			NOT NULL,
PRZEDMIOT_ID				number(4)			NOT NULL,
KLASA_ID					number(4)			NOT NULL
); 
--TABLESPACE KLASA_PRZEDMIOT;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table KLASA_PRZEDMIOT
add constraint CSR_PK_KLASA_PRZEDMIOT
primary key (KL_PRZED_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table KLASA_PRZEDMIOT
add constraint CSR_FK_KLASA_PZRED_PRZED
foreign key (PRZEDMIOT_ID)
references PRZEDMIOT (PRZEDMIOT_ID);
alter table KLASA_PRZEDMIOT
add constraint CSR_FK_KLASA_PZRED_KL
foreign key (KLASA_ID)
references KLASA (KLASA_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_KLASA_PRZEDMIOT;
CREATE SEQUENCE SEQ_KLASA_PRZEDMIOT
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_KLASA_PRZEDMIOT
BEFORE INSERT ON KLASA_PRZEDMIOT
FOR EACH ROW
	BEGIN
		IF :NEW.KL_PRZED_ID IS NULL THEN
			SELECT SEQ_KLASA_PRZEDMIOT.NEXTVAL 
				INTO :NEW.KL_PRZED_ID FROM DUAL;
		END IF;
		--
	END;
	/
--
PROMPT;
PROMPT----------------------------;
PROMPT 		DBM KLASA_PRZEDMIOT
PROMPT----------------------------;
PROMPT;	
insert into KLASA_PRZEDMIOT(PRZEDMIOT_ID,KLASA_ID)
		values (1,1);
insert into KLASA_PRZEDMIOT(PRZEDMIOT_ID,KLASA_ID)
		values (1,2);

--
column PRZEDMIOT_ID HEADING 'ID_PRZEDMIOT' for 9999
column KLASA_ID HEADING 'ID_KLASA' for 9999
--
select PRZEDMIOT_ID,KLASA_ID from KLASA_PRZEDMIOT;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 		CREATE TABLE UCZEN_KLASA;
PROMPT----------------------------------------;
PROMPT ; 
--
create table UCZEN_KLASA
(
UCZ_KL_ID					number(4)			NOT NULL,
UCZ_KL_ROK_SZKOLNY			varchar2(10)		NOT NULL,
KLASA_ID					number(4)			NOT NULL,
UCZEN_ID					number(4)			NOT NULL
); 
--TABLESPACE UCZEN_KLASA;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table UCZEN_KLASA
add constraint CSR_PK_UCZEN_KLASA
primary key (UCZ_KL_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table UCZEN_KLASA
add constraint CSR_FK_UCZEN_KLASA_KL
foreign key (KLASA_ID)
references KLASA (KLASA_ID);
alter table UCZEN_KLASA
add constraint CSR_FK_UCZEN_KLASA_UCZ
foreign key (UCZEN_ID)
references UCZEN (UCZEN_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_UCZEN_KLASA;
CREATE SEQUENCE SEQ_UCZEN_KLASA
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_UCZEN_KLASA
BEFORE INSERT ON UCZEN_KLASA
FOR EACH ROW
	BEGIN
		IF :NEW.UCZ_KL_ID IS NULL THEN
			SELECT SEQ_UCZEN_KLASA.NEXTVAL 
				INTO :NEW.UCZ_KL_ID FROM DUAL;
		END IF;
		--
	END;
	/

	
--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM UCZEN_KLASA
PROMPT------------------------;
PROMPT;	
insert into UCZEN_KLASA(UCZ_KL_ROK_SZKOLNY,KLASA_ID,UCZEN_ID)
		values ('2019/2020',1,1);
insert into UCZEN_KLASA(UCZ_KL_ROK_SZKOLNY,KLASA_ID,UCZEN_ID)
		values ('2019/2020',1,2);

--
column UCZ_KL_ID HEADING 'ID_PRZEDMIOT' for 9999
column UCZ_KL_ROK_SZKOLNY HEADING 'ROK SZKOLNY' for A20
column KLASA_ID HEADING 'ID_KLASA' for 9999
column UCZEN_ID HEADING 'ID_UCZEN' for 9999

--
select * from UCZEN_KLASA;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 			CREATE TABLE WYCHOWAWCA;
PROMPT----------------------------------------;
PROMPT ; 
--
create table WYCHOWAWCA
(
WYCH_ID					number(4)			NOT NULL,
NAUCZYCIEL_ID			number(4)			NOT NULL
); 
--TABLESPACE WYCHOWAWCA;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table WYCHOWAWCA
add constraint CSR_PK_WYCHOWAWCA
primary key (WYCH_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table WYCHOWAWCA 
add constraint CSR_FK_WYCHOWAWCA
foreign key (NAUCZYCIEL_ID)
references NAUCZYCIEL (NAUCZ_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;	
drop sequence SEQ_WYCHOWAWCA;
CREATE SEQUENCE SEQ_WYCHOWAWCA
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_WYCHOWAWCA
BEFORE INSERT ON WYCHOWAWCA
FOR EACH ROW
	BEGIN
		IF :NEW.WYCH_ID IS NULL THEN
			SELECT SEQ_WYCHOWAWCA.NEXTVAL 
				INTO :NEW.WYCH_ID FROM DUAL;
		END IF;
		--
	END;
	/
--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM WYCHOWAWCA
PROMPT------------------------;
PROMPT;	
insert into WYCHOWAWCA(NAUCZYCIEL_ID) values (1);
insert into WYCHOWAWCA(NAUCZYCIEL_ID) values (2);

--
column WYCH_ID HEADING 'ID' for 9999
column NAUCZYCIEL_ID HEADING 'ID_NAUCZYCIEL' for 9999


--
select * from WYCHOWAWCA;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 		CREATE TABLE WYCH_KLASA;
PROMPT----------------------------------------;
PROMPT ; 
--
create table WYCH_KLASA
(
WYCH_KLASA_ID				number(4)			NOT NULL,
WYCH_ID						number(4)			NOT NULL,
KLASA_ID					number(4)			NOT NULL
); 
--TABLESPACE WYCH_KLASA;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table WYCH_KLASA
add constraint CSR_PK_WYCH_KLASA
primary key (WYCH_KLASA_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table WYCH_KLASA
add constraint CSR_FK_WYCH_KLASA_WY
foreign key (WYCH_ID)
references WYCHOWAWCA (WYCH_ID);
alter table WYCH_KLASA
add constraint CSR_FK_WYCH_KLASA_KL
foreign key (KLASA_ID)
references KLASA (KLASA_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;	
drop sequence SEQ_WYCH_KLASA;
CREATE SEQUENCE SEQ_WYCH_KLASA
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_WYCH_KLASA
BEFORE INSERT ON WYCH_KLASA
FOR EACH ROW
	BEGIN
		IF :NEW.WYCH_KLASA_ID IS NULL THEN
			SELECT SEQ_WYCH_KLASA.NEXTVAL 
				INTO :NEW.WYCH_KLASA_ID FROM DUAL;
		END IF;
		--
	END;
	/
--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM WYCH_KLASA
PROMPT------------------------;
PROMPT;	
insert into WYCH_KLASA(WYCH_ID,KLASA_ID) 
values (1,2);
insert into WYCH_KLASA(WYCH_ID,KLASA_ID) 
values (2,1);

--
column WYCH_KLASA_ID HEADING 'ID' for 9999
column WYCH_ID HEADING 'ID_WYCHOWAWCA' for 9999
column KLASA_ID HEADING 'ID_KLASA' for 9999
--
select * from WYCH_KLASA;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT 		CREATE TABLE OCENA;
PROMPT----------------------------------------;
PROMPT ; 
--
create table OCENA
(
OCENA_ID					number(4)			NOT NULL,
OCENA_WARTOSC				varchar2(6)			NOT NULL,
OCENA_DATA					date				,
UCZEN_ID					number(4)			NOT NULL,
PRZEDMIOT_ID				number(4)			NOT NULL
); 
--TABLESPACE OCENA;
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table OCENA
add constraint CSR_PK_OCENA
primary key (OCENA_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT 				Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table OCENA
add constraint CSR_FK_OCENA_UCZ
foreign key (UCZEN_ID)
references UCZEN (UCZEN_ID);
alter table OCENA
add constraint CSR_FK_OCENA_PRZED
foreign key (PRZEDMIOT_ID)
references PRZEDMIOT (PRZEDMIOT_ID);
--
PROMPT;
PROMPT------------------------;
PROMPT 		SEQUENCE
PROMPT------------------------;
PROMPT;		
drop sequence SEQ_OCENA;
CREATE SEQUENCE SEQ_OCENA
INCREMENT BY 1 START WITH 1 MINVALUE 1;

PROMPT;
PROMPT------------------------;
PROMPT 		TRIGGER
PROMPT------------------------;
PROMPT;
CREATE OR REPLACE TRIGGER T_OCENA
BEFORE INSERT ON OCENA
FOR EACH ROW
	BEGIN
		IF :NEW.OCENA_ID IS NULL THEN
			SELECT SEQ_WYCH_KLASA.NEXTVAL 
				INTO :NEW.OCENA_ID FROM DUAL;
		END IF;
		--
	END;
	/
	--
--
PROMPT;
PROMPT------------------------;
PROMPT 		DBM OCENA
PROMPT------------------------;
PROMPT;	
insert into OCENA(OCENA_WARTOSC,OCENA_DATA,UCZEN_ID,PRZEDMIOT_ID) 
values (5,NULL,1,1);
insert into OCENA(OCENA_WARTOSC,OCENA_DATA,UCZEN_ID,PRZEDMIOT_ID) 
values (3,'2020-04-10',1,1);
insert into OCENA(OCENA_WARTOSC,OCENA_DATA,UCZEN_ID,PRZEDMIOT_ID) 
values (4,NULL,2,1);
insert into OCENA(OCENA_WARTOSC,OCENA_DATA,UCZEN_ID,PRZEDMIOT_ID) 
values (5,'2020-04-24',1,2);

--
column OCENA_ID HEADING 'ID' for 9999
column OCENA_WARTOSC HEADING 'OCENA' for 9999
column OCENA_DATA HEADING 'DATA' for A20
column UCZEN_ID HEADING 'ID_UCZEN' for 9999
column PRZEDMIOT_ID HEADING 'ID_PRZEDMIOT' for 9999

--
select * from OCENA;

--
--
PROMPT -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ##
PROMPT -- ## -- ## LAB 14    
PROMPT -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ## -- ##	

column UCZEN_OSIAG HEADING 'OSIAGNIECIA' for A50


CREATE OR REPLACE PROCEDURE update_studenta(UCZ_ID in UCZEN.UCZEN_ID%TYPE, OSIAGNIECIA in UCZEN.UCZEN_OSIAG%TYPE)
IS
BEGIN
    UPDATE UCZEN SET UCZEN_OSIAG = OSIAGNIECIA WHERE UCZEN_ID = UCZ_ID;
    IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('Brak rekordu o podanym ID');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Zaktualizowano rekord studenta');
    END IF;
END;
/
exec update_studenta(2,T_v_OSIANIECIA('Udzial w konkursie piosenki religijnej','Udzial w konkursie "muzyka to przyszlosc" -III miejsce','II miejsce w szkolnym konkursie o wiedzy kulturowej Anlglii'));

--
SELECT * FROM UCZEN;
--
create or replace procedure WYSZUKAJ_STUDENT(OSIAGNIECIE in VARCHAR2)
is

    cursor CUR_UCZ IS
		select * from UCZEN;
	wiersz CUR_UCZ%ROWTYPE;
	PRAGMA AUTONOMOUS_TRANSACTION;
	ilewierszy number;
    wartoscTrue number;
    znaleziono number;
	imie UZYTKOWNIK.UZY_IMIE%TYPE;
	nazwisko UZYTKOWNIK.UZY_NAZWISKO%TYPE;
begin
	znaleziono := 0;
	open CUR_UCZ;
	loop fetch CUR_UCZ into wiersz;
	exit when CUR_UCZ%NOTFOUND;
	if wiersz.UCZEN_ID IS NOT NULL THEN
        if wiersz.UCZEN_OSIAG IS NOT NULL THEN
        ilewierszy := wiersz.UCZEN_OSIAG.count;
        for i in 1..ilewierszy
        loop
          if wiersz.UCZEN_OSIAG(i) = OSIAGNIECIE THEN
          wartoscTrue := 1;
          znaleziono :=1;
          end if;
        end loop;
		
		SELECT UZY_IMIE INTO imie FROM UZYTKOWNIK WHERE UZY_ID = wiersz.UZY_ID;
		SELECT UZY_NAZWISKO INTO nazwisko FROM UZYTKOWNIK WHERE UZY_ID = wiersz.UZY_ID;
        if wartoscTrue = 1 THEN
        DBMS_OUTPUT.PUT_LINE('ID: '||wiersz.UCZEN_ID||' IMIE: '|| imie ||' NAZWISKO: '|| nazwisko);
        end if;
        wartoscTrue := 0;
        end if;
    end if;
    end loop;
    close CUR_UCZ;
    if znaleziono = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Nie znaleziono uczniow z podanym osiagnieciem: '||OSIAGNIECIE);
    end if;
end;
/

exec WYSZUKAJ_STUDENT('Udzial w konkursie piosenki religijnej');
--
--
SELECT * FROM UCZEN;
--
--
create or replace procedure DODAJ_UCZNIA(UZ_ID in UCZEN.UZY_ID%TYPE, OSIAGNIECIA in UCZEN.UCZEN_OSIAG%TYPE)
is
	PRAGMA AUTONOMOUS_TRANSACTION;
begin
    insert into UCZEN(UZY_ID, UCZEN_OSIAG)
    values (UZ_ID, OSIAGNIECIA);
    IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERROR- Nie dodano ucznia');
    ROLLBACK;
    END IF;
    commit;
end;
/



exec DODAJ_UCZNIA(3,T_v_OSIANIECIA('Udzial w konkursie malarskim','Udzial w konkursie "projektuj z nami" -I miejsce','III miejsce w szkolnym konkursie o wiedzy kulturowej Anlglii'));
SELECT * FROM UCZEN;