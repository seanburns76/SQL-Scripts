USE DatamartAPPS 
GO 
/***********************************************************
VERSION: 001
DESCRIPTION: Superfile migration  
Change History (by date):
20170925 CBH created script from files sent by Sean Burns 
***********************************************************/

DECLARE @OBJ SysName, @SQL nVarchar(4000), @SQL2 nVarchar(4000)
Set @OBJ = 'Add_Fields' -- Name of the Table object.  
DECLARE @DeleteFlag Char(1)
DECLARE @PrintOnly char(1)  
DECLARE @FileGroup sysname 
DECLARE @ServerVersion int -- use 2000, 2005, 2008 as options 
set @ServerVersion = 2014 
Set @DeleteFlag = 'Y'
Set @PrintOnly = 'N' -- indicates to print change sql not execute 
SET @FileGroup = 'Superfile' -- for Primary, just leave empty 
set @SQL = space(0)
set @SQL2 = space(0) 
 
if  (dbo.fnassa_isempty(@FileGroup) =1) 
  begin  
    set @FileGroup = 'on ' + @FileGroup 
  end   

If ( dbo.fnASSA_ObjExists (@Obj, 'U') = 'Y')
  BEGIN 
    If (@DeleteFlag = 'y') 
      BEGIN 
        Select @SQL = 'Drop Table dbo.' + @OBJ
        PRINT @SQL 
        execute( @SQL ) ; 
      END 
  END 
   
If ( dbo.fnASSA_ObjExists (@Obj, 'U') = 'N')
  BEGIN 
    Select 'Creating Table dbo. ' + @OBJ
   set @SQL =  '
CREATE TABLE dbo.'+ @OBJ +' (
/***********************************************************
CURRENT_DATE: ASSA ABLOY
AUTHOR:  Chris Holmberg
PROJECT: ASSAMART\DATAMARTS 
SUBJECT: Create Table ' + @OBJ + '
***********************************************************/
      sfdoco decimal(10, 0) Null
  , sflnid decimal(10, 0) Null
  , sfopdj DateTime2 Null
  , sfpa8 decimal(10, 0) Null
  , sfabalph varchar(40) Null
  , sfadd1 varchar(40) Null
  , sfadd2 varchar(40) Null
  , sfadd3 varchar(40) Null
  , sfadd4 varchar(40) Null
  , sfaddz varchar(12) Null
  , sfacty1 varchar(40) Null
  , sfadds varchar(10) Null
  , sfzian81 decimal(10, 0) Null
  , sfzian82 decimal(10, 0) Null
  , sfzian83 decimal(10, 0) Null
  , sfzian84 decimal(10, 0) Null
  , sfziac04 varchar(10) Null
  , sfziac05 varchar(10) Null
  , sfziac06 varchar(10) Null
  , sfziac07 varchar(10) Null
  , sfziac08 varchar(10) Null
  , sfziac09 varchar(10) Null
  , sfzi$tem varchar(30) Null
  , sfziilnm varchar(40) Null
  , sfzielnm varchar(40) Null
  , sfziolnm varchar(40) Null
 ';

     set @SQL2 = @SQL2 + '   
    )  ' + @FileGroup 
      print @SQL 
      print @SQL2
   if ( @PrintOnly = 'N' ) 
      begin 
           execute (@SQL + @SQL2);
      end   
  END 

--If ( dbo.fnASSA_ObjExists ( @Obj, 'U') = 'Y')
--  BEGIN 
--    -- DECLARE @SQL Varchar (4000)
--    -- Primary Key Declaration
--    DECLARE @PK SysName 
--    DECLARE @TABLE Sysname
--    DECLARE @COLUMNS varchar(255) 
    
--    Set @TABLE = @Obj
        
