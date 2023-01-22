CREATE TABLE Visitors(
                         id serial primary key ,
                         first_name varchar(20) NOT NULL,
                         last_name varchar(20),
                         birth_date varchar(20),
                         person_gender varchar(20),
                         phone_number varchar(20) NOT NULL
);

CREATE TABLE Section_type(
                             id serial primary key,
                             section_name varchar(30)
);

CREATE TABLE Coaches(
                        id serial primary key,
                        coach_name varchar(30),
                        person_gender varchar(20),
                        type_of_sports_section integer
);

alter table Coaches add foreign key (type_of_sports_section) references Section_type(id);

CREATE TABLE Visits(
                       id serial primary key ,
                       visitor_id integer,
                       time_visit timestamp,
                       coach_id integer
);

alter table Visits add foreign key (visitor_id) references Visitors (id);
alter table Visits add foreign key (coach_id) references Coaches(id);

insert into Visitors (id, first_name, last_name, birth_date, person_gender, phone_number)
VALUES (1, 'Lev', 'Yashin', '12.05.1935', 'man', '0701 090909'),
       (2, 'Andrey', 'Arshavin' , '20.04.1988', 'man', '0701 010101'),
       (3, 'Alex', 'Putelyas' , '29.03.1988', 'woman', '0701 020202');

insert into Section_type(id, section_name)
VALUES (1, 'Football'),
       (2, 'Box'),
       (3, 'Basketball');

insert into Coaches(id, coach_name, person_gender, type_of_sports_section)
values (1, 'Misha', 'man',1),
       (2, 'Masha', 'woman',2),
       (3, 'Sasha', 'man',3);

insert into Visits(id, visitor_id,time_visit,coach_id)
values (1,1,'2023-01-18 20:20:44',1),
       (2,2,'2019-01-18 19:41:24',2),
       (3,3,'2023-05-18 20:20:44',3);