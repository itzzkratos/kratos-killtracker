# Script Install

- Drag and drop the script kratos-killtracker into your resources
- Ensure the resoure in your server.cfg "ensure kratos-killtracker"
- Import the SQL table into your database

# SQL Table: 

CREATE TABLE `player_kills` (
	`discord` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`kills` INT(11) NULL DEFAULT '0',
	PRIMARY KEY (`discord`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

If you have a issue or need any support with this script, head over to our Discord - https://discord.gg/6tVWHXDWS7