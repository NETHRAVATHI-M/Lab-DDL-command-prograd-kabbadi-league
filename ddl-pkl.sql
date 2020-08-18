-- PROGRESSION - 1


-- 1. **Create table city**

-- 2. **Create table referee**

-- 3. **Create table innings**

-- 4. **Create table extra_type**

-- 5. **Create table skill**

-- 6. **Create table team**

-- 7. **Create table player**

-- 8. **Create table venue**

-- 9. **Create table event**
-- 10. **Create table extra_event**

-- 11. **Create table outcome**

-- 12. **Create table game**

-- 13. **Drop table city**

-- 14. **Drop table innings**

-- 15. **Drop table skill**

-- 16. **Drop table extra_type**


DROP TABLE CITY;
DROP TABLE REFEREE;
CREATE TABLE CITY(ID INT,
NAME VARCHAR(50),
CONSTRAINT  CITY_PK PRIMARY KEY(ID));

CREATE TABLE INNINGS(ID INT,INNINGS_NUMBER INT,
CONSTRAINT INNINGS_PK PRIMARY KEY(ID));
CREATE TABLE EXTRA_TYPE(ID INT,
NAME VARCHAR(50),
CONSTRAINT  EXTRACITY_PK PRIMARY KEY(ID));

CREATE TABLE SKILL(ID INT,
NAME VARCHAR(50),
CONSTRAINT  SKILL_PK PRIMARY KEY(ID));

CREATE TABLE TEAM(
ID INT,
NAME VARCHAR(50),
COACH VARCHAR(50),
HOME_CITY INT,
CAPTAIN INT,
CONSTRAINT  TEAM_PK PRIMARY KEY(ID),
CONSTRAINT TEAM_ FOREIGN KEY(HOME_CITY) REFERENCES CITY(ID));


CREATE TABLE PLAYER(ID INT,NAME VARCHAR(50),
COUNTRY VARCHAR(50),SKILL_ID INT,
TEAM_ID INT,
CONSTRAINT PLAYER_PK PRIMARY KEY(ID),
CONSTRAINT PLAYER_FK FOREIGN KEY(SKILL_ID) REFERENCES SKILL(ID),
CONSTRAINT PLAYER_FK1 FOREIGN KEY(TEAM_ID) REFERENCES TEAM(ID));


Create table Venue
(
id INT,
stadium_name VARCHAR(50),
city_id INT,
CONSTRAINT Venue_PK PRIMARY KEY(ID),
CONSTRAINT Venue_FK FOREIGN KEY(city_id) REFERENCES City(id)
);

Create table Event
(
id INT,
innings_id INT,
event_no INT,
raider_id INT,
raid_points INT,
defending_points INT,
clock_in_seconds INT,
team_one_scoreINT,
team_two_scoreINT,
CONSTRAINT Event_PK PRIMARY KEY(ID),
CONSTRAINT Event_FK FOREIGN KEY(innings_id ,raider_id )REFERENCES City(id)
);

Create table Event
(
id1 INT  PRIMARY KEY,
innings_id INT NOT NULL,
event_no INT NOT NULL,
raider_id INT NOT NULL,
raid_points INT NOT NULL,
defending_points INT NOT NULL,
clock_in_seconds INT NOT NULL,
team_one_score INT NOT NULL,
team_two_score INT NOT NULL,

CONSTRAINT Event_FK FOREIGN KEY(innings_id) REFERENCES Innings(Id),
CONSTRAINT Event_FK1 FOREIGN KEY(raider_id) REFERENCES Player(ID)
);


Create table Extra_event
(
ID INT,
event_id INT NOT NULL,
extra_type_id INT NOT NULL,
points INT NOT NULL,
scoring_team_id INT NOT NULL,
CONSTRAINT Extra_event_PK PRIMARY KEY(ID),
CONSTRAINT Extra_event_FK FOREIGN KEY(event_id)REFERENCES Event(ID1),
CONSTRAINT Extra_event_FK1 FOREIGN KEY(extra_type_id)REFERENCES Extra_type(ID),
CONSTRAINT Extra_event_FK2 FOREIGN KEY(scoring_team_id)REFERENCES Team(ID)
);

Create table Outcome
(
id INT,
status VARCHAR(100) NOT NULL,
winner_team_id INT NULL,
score INT NULL,
player_of_match INT NULL,
CONSTRAINT Outcome_PK PRIMARY KEY(id),
CONSTRAINT Outcome_FK FOREIGN KEY(winner_team_id)REFERENCES Team(id),
CONSTRAINT Outcome_FK1 FOREIGN KEY(player_of_match )REFERENCES Player(id)
);

Create table Game
(
id INT,
game_date DATE NOT NULL,
team_id_1 INT NOT NULL,
team_id_2 INT NOT NULL,
venue_id INT NOT NULL,
outcome_id INT NOT NULL,
referee_id_1 INT NOT NULL,
referee_id_2 INT NOT NULL,
first_innings_id INT NOT NULL,
second_innings_id INT NOT NULL,
CONSTRAINT Game_PK PRIMARY KEY(id),
CONSTRAINT Game_FK FOREIGN KEY(team_id_1)REFERENCES TEAM(id),
CONSTRAINT Game_FK1 FOREIGN KEY(team_id_2)REFERENCES TEAM(id),
CONSTRAINT Game_FK2 FOREIGN KEY(venue_id)REFERENCES VENUE(id),
CONSTRAINT Game_FK3 FOREIGN KEY(outcome_id)REFERENCES Outcome(id),
CONSTRAINT Game_FK4 FOREIGN KEY(referee_id_1) REFERENCES Referee(ID),
CONSTRAINT Game_FK5 FOREIGN KEY(referee_id_2) REFERENCES Referee(ID),
CONSTRAINT Game_FK6 FOREIGN KEY(first_innings_id) REFERENCES Innings(Id),
CONSTRAINT Game_FK7 FOREIGN KEY(second_innings_id) REFERENCES Innings(Id)
);DROP TABLE GAME;


CREATE TABLE REFEREE(ID INT,
NAME VARCHAR(50),
CONSTRAINT  REFEREE_PK PRIMARY KEY(ID));
DROP TABLE VENUE;
DROP TABLE REFEREE;
DROP TABLE OUTCOME;
DROP TABLE EXTRA_EVENT;
DROP TABLE EXTRA_TYPE;
DROP TABLE EVENT;
DROP TABLE PLAYER;
DROP TABLE SKILL;
DROP TABLE INNINGS;
DROP TABLE GAME;
