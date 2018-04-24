USE DatamartAPPS 
GO 
/***********************************************************
VERSION: 001
DESCRIPTION: Superfile migration  
Change History (by date):
20170925 CBH created script from files sent by Sean Burns 
***********************************************************/

DECLARE @OBJ SysName, @SQL nVarchar(4000), @SQL2 nVarchar(4000)
Set @OBJ = 'Other' -- Name of the Table object.  
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
    sfmcu Varchar(12) Null
  , sfco Varchar(10) Null
  , sfrkco Varchar(10) Null
  , sfdoc decimal(18, 10) Null
  , sfdoco decimal(18, 10) Null
  , sfdcto Varchar(10) Null
  , sflnid decimal(18, 10) Null
  , sfsfxo Varchar(3) Null
  , sflnty Varchar(10) Null
  , sflntyd Varchar(30) Null
  , sftrdj DateTime2 Null
  , sfdrqj DateTime2 Null
  , sfaddj DateTime2 Null
  , sfivd DateTime2 Null
  , sfitm decimal(18, 10) Null
  , sflitm Varchar(25) Null
  , sfdsc1 Varchar(30) Null
  , sfdsc2 Varchar(30) Null
  , sfrlit Varchar(10) Null
  , sfktln decimal(18, 10) Null
  , sflttr Varchar(10) Null
  , sfnxtr Varchar(10) Null
  , sflprc decimal(18, 10) Null
  , sfuprc decimal(18, 10) Null
  , sfaexp decimal(18, 10) Null
  , sfasn Varchar(10) Null
  , sfprov Varchar(10) Null
  , sfuncs decimal(18, 10) Null
  , sfecst decimal(18, 10) Null
  , sfuorg decimal(18, 10) Null
  , sfsocn decimal(18, 10) Null
  , sfuom Varchar(10) Null
  , sfsoqs decimal(18, 10) Null
  , sfitwt decimal(18, 10) Null
  , sfsrp1 Varchar(10) Null
  , sfsrp1d Varchar(30) Null
  , sfsrp2 Varchar(10) Null
  , sfsrp2d Varchar(30) Null
  , sfsrp3 Varchar(10) Null
  , sfsrp3d Varchar(30) Null
  , sfsrp4 Varchar(10) Null
  , sfsrp4d Varchar(30) Null
  , sfsrp5 Varchar(10) Null
  , sfsrp5d Varchar(30) Null
  , sfprp4 Varchar(10) Null
  , sfprp4d Varchar(30) Null
  , sfshcn Varchar(10) Null
  , sfshcnd Varchar(30) Null
  , sfuom1 Varchar(10) Null
  , sfbcrc Varchar(10) Null
  , sfpred DateTime2 Null
  , sfuom4 Varchar(10) Null
  , sfprp6 Varchar(10) Null
  , sfprp6d Varchar(30) Null
  , sfprp9 Varchar(10) Null
  , sfprp9d Varchar(30) Null
  , sfsrp9 Varchar(10) Null
  , sfsrp9d Varchar(30) Null
  , sfac04 Varchar(10) Null
  , sfsoad decimal(18, 10) Null
  , sfsonm Varchar(40) Null
  , sfsoct Varchar(25) Null
  , sfsost Varchar(10) Null
  , sfsopc Varchar(12) Null
  , sfsoco Varchar(10) Null
  , sfshad decimal(18, 10) Null
  , sfshnm Varchar(40) Null
  , sfshct Varchar(25) Null
  , sfshst Varchar(10) Null
  , sfshpc Varchar(12) Null
  , sfshco Varchar(10) Null
  , sfacnm Varchar(40) Null
  , sfacct Varchar(25) Null
  , sfacst Varchar(10) Null
  , sfacpc Varchar(12) Null
  , sfacco Varchar(10) Null
  , sfacp decimal(18, 10) Null
  , sfot decimal(18, 10) Null
  , sfsrc Varchar(12) Null
  , sfcrco Varchar(10) Null
  , sfautn Varchar(10) Null
  , sfftrh Varchar(10) Null
  , sffrthd Varchar(30) Null
  , sftxa1 Varchar(10) Null
  , sfhold Varchar(10) Null
  , sfholdd Varchar(30) Null
  , sfcars decimal(18, 10) Null
  , sfvr01 Varchar(25) Null
  , sfvr03 Varchar(25) Null
  , sfvmid Varchar(3) Null
  , sfvmidd Varchar(25) Null
  , sfzon Varchar(25) Null
  , sfzond Varchar(30) Null
  , sfaft Varchar(10) Null
  , sfmot Varchar(10) Null
  , sfmotd Varchar(30) Null
  , sfmmtl decimal(18, 10) Null
  , sfscr decimal(18, 10) Null
  , sfmvar decimal(18, 10) Null
  , sfmfix decimal(18, 10) Null
  , sflvar decimal(18, 10) Null
  , sflfix decimal(18, 10) Null
  , sfsec decimal(18, 10) Null
  , sfdirl decimal(18, 10) Null
  , sfmacr decimal(18, 10) Null
  , sfslit decimal(18, 10) Null
  , sfd70 Varchar(50) Null
  , sfd85 Varchar(85) Null
  , sfd50 Varchar(85) Null
  , sfd35 Varchar(85) Null
  , sfwid decimal(18, 10) Null
  , sfhgt decimal(18, 10) Null
  , sfsty Varchar(30) Null
  , sfoto Varchar(30) Null
  , sfwidn Varchar(30) Null
  , sflact Varchar(30) Null
  , sfhgtn Varchar(30) Null
  , sfacc Varchar(30) Null
  , sfgor Varchar(30) Null
  , sfhgta Varchar(30) Null
  , sfmtl Varchar(30) Null
  , sfplt Varchar(30) Null ';
