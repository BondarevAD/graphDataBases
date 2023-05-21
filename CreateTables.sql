USE master

DROP DATABASE IF EXISTS GraphDB
CREATE DATABASE GraphDB
USE GraphDB

CREATE TABLE Classmates (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
) AS NODE;


CREATE TABLE Disciplines (
    id INT PRIMARY KEY,
    title VARCHAR(50),
    teacher VARCHAR(50)
)AS NODE;

CREATE TABLE Books (
    id INT PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50)
)AS NODE;

CREATE TABLE Movies (
    id INT PRIMARY KEY,
    title VARCHAR(50),
    director VARCHAR(50)
)AS NODE;

CREATE TABLE Cities (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
)AS NODE;


CREATE TABLE Be_Friends AS EDGE;
CREATE TABLE Living AS EDGE;
CREATE TABLE Writes_off_homework AS EDGE;
CREATE TABLE Reccomend_movie AS EDGE;
CREATE TABLE Recommend_book AS EDGE;

--Заполнение узлов и ребер:

INSERT INTO Classmates (id, name, age) VALUES
(1, 'Ivan', 20),
(2, 'Alexey', 19),
(3, 'Elena', 21),
(4, 'Maria', 20),
(5, 'Dmitry', 19),
(6, 'Anna', 20),
(7, 'Alexandra', 21),
(8, 'Peter', 19),
(9, 'Natalia', 20),
(10, 'Andrew', 19);




-- Заполнение таблицы "Учебные дисциплины"
INSERT INTO Disciplines (id, title, teacher) VALUES
(1, 'Mathematics', 'Ivanov'),
(2, 'Physics', 'Petrov'),
(3, 'History', 'Sidorova'),
(4, 'Chemistry', 'Kozlov'),
(5, 'Literature', 'Smirnova'),
(6, 'Biology', 'Nikolaev'),
(7, 'Economics', 'Korolev'),
(8, 'Geography', 'Fedorov'),
(9, 'Foreign Language', 'Antonova'),
(10, 'Informatics', 'Sokolov');

-- Заполнение таблицы "Книги"

INSERT INTO Books (id, title, author) VALUES
(1, 'War and Peace', 'Leo Tolstoy'),
(2, 'Crime and Punishment', 'Fyodor Dostoevsky'),
(3, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling'),
(4, '1984', 'George Orwell'),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald'),
(6, 'Murder on the Orient Express', 'Agatha Christie'),
(7, 'Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling'),
(8, 'The Master and Margarita', 'Mikhail Bulgakov'),
(9, 'Three Comrades', 'Erich Maria Remarque'),
(10, 'Brave New World', 'Aldous Huxley');

-- Заполнение таблицы "Фильмы"
INSERT INTO Movies (id, title, director) VALUES
(1, 'The Green Mile', 'Frank Darabont'),
(2, 'Interstellar', 'Christopher Nolan'),
(3, 'The Lord of the Rings: The Return of the King', 'Peter Jackson'),
(4, 'The Matrix', 'The Wachowskis'),
(5, 'Fight Club', 'David Fincher'),
(6, 'A Clockwork Orange', 'Stanley Kubrick'),
(7, 'Braveheart', 'Mel Gibson'),
(8, 'Star Wars: Episode V - The Empire Strikes Back', 'Irvin Kershner'),
(9, 'A Beautiful Mind', 'Ron Howard'),
(10, 'Titanic', 'James Cameron');

-- Заполнение таблицы "Города"
INSERT INTO Cities (id, name, country) VALUES
(1, 'Moscow', 'Russia'),
(2, 'New York', 'USA'),
(3, 'Paris', 'France'),
(4, 'Tokyo', 'Japan'),
(5, 'London', 'United Kingdom'),
(6, 'Berlin', 'Germany'),
(7, 'Rome', 'Italy'),
(8, 'Sydney', 'Australia'),
(9, 'Cairo', 'Egypt'),
(10, 'San Francisco', 'USA');
-- Заполнение таблицы "Be_Friends"
INSERT INTO Be_Friends ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Classmates WHERE id = 5)),
       ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Classmates WHERE id = 4)),
       ((SELECT $node_id FROM Classmates WHERE id = 2),(SELECT $node_id FROM Classmates WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 3),(SELECT $node_id FROM Classmates WHERE id = 9)),
       ((SELECT $node_id FROM Classmates WHERE id = 4),(SELECT $node_id FROM Classmates WHERE id = 6)),
       ((SELECT $node_id FROM Classmates WHERE id = 6),(SELECT $node_id FROM Classmates WHERE id = 2)),
       ((SELECT $node_id FROM Classmates WHERE id = 7),(SELECT $node_id FROM Classmates WHERE id = 8)),
       ((SELECT $node_id FROM Classmates WHERE id = 8),(SELECT $node_id FROM Classmates WHERE id = 10)),
    ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Classmates WHERE id = 7)),
       ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Classmates WHERE id = 8)),
       ((SELECT $node_id FROM Classmates WHERE id = 2),(SELECT $node_id FROM Classmates WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 5),(SELECT $node_id FROM Classmates WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 7),(SELECT $node_id FROM Classmates WHERE id = 9)),
       ((SELECT $node_id FROM Classmates WHERE id = 8),(SELECT $node_id FROM Classmates WHERE id = 3));

