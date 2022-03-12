CREATE TABLE dbo.[User] (
	id INT IDENTITY(1,1) PRIMARY KEY
	, UserName  VARCHAR(16)
	, [Password] VARCHAR(16)
	)

GO

CREATE TABLE dbo.Article (
	id INT IDENTITY(1,1) PRIMARY KEY
	, [Name] VARCHAR(128)
	, Price MONEY
	)
