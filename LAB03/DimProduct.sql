drop table if exists DimProduct;
create table DimProduct(
	ProductSK int identity(1,1) primary key,
	AlternateProductID int, 
	ProductName nvarchar(50), 
	ProductNumber nvarchar(25), 
	MakeFlag Bit, 
	FinishedGoodsFlag Bit, 
	Color nvarchar(15), 
	SafetyStockLevel smallint, 
	ReorderPoint smallint, 
	StandardCost money, 
	ListPrice money, 
	Size nvarchar(5), 
	SizeUnitMeasureCode nchar(3), 
	Weight decimal(8,2), 
	WeightUnitMeasureCode nchar(3), 
	ProductSubCategoryKey int foreign key references DimProductSubCategory(ProductSubCategorySK),
	InsertDate datetime, 
	ModifiedDate datetime
)

