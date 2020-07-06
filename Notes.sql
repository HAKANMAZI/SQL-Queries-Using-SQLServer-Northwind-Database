  -- Tüm dataları siler id yi de resetler
  DELETE [database].[schema].[tablename]                             
  DBCC CHECKIDENT ('[database].[schema].[tablename]', RESEED, 0);
  GO


--Tablo2 de olup Tablo1 de olmayan
select  * from Table1 a 
where not exists (select  1 from Table2 b where rtrim(ltrim (a.TCKNO ))
collate Turkish_CI_AI=rtrim(ltrim (b.TCKNO )) collate Turkish_CI_AI);

--Langitude ve Latitude mesafe hesaplama
  DECLARE @source geography = 'POINT(0 51.5)'
  DECLARE @target geography = 'point(-3 56)'
  select @source.STDistance(@target)
  
 --change schema
  if (not exists (select * from sys.schemas where name = 'hsv'))
  begin
     exec('create schema [hsv] authorization [dbo]')
  end

  alter schema hsv
      transfer dbo.arac
	 
 --a ile b nin kesişimi 
 a intersect b  
 --a da var b de yok
 a except b       
 
 
EXEC sp_MSforeachdb N'
IF N''?'' NOT IN(N''master'',N''model'',N''tempdb'',N''msdb'',N''SSISDB'')
BEGIN
        USE [?];
    INSERT INTO #TableList
		 SELECT * FROM TableName1.INFORMATION_SCHEMA.TABLES;
		INSERT INTO #TableList
		 SELECT * FROM TableName1.INFORMATION_SCHEMA.TABLES;
END;';


  select PATINDEX('%[ ]%','hakan mazi')   --ilk boşluğun indexini bul
  select PATINDEX('%[_-]%','hakan mazi')   --ilk _ yada - indexini bul
  
  
use DatabaseName
go
select
s.name as schemaName,
t.name as tableName,
p.rows as RowCounts,
cast(round((sum(a.used_pages)/128.00),2) as numeric(36,2)) as KullanılanAlanMb,
cast(round((sum(a.total_pages)/128.00),2) as numeric(36,2)) as ToplamAlanMb
from sys.tables t
inner join sys.indexes i on t.object_id = i.object_id
inner join sys.partitions p on i.object_id = p.object_id and i.index_id = p.index_id
inner join sys.allocation_units a on p.partition_id = a.container_id
inner join sys.schemas s on t.schema_id = s.schema_id
group by t.Name, s.Name, p.Rows 
order by s.name, t.name
go

  