-- Заполнение таблицы "Living"
INSERT INTO Living ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Cities WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 2),(SELECT $node_id FROM Cities WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 3),(SELECT $node_id FROM Cities WHERE id = 9)),
       ((SELECT $node_id FROM Classmates WHERE id = 4),(SELECT $node_id FROM Cities WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 5),(SELECT $node_id FROM Cities WHERE id = 8)),
       ((SELECT $node_id FROM Classmates WHERE id = 6),(SELECT $node_id FROM Cities WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 7),(SELECT $node_id FROM Cities WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 8),(SELECT $node_id FROM Cities WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 9),(SELECT $node_id FROM Cities WHERE id = 8)),
       ((SELECT $node_id FROM Classmates WHERE id = 10),(SELECT $node_id FROM Cities WHERE id = 6));

-- Заполнение таблицы "Writes_off_homework"
INSERT INTO Writes_off_homework ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Disciplines WHERE id = 4)),
       ((SELECT $node_id FROM Classmates WHERE id = 2), (SELECT $node_id FROM Disciplines WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 3),(SELECT $node_id FROM Disciplines WHERE id = 6)),
       ((SELECT $node_id FROM Classmates WHERE id = 4),(SELECT $node_id FROM Disciplines WHERE id = 8)),
       ((SELECT $node_id FROM Classmates WHERE id = 5),(SELECT $node_id FROM Disciplines WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 6), (SELECT $node_id FROM Disciplines WHERE id = 5)),
       ((SELECT $node_id FROM Classmates WHERE id = 7),(SELECT $node_id FROM Disciplines WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 8),(SELECT $node_id FROM Disciplines WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 9), (SELECT $node_id FROM Disciplines WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 10),(SELECT $node_id FROM Disciplines WHERE id = 8));
       -- Заполнение таблицы "Reccomend_movie"
INSERT INTO Reccomend_movie ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Movies WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 2),(SELECT $node_id FROM Movies WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 3), (SELECT $node_id FROM Movies WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 4),(SELECT $node_id FROM Movies WHERE id = 7)),
       ((SELECT $node_id FROM Classmates WHERE id = 5),(SELECT $node_id FROM Movies WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 6),(SELECT $node_id FROM Movies WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 7),(SELECT $node_id FROM Movies WHERE id = 5)),
       ((SELECT $node_id FROM Classmates WHERE id = 8), (SELECT $node_id FROM Movies WHERE id = 7)),
       ((SELECT $node_id FROM Classmates WHERE id = 9),(SELECT $node_id FROM Movies WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 10),(SELECT $node_id FROM Movies WHERE id = 8));

    -- Заполнение таблицы "Recommend_book"
INSERT INTO Recommend_book ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Classmates WHERE id = 1),(SELECT $node_id FROM Books WHERE id = 8)),
       ((SELECT $node_id FROM Classmates WHERE id = 2), (SELECT $node_id FROM Books WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 3), (SELECT $node_id FROM Books WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 4),(SELECT $node_id FROM Books WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 5), (SELECT $node_id FROM Books WHERE id = 3)),
       ((SELECT $node_id FROM Classmates WHERE id = 6),(SELECT $node_id FROM Books WHERE id = 1)),
       ((SELECT $node_id FROM Classmates WHERE id = 7),(SELECT $node_id FROM Books WHERE id = 10)),
       ((SELECT $node_id FROM Classmates WHERE id = 8), (SELECT $node_id FROM Books WHERE id = 5)),
       ((SELECT $node_id FROM Classmates WHERE id = 9),(SELECT $node_id FROM Books WHERE id = 6)),
       ((SELECT $node_id FROM Classmates WHERE id = 10),(SELECT $node_id FROM Books WHERE id = 6));





    SELECT Person1.name, Person2.name AS [friend name]
