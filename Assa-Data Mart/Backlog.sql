USE DatamartAPPS 
GO 
/***********************************************************
VERSION: 001
DESCRIPTION: Superfile migration  
Change History (by date):
20170925 CBH created script from files sent by Sean Burns 
***********************************************************/

DECLARE @OBJ SysName, @SQL nVarchar(4000), @SQL2 nVarchar(4000)
Set @OBJ = 'Backlog' -- Name of the Table object.  
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
    SFMCU Varchar(12) NULL
  , SFCO Varchar(10) NULL
  , SFRKCO Varchar(10) NULL
  , SFDOC DECIMAL(18, 10) NULL
  , SFDOCO DECIMAL(18, 10) NULL
  , SFDCTO Varchar(10) NULL
  , SFLNID DECIMAL(18, 10) NULL
  , SFSFXO Varchar(3) NULL
  , SFLNTY Varchar(10) NULL
  , SFLNTYD Varchar(30) NULL
  , SFTRDJ DATETIME2 NULL
  , SFDRQJ DATETIME2 NULL
  , SFADDJ DATETIME2 NULL
  , SFIVD DATETIME2 NULL
  , SFITM DECIMAL(18, 10) NULL
  , SFLITM Varchar(25) NULL
  , SFDSC1 Varchar(30) NULL
  , SFDSC2 Varchar(30) NULL
  , SFRLIT Varchar(10) NULL
  , SFKTLN DECIMAL(18, 10) NULL
  , SFLTTR Varchar(10) NULL
  , SFNXTR Varchar(10) NULL
  , SFLPRC DECIMAL(18, 10) NULL
  , SFUPRC DECIMAL(18, 10) NULL
  , SFAEXP DECIMAL(18, 10) NULL
  , SFASN Varchar(10) NULL
  , SFPROV Varchar(10) NULL
  , SFUNCS DECIMAL(18, 10) NULL
  , SFECST DECIMAL(18, 10) NULL
  , SFUORG DECIMAL(18, 10) NULL
  , SFSOCN DECIMAL(18, 10) NULL
  , SFUOM Varchar(10) NULL
  , SFSOQS DECIMAL(18, 10) NULL
  , SFITWT DECIMAL(18, 10) NULL
  , SFSRP1 Varchar(10) NULL
  , SFSRP1D Varchar(30) NULL
  , SFSRP2 Varchar(10) NULL
  , SFSRP2D Varchar(30) NULL
  , SFSRP3 Varchar(10) NULL
  , SFSRP3D Varchar(30) NULL
  , SFSRP4 Varchar(10) NULL
  , SFSRP4D Varchar(30) NULL
  , SFSRP5 Varchar(10) NULL
  , SFSRP5D Varchar(30) NULL
  , SFPRP4 Varchar(10) NULL
  , SFPRP4D Varchar(30) NULL
  , SFSHCN Varchar(10) NULL
  , SFSHCND Varchar(30) NULL
  , SFUOM1 Varchar(10) NULL
  , SFBCRC Varchar(10) NULL
  , SFPRED DATETIME2 NULL
  , SFUOM4 Varchar(10) NULL
  , SFPRP6 Varchar(10) NULL
  , SFPRP6D Varchar(30) NULL
  , SFPRP9 Varchar(10) NULL
  , SFPRP9D Varchar(30) NULL
  , SFSRP9 Varchar(10) NULL
  , SFSRP9D Varchar(30) NULL
  , SFAC04 Varchar(10) NULL
  , SFSOAD DECIMAL(18, 10) NULL
  , SFSONM Varchar(40) NULL
  , SFSOCT Varchar(25) NULL
  , SFSOST Varchar(10) NULL
  , SFSOPC Varchar(12) NULL
  , SFSOCO Varchar(10) NULL
  , SFSHAD DECIMAL(18, 10) NULL
  , SFSHNM Varchar(40) NULL
  , SFSHCT Varchar(25) NULL
  , SFSHST Varchar(10) NULL
  , SFSHPC Varchar(12) NULL
  , SFSHCO Varchar(10) NULL
  , SFACNM Varchar(40) NULL
  , SFACCT Varchar(25) NULL
  , SFACST Varchar(10) NULL
  , SFACPC Varchar(12) NULL
  , SFACCO Varchar(10) NULL
  , SFACP DECIMAL(18, 10) NULL
  , SFOT DECIMAL(18, 10) NULL
  , SFSRC Varchar(12) NULL
  , SFCRCO Varchar(10) NULL
  , SFAUTN Varchar(10) NULL
  , SFFTRH Varchar(10) NULL
  , SFFRTHD Varchar(30) NULL
  , SFTXA1 Varchar(10) NULL
  , SFHOLD Varchar(10) NULL
  , SFHOLDD Varchar(30) NULL
  , SFCARS DECIMAL(18, 10) NULL
  , SFVR01 Varchar(25) NULL
  , SFVR03 Varchar(25) NULL
  , SFVMID Varchar(3) NULL
  , SFVMIDD Varchar(25) NULL
  , SFZON Varchar(25) NULL
  , SFZOND Varchar(30) NULL
  , SFAFT Varchar(10) NULL
  , SFMOT Varchar(10) NULL
  , SFMOTD Varchar(30) NULL
  , SFMMTL DECIMAL(18, 10) NULL
  , SFSCR DECIMAL(18, 10) NULL
  , SFMVAR DECIMAL(18, 10) NULL
  , SFMFIX DECIMAL(18, 10) NULL
  , SFLVAR DECIMAL(18, 10) NULL
  , SFLFIX DECIMAL(18, 10) NULL
  , SFSEC DECIMAL(18, 10) NULL
  , SFDIRL DECIMAL(18, 10) NULL
  , SFMACR DECIMAL(18, 10) NULL
  , SFSLIT DECIMAL(18, 10) NULL
  , SFD70 Varchar(50) NULL
  , SFD85 Varchar(85) NULL
  , SFD50 Varchar(85) NULL
  , SFD35 Varchar(85) NULL
  , SFWID DECIMAL(18, 10) NULL
  , SFHGT DECIMAL(18, 10) NULL
  , SFSTY Varchar(30) NULL
  , SFOTO Varchar(30) NULL
  , SFWIDN Varchar(30) NULL
  , SFLACT Varchar(30) NULL
  , SFHGTN Varchar(30) NULL
  , SFACC Varchar(30) NULL
  , SFGOR Varchar(30) NULL
  , SFHGTA Varchar(30) NULL
  , SFMTL Varchar(30) NULL
  , SFPLT Varchar(30) NULL ';
