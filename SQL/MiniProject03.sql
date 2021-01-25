-- Creating videos table:
CREATE TABLE videos (id serial primary key unique, 
title VARCHAR(255) NOT NULL, 
length_min VARCHAR(255) NOT NULL,
url VARCHAR(255)unique not null);
select * from videos;

---inserting informations to table videos:
insert into videos(title,length_min,url)
values ('Lo Vas A Olvidar','4','https://www.youtube.com/watch?v=8TsWkuWWXgc');
select * from videos;

insert into videos(title,length_min,url)
values ('drivers license','4','https://www.youtube.com/watch?v=ZmDBbnmKpqQ');
select * from videos;

insert into videos(title,length_min,url)
values ('Save Your Tears','4.08','https://www.youtube.com/watch?v=XXYlFuWEuKI');
select * from videos;

update videos
set length_min = '4.07'
where title like 'drivers license';
select*from videos;

update videos
set length_min = '3.53'
where title like 'Lo Vas A Olvidar';
select*from videos;

----------- Reviews table:
CREATE TABLE reviewers (id INT REFERENCES Reviewers primary key, 
name VARCHAR(255) NOT NULL, 
rating VARCHAR(255),
comment VARCHAR(255) not null);
select * from reviewers;

CREATE TABLE reviewers (review_id int primary key,
id INT REFERENCES videos,						
name VARCHAR(255) NOT NULL, 
rating VARCHAR(255),
comment VARCHAR(255) not null);
select * from reviewers;

--inserting information to reivewers table:
Insert  into reviewers(review_id,id,name,rating,comment)
values (1,1,'Elizabeth', 3, ‘Very low sound');

Insert  into reviewers(review_id,id,name,rating,comment)
values (2,2,'Charlos', 5, 'very sad song');

Insert  into reviewers(review_id,id,name,rating,comment)
values (3,3,'BobRoss', 4, 'very amusing song');

Insert  into reviewers(review_id,id,name,rating,comment)
values (4,1,'Ross', 4, 'very surprising voice');

Insert  into reviewers(review_id,id,name,rating,comment)
values (5,2,’Kayne', 2, 'very weird song');

Insert  into reviewers(review_id,id,name,rating,comment)
values (6,3,'Jose', 5, 'very beautiful song unlike the singer');
select* from reviewers;

-- adding both tables together. 
Full outer join:
Select * from reviewers
full outer join videos on videos.id= reviewers.id
order by reviewers.id;

--Innerjoin: reviewers name who rated  '5'.
select name, rating from reviewers
inner join videos on reviewers.id= videos.id
where rating in ('5');

--data of both tables which rating is less than 4.
select* from videos
full outer join reviewers 
on reviewers.id = videos.id
where not rating >= '4';




