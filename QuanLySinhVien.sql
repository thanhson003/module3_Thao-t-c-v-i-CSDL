create database `QuanLySinhVien`;
use QuanLySinhVien;
create table Class(
ClassID int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
Status bit
);


create table Student(
StudentID int not null auto_increment primary key,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassID int not null,
foreign key(ClassID) references Class(ClassID)
);

create table Subject(
SubID int not null auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint not null default 1 check(Credit >=1),
Status bit default 1
);

create table Mark(
MarkID int not null auto_increment primary key,
SubID int not null ,
StudentID int not null ,
Mark float default 0 check(Mark between 0 and 100),
ExamTimes tinyint default 1,
foreign key(SubID) references Subject(SubID),
foreign key(StudentID) references Student(StudentID)
);

-- bài 3: Thao tác với CSDL--
insert into Class(ClassName,StartDate,Status)
values('A1','2008-12-20',1),
      ('A2','2008-12-22',1),
      ('B3',now(),0);

insert into Student(StudentName,Address,Phone,Status,ClassID)
values('Hung','Ha Noi','0912113113',1,1),
		('Hoa','Hai Phong',null,1,1),
        ('Manh','HCM','0123123123',0,2);
        
insert into Subject(SubName,Credit,Status)
values  ('CF',5,1),
		('C',6,1),
        ('HDJ',5,1),
        ('RDBMS',10,1);

insert into Mark(SubID,StudentID,Mark,ExamTimes)
values  (1,1,8,1),
		(1,2,10,2),
        (2,1,12,1);

SELECT * FROM Student;
SELECT *
FROM Student
WHERE Status = true;
SELECT *
FROM Subject
WHERE Credit < 10;
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';
