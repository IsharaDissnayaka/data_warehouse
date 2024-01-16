CREATE PROCEDURE dbo.UpdateDimProductSubCategory 
@ProductSubCategoryID int, 
@ProductCategoryKey int, 
@ProductSubCategoryName nvarchar(50), 
@ModifiedDate datetime 
AS 
BEGIN 
if not exists (select ProductSubCategorySK 
from dbo.DimProductSubCategory 
where AlternateProductSubCategoryID = @ProductSubCategoryID) 
BEGIN 
insert into dbo.DimProductSubCategory 
(AlternateProductSubCategoryID, ProductCategoryKey, ProductSubCategoryName, SrcModifiedDate, 
InsertDate, ModifiedDate) 
values 
(@ProductSubCategoryID, @ProductCategoryKey, @ProductSubCategoryName, @ModifiedDate, 
GETDATE(), GETDATE()) 
END; 
if exists (select ProductSubCategorySK 
from dbo.DimProductSubCategory 
where AlternateProductSubCategoryID = @ProductSubCategoryID) 
BEGIN 
update dbo.DimProductSubCategory 
set ProductCategoryKey = @ProductCategoryKey, 
ProductSubCategoryName = @ProductSubCategoryName, 
SrcModifiedDate = @ModifiedDate, 
ModifiedDate = GETDATE() 
where AlternateProductSubCategoryID = @ProductSubCategoryID 
END; 
END;