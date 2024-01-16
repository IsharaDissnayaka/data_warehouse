CREATE PROCEDURE dbo.UpdateDimProductCategory 
@ProductCategoryID int, 
@ProductCategoryName nvarchar(50), 
@ModifiedDate datetime 
AS 
BEGIN 
if not exists (select ProductCategorySK 
from dbo.DimProductCategory 
where AlternateProductCategoryID = @ProductCategoryID) 
BEGIN 
insert into dbo.DimProductCategory 
(AlternateProductCategoryID, ProductCategoryName, SrcModifiedDate, InsertDate, ModifiedDate) 
values 
(@ProductCategoryID, @ProductCategoryName, @ModifiedDate, GETDATE(), GETDATE()) 
END; 
if exists (select ProductCategorySK 
from dbo.DimProductCategory 
where AlternateProductCategoryID = @ProductCategoryID) 
BEGIN 
update dbo.DimProductCategory 
set ProductCategoryName = @ProductCategoryName, 
SrcModifiedDate = @ModifiedDate, 
ModifiedDate = GETDATE() 
where AlternateProductCategoryID = @ProductCategoryID 
/*where AlternateProductCategoryID = @ProductCategoryID and ( ProductCategoryName != ProductCategoryName or SrcModifiedDate != @ModifiedDate)*/
END; 
END;