create database autorentNadvornoi

use autorentNadvornoi;


CREATE TABLE mark(
markID int not null Primary key IDENTITY(1,1),
autoMark varchar(30) UNIQUE
);

INSERT INTO mark(autoMark)
VALUES ('Ziguli');
INSERT INTO mark(autoMark)
VALUES ('Lambordzini');
INSERT INTO mark(autoMark)
VALUES ('BMW');
SELECT * FROM mark;


CREATE TABLE kaigukast(
kaigukastID int not null Primary key IDENTITY(1,1),
kaigukast varchar(30) UNIQUE
);
INSERT INTO kaigukast(kaigukast)
VALUES ('Automaat');
INSERT INTO kaigukast(kaigukast)
VALUES ('Manual');
SELECT * FROM kaigukast;


CREATE TABLE auto(
autoID int not null Primary key IDENTITY(1,1),
regNumber char(6) UNIQUE,
markID int,
varv varchar(20),
v_aasta int,
kaigukastID int,
km decimal(6,2)
);
SELECT * FROM auto

ALTER TABLE auto
ADD FOREIGN KEY (markID) REFERENCES mark(markID);
ALTER TABLE auto
ADD FOREIGN KEY (kaigukastID) REFERENCES kaigukast(kaigukastID);


Insert into auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
values(146472, 3, 'valge', 2007, 1, 1237);
Insert into auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
values(398667, 1, 'must', 2010, 1, 556);
Insert into auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
values(297115, 3, 'must', 1994, 2, 5879);


CREATE TABLE klient(
klientID int not null Primary key IDENTITY(1,1),
klientNimi varchar(50),
telefon varchar(20),
aadress varchar(50),
soduKogemis varchar(30),
);

insert into klient(klientNimi, telefon, aadress, soduKogemis)
values('Anton Ivanov', '+372 56823907', 'Linnu tee 15', '4 aasta');
insert into klient(klientNimi, telefon, aadress, soduKogemis)
values('Anna Ontsik', '+372 23890624', 'Ümera 16', '2 aasta');
insert into klient(klientNimi, telefon, aadress, soduKogemis)
values('Dmitrij Volvo', '+372 508644', 'Peterburu tee 29', '12 aasta');




create table amet(
ametID int not null Primary key IDENTITY(1,1),
amet_aadress varchar(50),
autode_arv int,
);



create table tootaja(
tootajaID int not null Primary key IDENTITY(1,1),
tootajaNimi varchar(50),
ametID int foreign key 
references amet(ametID)
);


create table rendiLeping(
lepingID int not null Primary key IDENTITY(1,1),
rendiAlgus date,
rendiLopp date,
klientID int foreign key 
references klient(klientID),
regNumber char(6) foreign key 
references auto(regNumber),
rendiKestvus int,
hindKokku decimal(5,2),
tootajaId int foreign key 
references tootaja(tootajaID)
);





