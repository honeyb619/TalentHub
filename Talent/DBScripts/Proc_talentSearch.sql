USE [TalentSearch]
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteJob]    Script Date: 04/09/2017 10:15:53 ******/
DROP PROCEDURE [dbo].[usp_DeleteJob]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductionCompany]    Script Date: 04/09/2017 10:15:53 ******/
DROP PROCEDURE [dbo].[usp_DeleteProductionCompany]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPublicTalent]    Script Date: 04/09/2017 10:15:53 ******/
DROP PROCEDURE [dbo].[usp_GetPublicTalent]
GO
/****** Object:  StoredProcedure [dbo].[GetJobs]    Script Date: 04/09/2017 10:15:53 ******/
DROP PROCEDURE [dbo].[GetJobs]
GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertErrorDetails]    Script Date: 04/09/2017 10:15:53 ******/
DROP PROCEDURE [dbo].[Proc_InsertErrorDetails]
GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertErrorDetails]    Script Date: 04/09/2017 10:15:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_InsertErrorDetails]
AS
/*
Purpose    : Insert the error details occurred in the SQL query
Input      : Insert the details which receives from the TRY...CATCH block
Output     : Insert the details of received errors into the ErrorTracer table
Created By : Senthilkumar
Created On : July 17, 2009
*/
BEGIN
  SET NOCOUNT ON 
  SET XACT_ABORT ON
  
  DECLARE @ErrorNumber VARCHAR(MAX)  
  DECLARE @ErrorState VARCHAR(MAX)  
  DECLARE @ErrorSeverity VARCHAR(MAX)  
  DECLARE @ErrorLine VARCHAR(MAX)  
  DECLARE @ErrorProc VARCHAR(MAX)  
  DECLARE @ErrorMesg VARCHAR(MAX)  
  DECLARE @vUserName VARCHAR(MAX)  
  DECLARE @vHostName VARCHAR(MAX) 

  SELECT  @ErrorNumber = ERROR_NUMBER()  
       ,@ErrorState = ERROR_STATE()  
       ,@ErrorSeverity = ERROR_SEVERITY()  
       ,@ErrorLine = ERROR_LINE()  
       ,@ErrorProc = ERROR_PROCEDURE()  
       ,@ErrorMesg = ERROR_MESSAGE()  
       ,@vUserName = SUSER_SNAME()  
       ,@vHostName = Host_NAME()  
  
INSERT INTO ErrorTracer(vErrorNumber,vErrorState,vErrorSeverity,vErrorLine,
	vErrorProc,vErrorMsg,vUserName,vHostName,dErrorDate)  
VALUES(@ErrorNumber,@ErrorState,@ErrorSeverity,@ErrorLine,@ErrorProc,
	@ErrorMesg,@vUserName,@vHostName,GETDATE())  
