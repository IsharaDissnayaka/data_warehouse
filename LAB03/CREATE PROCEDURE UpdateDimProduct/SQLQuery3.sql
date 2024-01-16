CREATE PROCEDURE dbo.UpdateDimProduct 
@ProductID int, 
@ProductName nvarchar(50), 
@ProductNumber nvarchar(25), 
@MakeFlag bit, 
@FinishedGoodsFlag bit, 
@Color nvarchar(15), 
@SafetyStockLevel smallint, 
@ReorderPoint smallint, 
@StandardCost money, 
@ListPrice money, 
@Size nvarchar(5), 
@SizeUnitMeasureCode nvarchar(3), 
@Weight decimal(8,2), 
@WeightUnitMeasureCode nvarchar(3), 
@ProductSubCategoryKey int 
AS 
BEGIN 
if not exists (select ProductSK  from dbo.DimProduct where AlternateProductID = @ProductID) 
BEGIN 
insert into dbo.DimProduct (AlternateProductID, ProductName, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, 
SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, Size, SizeUnitMeasureCode, [Weight], WeightUnitMeasureCode, 
ProductSubCategoryKey, InsertDate, ModifiedDate) 
values(@ProductID, @ProductName, @ProductNumber, @MakeFlag, @FinishedGoodsFlag, @Color, @SafetyStockLevel, 
@ReorderPoint, @StandardCost, @ListPrice, @Size, @SizeUnitMeasureCode, @Weight, @WeightUnitMeasureCode, 
@ProductSubCategoryKey, GETDATE(), GETDATE()) 
END; 
if exists (select ProductSK  from dbo.DimProduct where AlternateProductID = @ProductID) 
BEGIN 
update dbo.DimProduct 
set ProductName = @ProductName, ProductNumber = @ProductNumber, MakeFlag = @MakeFlag, 
FinishedGoodsFlag = @FinishedGoodsFlag, Color = @Color, SafetyStockLevel = @SafetyStockLevel, 
ReorderPoint = @ReorderPoint, StandardCost = @StandardCost, ListPrice = @ListPrice, 
Size = @Size, SizeUnitMeasureCode = @SizeUnitMeasureCode, [Weight] = @Weight, 
WeightUnitMeasureCode = @WeightUnitMeasureCode, ProductSubCategoryKey = @ProductSubCategoryKey, ModifiedDate 
= GETDATE() 
where AlternateProductID = @ProductID 
END; 
END;