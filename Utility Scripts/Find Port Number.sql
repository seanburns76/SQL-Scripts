-- Check the error log for port number
EXEC xp_ReadErrorLog 0, 1, N'Server is listening on', N'any', NULL, NULL, 'DESC'
GO