END
GO
/****** Object:  StoredProcedure [dbo].[GetJobs]    Script Date: 04/09/2017 10:15:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetJobs]
AS

 select count(1) as JobCount from jobs

SELECT
  *
FROM Jobs
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPublicTalent]    Script Date: 04/09/2017 10:15:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_GetPublicTalent]
@Category varchar(200) = '',
@SubCategory varchar(200) = '',
@isAdmin bit=0
AS
BEGIN
select ISNULL(T.FirstName,'') + ' ' + ISNULL(T.LastName, '') AS Name, T.TalentId, ISNULL(M.FilePath,'Images/blank-profile-picture.png') AS FilePath from Talent T WITH(NOLOCK) 
INNER JOIN 
JobTalentCategory JTC WITH(NOLOCK) ON JTC.TalentId = T.TalentId AND JTC.JobId IS NULL
INNER JOIN 
SubCategory SC WITH(NOLOCK) ON SC.SubCategoryId = JTC.CategoryId AND SC.ParentId IS NULL
INNER JOIN
JobTalentSkills JTS WITH(NOLOCK) ON JTS.ParentCategoryId = JTC.JobTalentCategoryId AND JTS.JobId IS NULL
INNER JOIN
SubCategory SC1 WITH(NOLOCK) ON SC1.SubCategoryId = JTS.SkillId AND SC1.ParentId IS NOT NULL
INNER JOIN Category C WITH(NOLOCK) ON C.CategoryId = SC.CategoryId AND C.CategoryId = SC1.CategoryId
LEFT JOIN
Media M WITH(NOLOCK) ON M.TalentId = T.TalentId AND M.JobId IS NULL AND M.MediaType = 'Image' AND IsProfilePic = 1
WHERE C.MasterCategoryName = 'CATEGORY' AND C.CategoryValue = 'Category' AND (T.IsPublic = 1 or @isAdmin=1)
AND
  (SC.SubCategoryValue = @Category) AND 
(@SubCategory = '' OR SC1.SubCategoryValue = @SubCategory)
AND T.IsDeleted = 0 AND JTC.IsDeleted = 0 AND SC.IsDeleted = 0 AND JTS.IsDeleted = 0 AND SC1.IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductionCompany]    Script Date: 04/09/2017 10:15:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_DeleteProductionCompany]
@ProductionCompanyId BIGINT,
@UserId BIGINT
AS
BEGIN
DECLARE @IsSuccess VARCHAR(10) = 'Fail'
DECLARE @TodayDate DATETIME2(0) = GETDATE()

  BEGIN TRY
    BEGIN TRANSACTION;
        UPDATE ProductionCompany SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE ProductionCompanyId = @ProductionCompanyId
		UPDATE Jobs SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE ProductionCompanyId = @ProductionCompanyId
    
		SELECT JobId INTO #DeleteJobs from Jobs WHERE ProductionCompanyId = @ProductionCompanyId
		
		IF EXISTS(SELECT TOP 1 1 FROM #DeleteJobs)
		BEGIN
			UPDATE JTC SET JTC.IsDeleted = 1, JTC.ModifiedBy = @UserId, JTC.ModifiedDate = @TodayDate FROM JobTalentCategory JTC
			INNER JOIN #DeleteJobs J ON J.JobId = JTC.JobId
     
			UPDATE JTL SET JTL.IsDeleted = 1, JTL.ModifiedBy = @UserId, JTL.ModifiedDate = @TodayDate FROM JobTalentLanguage JTL
			INNER JOIN #DeleteJobs J ON J.JobId = JTL.JobId
    
			UPDATE JTS SET JTS.IsDeleted = 1, JTS.ModifiedBy = @UserId, JTS.ModifiedDate = @TodayDate FROM JobTalentSkills JTS
			INNER JOIN #DeleteJobs J ON J.JobId = JTS.JobId
    
			UPDATE JTS SET JTS.IsDeleted = 1, JTS.ModifiedBy = @UserId, JTS.ModifiedDate = @TodayDate FROM JobTalentStatus JTS
			INNER JOIN #DeleteJobs J ON J.JobId = JTS.JobId
    
			UPDATE M SET M.IsDeleted = 1, M.ModifiedBy = @UserId, M.ModifiedDate = @TodayDate FROM Media M
			INNER JOIN #DeleteJobs J ON J.JobId = M.JobId 
		END
		
    COMMIT TRANSACTION;
  SET @IsSuccess = 'Success'
  END TRY
  BEGIN CATCH
  select @@TRANCOUNT
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	SET @IsSuccess = 'Fail'
    EXEC Proc_InsertErrorDetails
  END CATCH
  
  SELECT @IsSuccess
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteJob]    Script Date: 04/09/2017 10:15:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_DeleteJob] 
@JobId BIGINT,
@UserId BIGINT
AS
BEGIN
DECLARE @IsSuccess VARCHAR(10) = 'Fail'
DECLARE @TodayDate DATETIME2(0) = GETDATE()

  BEGIN TRY
    BEGIN TRANSACTION;
		UPDATE Jobs SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
		
		UPDATE JobTalentAssociation SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
		
			UPDATE JobTalentCategory SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
     
			UPDATE JobTalentLanguage SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
    
			UPDATE JobTalentSkills SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
        
			UPDATE Media SET IsDeleted = 1, ModifiedBy = @UserId, ModifiedDate = @TodayDate WHERE JobId = @JobId
		
    COMMIT TRANSACTION;
  SET @IsSuccess = 'Success'
  END TRY
  BEGIN CATCH
  select @@TRANCOUNT
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	SET @IsSuccess = 'Fail'
    EXEC Proc_InsertErrorDetails
  END CATCH
  
  SELECT @IsSuccess
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateJobFromXML]    Script Date: 04/09/2017 10:15:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateJobFromXML]
       -- Add the parameters for the stored procedure here
       @UpdateXmlData NVARCHAR(MAX),
       @UserId BIGINT
AS
BEGIN
      DECLARE @IsSuccess VARCHAR(10) = 'Fail'
DECLARE @TodayDate DATETIME2(0) = GETDATE()
DECLARE @JobId BIGINT
DECLARE @CategoryId BIGINT
DECLARE @xmlData XML;

SET @xmlData = CONVERT(XML, @UpdateXmlData);

  BEGIN TRY
    BEGIN TRANSACTION;
--select * from Jobs
       --INSERT INTO Jobs
       --(JobName, JobDescription, MinAge, MaxAge)
SELECT @JobId = XmlData.x.value('JobId[1]','varchar(20)') 
from @xmlData.nodes('/VmInsertJob') XmlData(x)

Update Jobs set JobName = x.value('JobName[1]', 'varchar(1000)'),
                ProductionCompanyId = x.value('ProductionCompanyId[1]', 'bigint'),
                StatusId = x.value('StatusId[1]', 'bigint'),
                RegionId = x.value('RegionId[1]', 'bigint'),
                JobDescription = x.value('JobDescription[1]', 'nvarchar(MAX)'),
                Gender = x.value('Gender[1]', 'varchar(50)'),
                MinAge = x.value('MinAge[1]', 'bigint'),
                MaxAge = x.value('MaxAge[1]', 'bigint'),
                EyeColor = x.value('EyeColor[1]', 'varchar(50)'),
                Height = x.value('Height[1]', 'bigint'),
                Waist = x.value('Waist[1]', 'bigint'),
                HairColor = x.value('HairColor[1]', 'varchar(50)'),
                ChestSize = x.value('ChestSize[1]', 'bigint'),
                HipSize = x.value('HipSize[1]', 'bigint'),
                Ethicity = x.value('Ethicity[1]', 'varchar(100)'),
                Pay = x.value('Pay[1]', 'varchar(100)'),
                NumberOfDays = x.value('NumberOfDays[1]', 'bigint'),
                ModifiedBy = @UserId,
                ModifiedDate = @TodayDate   
       FROM @xmlData.nodes('//VmInsertJob') XmlData(x)
       where JobId = @JobId and IsDeleted = 0
       
       
       
       
       
       MERGE INTO JobTalentLanguage AS t
    USING (select XmlData.x.value('JobId[1]','varchar(20)') as JobId ,  
c.i.value('(.)[1]','int') as LanguageId 
from @xmlData.nodes('/VmInsertJob') XmlData(x)
cross apply x.nodes('LanguageIds/int') c(i)) as s
        ON t.JobId = s.JobId AND t.LanguageId = s.LanguageId AND t.IsDeleted = 0
    WHEN MATCHED AND t.TalentId IS NULL  AND t.IsDeleted = 0 THEN
        --Row exists and data is different
        UPDATE SET t.ModifiedBy = @UserId, t.ModifiedDate = @TodayDate
    WHEN NOT MATCHED BY Target THEN
        --Row exists and data is different
       Insert (LanguageId, JobId, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate)
       values (s.LanguageId, s.JobId, @UserId,@TodayDate,@UserId,@TodayDate)
    WHEN NOT MATCHED BY SOURCE AND t.TalentId IS NULL AND t.JobId = @JobId  AND t.IsDeleted = 0 THEN
        --Row exists and data is different
        UPDATE SET t.ModifiedBy = @UserId, t.ModifiedDate = @TodayDate, t.IsDeleted = 1;
        
       
        update JTC set JTC.ModifiedBy = @UserId, JTC.ModifiedDate = @TodayDate
        ,JTC.CategoryId = S.ParentId from JobTalentCategory JTC 
        INNER JOIN (select XmlData.x.value('JobId[1]','varchar(20)') as JobId ,  
c.i.value('SkillId[1]','int') as SubCategoryId 
from @xmlData.nodes('/VmInsertJob') XmlData(x)
cross apply x.nodes('Skills/VmSkills') c(i)) AS x
        ON x.JobId = JTC.JobId and JTC.TalentId is null AND JTC.IsDeleted = 0
        inner join SubCategory S on S.SubCategoryId = x.SubCategoryId and S.ParentId IS NOT NULL
         AND S.IsDeleted = 0
        Where JTC.JobId = @JobId and JTC.TalentId is NULL and JTC.IsDeleted = 0
        
        
        
        Update JobTalentSkills set ModifiedBy = @UserId, ModifiedDate = @TodayDate,
                SkillId = x.value('SkillId[1]', 'bigint'),
                Description = x.value('Description[1]', 'nvarchar(max)')
       FROM @xmlData.nodes('//VmInsertJob/Skills/VmSkills') XmlData(x)
       where JobId = @JobId and TalentId is NULL and IsDeleted = 0
       
       
        COMMIT TRANSACTION;
  SET @IsSuccess = 'Success'
  END TRY
  BEGIN CATCH
  select @@TRANCOUNT
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
	SET @IsSuccess = 'Fail'
    EXEC Proc_InsertErrorDetails
  END CATCH
  
  SELECT @IsSuccess
END
GO