set @SQL2 = '
  , sfsize Varchar(30) Null
  , sfprod Varchar(30) Null
  , sfmtlg Varchar(30) Null
  , sfnor Varchar(30) Null
  , sfpar Varchar(30) Null
  , sfbot Varchar(30) Null
  , sfprt Varchar(30) Null
  , sfopen Varchar(30) Null
  , sfgog Varchar(30) Null
  , sfcol Varchar(30) Null
  , sfcndj DateTime2 Null
  , sfstkt Varchar(1) Null
  , sfglc Varchar(4) Null
  , sfglcd Varchar(30) Null
  , sfptc Varchar(3) Null
  , sfptcd Varchar(30) Null
  , sfglbu Varchar(12) Null
  , sfglac Varchar(6) Null
  , sfglsb Varchar(8) Null
  , sfac14 Varchar(3) Null
  , sfac24 Varchar(3) Null
  , sfuctr Varchar(3) Null
  , sfqote decimal(18, 10) Null
  , sfadvp decimal(18, 10) Null
  , sfover decimal(18, 10) Null
  , sfmdsc decimal(18, 10) Null
  , sftdsc decimal(18, 10) Null
  , sfpa8 decimal(18, 10) Null
  , sfprp1 Varchar(3) Null
  , sfprp1d Varchar(30) Null
  , sfprp2 Varchar(3) Null
  , sfprp2d Varchar(30) Null
  , sfprp3 Varchar(3) Null
  , sfprp3d Varchar(30) Null
  , sfsrp7 Varchar(6) Null
  , sfsrp7d Varchar(30) Null
  , sfshcm Varchar(3) Null
  , sfshcmd Varchar(30) Null
  , sfconv decimal(18, 10) Null
  , sfta30 Varchar(30) Null
  , sfta31 Varchar(30) Null
  , sfta32 Varchar(30) Null
  , sfta33 Varchar(30) Null
  , sfupmj DateTime2 Null
  , sftday decimal(18, 10) Null
  , sftorg Varchar(10) Null
  , sfdate DateTime2 Null
  , sfsource Varchar(50) Null
  , sfprice decimal(18, 10) Null
  , sfimport DateTime2 Null
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