set @SQL2 = '
  , SFSIZE Varchar(30) NULL
  , SFPROD Varchar(30) NULL
  , SFMTLG Varchar(30) NULL
  , SFNOR Varchar(30) NULL
  , SFPAR Varchar(30) NULL
  , SFBOT Varchar(30) NULL
  , SFPRT Varchar(30) NULL
  , SFOPEN Varchar(30) NULL
  , SFGOG Varchar(30) NULL
  , SFCOL Varchar(30) NULL
  , SFCNDJ DATETIME2 NULL
  , SFSTKT Varchar(1) NULL
  , SFGLC Varchar(4) NULL
  , SFGLCD Varchar(30) NULL
  , SFPTC Varchar(3) NULL
  , SFPTCD Varchar(30) NULL
  , SFGLBU Varchar(12) NULL
  , SFGLAC Varchar(6) NULL
  , SFGLSB Varchar(8) NULL
  , SFAC14 Varchar(3) NULL
  , SFAC24 Varchar(3) NULL
  , SFUCTR Varchar(3) NULL
  , SFQOTE DECIMAL(18, 10) NULL
  , SFADVP DECIMAL(18, 10) NULL
  , SFOVER DECIMAL(18, 10) NULL
  , SFMDSC DECIMAL(18, 10) NULL
  , SFTDSC DECIMAL(18, 10) NULL
  , SFPA8 DECIMAL(18, 10) NULL
  , SFPRP1 Varchar(3) NULL
  , SFPRP1D Varchar(30) NULL
  , SFPRP2 Varchar(3) NULL
  , SFPRP2D Varchar(30) NULL
  , SFPRP3 Varchar(3) NULL
  , SFPRP3D Varchar(30) NULL
  , SFSRP7 Varchar(6) NULL
  , SFSRP7D Varchar(30) NULL
  , SFSHCM Varchar(3) NULL
  , SFSHCMD Varchar(30) NULL
  , SFCONV DECIMAL(18, 10) NULL
  , SFTA30 Varchar(30) NULL
  , SFTA31 Varchar(30) NULL
  , SFTA32 Varchar(30) NULL
  , SFTA33 Varchar(30) NULL
  , SFUPMJ DATETIME2 NULL
  , SFTDAY DECIMAL(18, 10) NULL
  , SFTORG Varchar(10) NULL
  , SFDATE DATETIME2 NULL
  , SFSOURCE Varchar(50) NULL
  , SFPRICE DECIMAL(18, 10) NULL
  , SFIMPORT DATETIME2 NULL
  '
 
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
--  END 


GO 