FROM Classmates AS Person1, Be_Friends, Classmates AS Person2
WHERE MATCH(Person1-(Be_Friends)->Person2)
    AND Person1.name = 'Ivan';


  SELECT Person1.name, Disciplines.title AS [discipline title]
FROM Classmates AS Person1, Writes_off_homework, Disciplines
WHERE MATCH(Person1-(Writes_off_homework)->Disciplines)
    AND Person1.name = 'Peter';


  SELECT Person1.name, Movies.title AS [recommended movie title]
FROM Classmates AS Person1, Reccomend_movie, Movies
WHERE MATCH(Person1-(Reccomend_movie)->Movies)
    AND Person1.name = 'Andrew';

  SELECT Person1.name, Books.title AS [recommended book title]
FROM Classmates AS Person1, Recommend_book, Books
WHERE MATCH(Person1-(Recommend_book)->Books)
    AND Person1.name = 'Natalia';

  SELECT Person1.name, Cities.name AS [living in]
FROM Classmates AS Person1, Living, Cities
WHERE MATCH(Person1-(Living)->Cities)
    AND Person1.name = 'Maria';

SELECT Person1.name AS PersonName
 , STRING_AGG(Person2.name, '->') WITHIN GROUP (GRAPH PATH) AS
Friends
FROM Classmates AS Person1
 , Be_Friends FOR PATH AS fo
 , Classmates FOR PATH AS Person2
WHERE MATCH(SHORTEST_PATH(Person1(-(fo)->Person2)+))
 AND Person1.name = N'Anna';


SELECT Person1.name AS PersonName
 , STRING_AGG(Person2.name, '->') WITHIN GROUP (GRAPH PATH)
AS Friends
FROM Classmates AS Person1
 , Be_Friends FOR PATH AS fo
 , Classmates FOR PATH AS Person2
WHERE MATCH(SHORTEST_PATH(Person1(-(fo)->Person2){1,2}))
 AND Person1.name = N'Alexey';

 --Визуализация Force-Directed Graph.

USE Classmate;

SELECT @@SERVERNAME
--первый запрос для графа
 --кто от кого заразился
 SELECT Classmates1.id IdFirst
    , Classmates1.name AS First
    , CONCAT(N'Classmates', Classmates1.id) AS [First image name]
    , Classmates2.id IdSecond
    , Classmates2.name AS Second
    , CONCAT(N'Classmates', Classmates2.id) AS [Second image name]
FROM Classmates AS Classmates1
  , Be_Friends
   , Classmates AS Classmates2
WHERE MATCH(Classmates1-(Be_Friends)->Classmates2) 

-- второй запрос 
-- кто где проживает

SELECT Classmates.id IdClassmates
    , Classmates.name AS Classmates
    , CONCAT(N'Classmates', Classmates.id) AS [Classmates image name]
    , Cities.id IdCities
    , Cities.name AS Cities
    , CONCAT(N'Cities', Cities.id) AS [City image name]
FROM Classmates
  , Living
  , Cities
WHERE MATCH(Classmates-(Living)->Cities) 


--третий запрос
--какая больница в каком городе находится

SELECT Classmates.id IdClassmates
    , Classmates.name AS Classmates
    , CONCAT(N'Classmates', Classmates.id) AS [Classmates image name]
    , Disciplines.id IdDisciplines
    , Disciplines.title AS Disciplines
    , CONCAT(N'Disciplines', Disciplines.id) AS [Disciplines image name]
FROM Classmates
  , Writes_off_homework
  , Disciplines
WHERE MATCH(Classmates-(Writes_off_homework)->Disciplines) 

--четвертый запрос
--кто в какой больнице лечился и как ее оценил

SELECT Classmates.id IdClassmates
    , Classmates.name AS Classmates
    , CONCAT(N'Classmates', Classmates.id) AS [Classmates image name]
    , Movies.id IdMovies
    , Movies.title AS Movies
    , CONCAT(N'Movies', Movies.id) AS [Movies image name]
FROM Classmates
  , Reccomend_movie
  , Movies
WHERE MATCH(Classmates-(Reccomend_movie)->Movies) 


SELECT Classmates.id IdClassmates
    , Classmates.name AS Classmates
    , CONCAT(N'Classmates', Classmates.id) AS [Classmates image name]
    , Books.id IdBooks
    , Books.title AS Books
    , CONCAT(N'Books', Books.id) AS [Books image name]
FROM Classmates
  , Recommend_book
  , Books
WHERE MATCH(Classmates-(Recommend_book)->Books)






 