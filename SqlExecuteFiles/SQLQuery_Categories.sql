
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Category_Crub
	@Action Varchar(10),
	@CategoryId Int = null,
	@Name varchar(100) = null,
	@IsActive bit = false,
	@ImageUrl varchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @Action = 'select'
		begin 
			select * from Categories order by CreatedDate desc
		end

		-- insert
		if @Action = 'INSERT'
			begin
				insert into Categories(Name, ImageUrl,IsActive,CreatedDate)
				values(@Name,@ImageUrl,@IsActive,GETDATE())
			end
		if @Action = 'UPDATE'
			begin 
				declare @UPDATE_IMAGE varchar(20)
				select @UPDATE_IMAGE = (case when @ImageUrl is null then 'NO' else 'YES' end)
				if @UPDATE_IMAGE = 'NO'
					begin 
						Update Categories
						set Name = @Name, IsActive=@IsActive
						where CategoryId = @CategoryId
					end
				else
					begin
						update Categories
						set Name = @Name, ImageUrl = @ImageUrl, IsActive = @IsActive
						where CategoryId = @CategoryId
					end
				end
		if @Action = 'DELETE'
			BEGIN
				delete from Categories where CategoryId = @CategoryId
			end
		-- get by id
		if @Action = 'GETBYID'
			begin
				select * from Categories where CategoryId = @CategoryId
			end
END
GO
