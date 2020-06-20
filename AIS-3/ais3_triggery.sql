CREATE TABLE InsertHistory
( 
	ID            integer  IDENTITY PRIMARY KEY ,
  ID_Table       integer  NOT NULL ,
	operation     varchar(788)  NOT NULL ,
	CreateAt      DATETIME NOT NULL DEFAULT GETDATE(),
)
go

CREATE TRIGGER Tables_INSERT
ON Country
AFTER INSERT
AS
INSERT INTO InsertHistory (ID_Table, operation)
SELECT ID_Country, 'Добавлено в таблицу: ' + name
FROM INSERTED

INSERT INTO Country(ID_Country, Name)
VALUES (1, 'Russia')
INSERT INTO Country(ID_Country, Name)
VALUES (2, 'Spain')

SELECT *
FROM InsertHistory