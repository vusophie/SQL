/*
Question:
Think about your favorite apps, and pick one that stores your data- like a game that stores scores, an app that lets you post updates, etc. Now in this project, you're going to imagine that the app stores your data in a SQL database (which is pretty likely!), and write SQL statements that might look like their own SQL.
*/

/*Users table*/
CREATE table users (id INTEGER PRIMARY KEY, username TEXT NOT NULL UNIQUE);

/*Followers table*/
CREATE table followers (followed_id INTEGER REFERENCES users(id), follower_id INTEGER REFERENCES users(id), PRIMARY KEY(followed_id, follower_id));

/*Creating 3 users*/
INSERT INTO users VALUES (1, "elonmusk");
INSERT INTO users VALUES (2, "Wendys");
INSERT INTO users VALUES (3, "cnnbrk");

/*elonmusk follows cnnbrk and Wendys*/
INSERT INTO followers VALUES (2, 1);
INSERT INTO followers VALUES (3, 1);

/*cnnbrk follows Wendys*/
INSERT INTO followers VALUES (2, 3);

/*0 users follow elonmusk*/
SELECT u.* FROM users u JOIN followers f ON (f.follower_id = u.id) WHERE followed_id = 1;

/*2 users follow Wendys*/
SELECT u.* FROM users u JOIN followers f ON (f.follower_id = u.id) WHERE followed_id = 2;

/*3 users follow cnnbrk*/
SELECT u.* FROM users u JOIN followers f ON (f.follower_id = u.id) WHERE followed_id = 3;

/*elonmusk and cnnbreak share 1 followed user*/
SELECT u.* FROM users u JOIN followers f ON (f.followed_id = u.id) WHERE follower_id = 1 
INTERSECT
SELECT u.* FROM users u JOIN followers f ON (f.followed_id = u.id) WHERE follower_id = 3;

/*1 user follows cnnbrk but is not followed back by cnnbrk*/
SELECT u.* FROM users u JOIN followers f ON (f.follower_id = u.id) WHERE followed_id = 3
EXCEPT
SELECT u.* FROM users u JOIN followers f ON (f.follower_id = u.id) WHERE followed_id = 3;



