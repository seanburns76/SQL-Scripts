

truncate table tblASSA_RPTFact

truncate table tblASSA_RPTDetails-----need to truncate table these first to get orderno from rptfact

truncate table tblassa_rptheader-----need to truncate table these first to get orderno from rptfact

truncate table tblASSA_DetailStage

truncate table tblassa_salesimportarchive

truncate table tblassa_bookingsimportarchive

truncate table tblassa_bookingsimportdeleted

truncate table tblASSA_DetailStage_archive

truncate table tblassa_hashtotals

truncate table tblassa_salesimportdeleted

truncate table tblassa_rptproductattributes

truncate table tblassa_rptbufields

truncate table tblassa_rptlinediscounts

truncate table tblassa_headerstage

delete from tblassa_product where businessunitid = 425

update tblassa_calendar
set datastatus = 'N'
where datastatus <> 'N'
and BusinessEntityId = '425'
