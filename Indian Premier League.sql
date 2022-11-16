--Create a table named ‘matches’ with appropriate data types for columns

create table matches(
id int,
city varchar(20),
date date,
player_of_match varchar(20), 
venue varchar(60),
neutral_venue int,
team1 varchar(50),
team2 varchar(50),
toss_winner varchar(100),
toss_decision varchar(50),
winner varchar(50),
result varchar(10),
result_margin int,
elimonator varchar(10),
method varchar(10),
umpire1 varchar(30),
umpire2 varchar(30)
);

--Create a table named ‘deliveries’ with appropriate data types for columns

create table deliveries(
id	int,
inning int,
over int,
ball int,
batsman	varchar(30),
non_striker	varchar(30),
bowler	varchar(30),
batsman_runs int,
extra_runs int,
total_runs int,
is_wicket int,
dismissal_kind varchar(10),
player_dismissed varchar(50),
fielder	varchar(50),
extras_type varchar(30),
batting_team  varchar(30),
bowling_team  varchar(30)
);

--Import data from CSV file ’IPL_matches.csv’ attached in resources to ‘matches’
copy matches from 'C:\Program Files\PostgreSQL\15\data\data_copy\IPL_matches.csv' delimiter ',' csv header;

--Import data from CSV file ’IPL_Ball.csv’ attached in resources to ‘deliveries’
copy deliveries from 'C:\Program Files\PostgreSQL\15\data\data_copy\IPL_Ball.csv' delimiter ',' csv header;

--Select the top 20 rows of the deliveries table.
select * from matches limit 20;

--Select the top 20 rows of the matches table.
select * from deliveries limit 20;

--Fetch data of all the matches played on 2nd May 2013.
select * from matches where _date='02-05-2013';

--Fetch data of all the matches where the margin of victory is more than 100 runs.
select * from matches where result_margin > 100;

--Fetch data of all the matches where the final scores of both teams tied and order it in descending order of the date.
select * from matches where result='tie' order by _date desc;

--Get the count of cities that have hosted an IPL match.
select count(distinct city) from matches;
