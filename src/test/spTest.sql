--Check CheckUser SP
DECLARE @RC INT 
DECLARE @inUserName VARCHAR(16) = 'lol'
DECLARE @inPassword VARCHAR(16) = 'j123'
DECLARE @outResult INT

EXECUTE @RC = dbo.CheckUser
    @inUserName
    , @inPassword
    , @outResult OUTPUT
    SELECT @outResult


GO

--Check InsertArticle SP
DECLARE @RC INT
DECLARE @inName VARCHAR(128) = 'Pancho'
DECLARE @inPrice MONEY = 100000
DECLARE @outResult INT

EXECUTE @RC = dbo.InsertArticle
    @inName
    , @inPrice
    , @outResult OUTPUT
    SELECT @outResult

--Check FilterByName
DECLARE @RC INT
DECLARE @inName VARCHAR(128) = 'h'
DECLARE @outResult INT

EXECUTE @RC = dbo.FilterByName
    @inName
    , @outResult OUTPUT
    SELECT @outResult

--check FilterTopAmount
DECLARE @RC INT
DECLARE @inAmount INT = 12
DECLARE @outResult INT

EXECUTE @RC = dbo.FilterTopAmount
    @inAmount
    , @outResult OUTPUT
    SELECT @outResult