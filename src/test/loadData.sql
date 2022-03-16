DECLARE @xmlData XML

--charge from xml file
SET @xmlData = (
    SELECT *
    FROM OPENROWSET(
        BULK 'C:\Users\Vrl4\Documents\git-workspace\mssql-db\src\test\DatosTarea1.xml'
        , SINGLE_BLOB)
        AS xmlData
		);

INSERT INTO dbo.[User]
    (UserName
    , [Password])
SELECT
    T.Item.value('@Nombre', 'VARCHAR(16)')
    , T.Item.value('@Password', 'VARCHAR(16)')
FROM @xmlData.nodes('Datos/Usuarios/Usuario') AS T(Item)

INSERT INTO dbo.Article
	([Name]
	, Price)
SELECT
	T.Item.value('@Nombre', 'VARCHAR(128)')
	, T.Item.value('@Precio', 'MONEY')
FROM @xmlData.nodes('Datos/Articulos/Articulo') AS T(Item)