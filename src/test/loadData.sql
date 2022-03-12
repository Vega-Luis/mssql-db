DECLARE @xmlData XML

--charge from xml file
SET @xmlData = (
    SELECT *
    FROM OPENROWSET(
        BULK 'C:\Users\Vrl4\Documents\i-sem-2022\bd-i\primera-tarea-programada\full-sql_web-link\data-layer\test\data.xml'
        , SINGLE_BLOB)
        AS xmlData
		);

INSERT INTO dbo.[User]
    (UserName
    , [Password])
SELECT
    T.Item.value('@UserName', 'VARCHAR(16)')
    , T.Item.value('@Password', 'VARCHAR(16)')
FROM @xmlData.nodes('Users/User') AS T(Item)

INSERT INTO dbo.Article
	([Name]
	, Price)
SELECT
	T.Item.value('@Name', 'VARCHAR(128)')
	, T.Item.value('@Price', 'MONEY')
FROM @xmlData.nodes('Articles/Article') AS T(Item)