--    Set @Columns = '' 
--    Set @PK = 'pk_' + @TABLE
--    If ( dbo.fnASSA_ObjExists (@PK, 'PK') = 'Y')
--      BEGIN 
--        Print 'Dropping Constraint ' + @PK
--        Set @SQL = 'Alter Table dbo.' + @TABLE + ' Drop Constraint ' + @PK
--        if ( @PrintOnly = 'N') 
--          Begin execute( @SQL ) ; end 
--      END 
--    If ( dbo.fnASSA_ObjExists (@PK, 'PK') = 'N')
--      BEGIN 
--        Print 'Add Constraint ' + @PK
--        Set @SQL = 'Alter Table dbo.' + @TABLE 
--        Set @SQL = @SQL + ' Add Constraint ' + @PK
--        Set @SQL = @SQL + ' Primary Key Nonclustered (' + @COLUMNS + ') '  
--          set @SQL = @SQL  + @FileGroup  
--        print @SQL 
--        if ( @PrintOnly = 'N') 
--          Begin execute( @SQL ) ; end 
--      END 
      
--      -- these first two variables are typically already declared. 
--      -- DECLARE @SQL Varchar(4000) 
--      -- DECLARE @TABLE sysname
--      DECLARE @IDX sysname
--      DECLARE @IncludeList varchar(255)       
--      Set @Columns = 'ChangeDate'
--      set @IncludeList = 'PartitionKey';
--      Set @IDX = 'idx_' + @Table + '_' + Replace(Replace(@Columns, ' ', '') , ',', '_')
--      BEGIN 
--        If ( dbo.fnASSA_ObjExists (@IDX, 'IDX') = 'Y')
--          BEGIN 
--            SET @SQL = 'Drop Index dbo.' + @TABLE + '.'+ @IDX
--            Print @SQL 
--          if ( @PrintOnly = 'N') 
--            Begin execute( @SQL ) ;  end 
--              if ( @@ERROR = 0) BEGIN PRINT 'Successfully dropped index ' + @idx END 
--          END 
--        If ( dbo.fnASSA_ObjExists (@IDX, 'IDX') = 'N')
--          BEGIN 
--            Set @SQL = 'Create Index ' + @IDX + ' on dbo.' + @Table + '( ' + @COLUMNS + ' )'  
--            if (( @Serverversion > 2000) 
--                and len(isnull(@IncludeList, space(0)))>0)
--              begin 
--                Set @SQL = @SQL + Char(13) + ' Include( '+ @IncludeList +' )'
--              end 
--            set @SQL = @SQL + Char(13) + @FileGroup  
--            Print @SQL 
--          if ( @PrintOnly = 'N') 
--            Begin execute( @SQL ) ;  end 
--              if ( @@ERROR =0 ) BEGIN PRINT 'Successfully created index ' + @idx END 
--          END 
--      END 

--      Set @Columns = ''
--      set @IncludeList = space(0)
--      Set @IDX = 'idx_' + @Table + '_' + Replace(Replace(@Columns, ' ', '') , ',', '_')
--      BEGIN 
--        If ( dbo.fnASSA_ObjExists (@IDX, 'IDX') = 'Y')
--          BEGIN 
--            SET @SQL = 'Drop Index dbo.' + @TABLE + '.'+ @IDX
--            Print @SQL 
--          if ( @PrintOnly = 'N') 
--            Begin execute( @SQL ) ;  end 
--              if ( @@ERROR = 0) BEGIN PRINT 'Successfully dropped index ' + @idx END 
--          END 
--        If ( dbo.fnASSA_ObjExists (@IDX, 'IDX') = 'N')
--          BEGIN 
--            Set @SQL = 'Create Index ' + @IDX + ' on dbo.' + @Table + '( ' + @COLUMNS + ' )'  
--            if (( @Serverversion > 2000) 
--                and len(isnull(@IncludeList, space(0)))>0)
--              begin 
--                Set @SQL = @SQL + Char(13) + ' Include( '+ @IncludeList +' )'
--              end 
--            set @SQL = @SQL + Char(13) + @FileGroup  
--            Print @SQL 
--          if ( @PrintOnly = 'N') 
--            Begin execute( @SQL ) ; end 
--              if ( @@ERROR =0 ) BEGIN PRINT 'Successfully created index ' + @idx END 
--          END 
--        END
  --END 


GO 
