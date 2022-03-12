--Checks if the the user/password combination exits
CREATE PROCEDURE dbo.CheckUser
	@inUserName VARCHAR(16)
	, @inPassword VARCHAR(16)
	, @outStatus INT OUTPUT
	, @outResult INT OUTPUT
AS

BEGIN
	SET NOCOUNT ON;

	SET @outResult=0;

	IF EXISTS (SELECT U.UserName
		, U.[Password]
		FROM dbo.[User] U
		WHERE U.UserName = @inUserName
		AND U.[Password] = @inPassword)
	SET @OutStatus = 1;
	ELSE 
	SET @OutStatus = 0;

	SET NOCOUNT OFF;
END;

GO

--Inserts article
CREATE PROCEDURE dbo.InsertArticle
	@inName VARCHAR(16)
	, @inPrice MONEY
	, @outResult INT OUTPUT
AS

BEGIN
	SET NOCOUNT ON;
	
	SET @outResult = 0;

	IF EXISTS(
		SELECT 1 FROM dbo.Article A 
		WHERE A.[Name]=@inName
	)
	BEGIN
		SET @outResult = 50001;
		RETURN;
	END;

	INSERT INTO dbo.Article (
		[Name]
		, Price 
	)
	VALUES (
		@inName
		, @inPrice
	);

	SET NOCOUNT OFF;
END;

GO

--Consult by article name
CREATE PROCEDURE dbo.FilterByName
	@inName VARCHAR(128)
	, @outResult INT OUTPUT
AS 
BEGIN
	SET NOCOUNT ON;

	SET @outResult = 0;
	
	SELECT A.[Name]
		, A.Price
	FROM dbo.Article A
	WHERE A.[Name] LIKE '%'+@inName+'%'
	ORDER BY A.[Name]

	SET NOCOUNT OFF;
END;

GO

--Filter top @Amount
CREATE PROCEDURE dbo.FilterTopAmount
	@inAmount INT
	, @outResult INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResult = 0;

	SELECT TOP(@inAmount)
		A.[Name]
		, A.Price
	FROM dbo.Article A
	ORDER BY NAME

	SET NOCOUNT OFF;
END;