create table DimProductSubCategory
(
	ProductSubCategorySK int identity(1,1) primary key,
	AlternateProductSubCategoryID int,
	ProductCategoryKey	int foreign key references DimProductCategory(ProductCategorySK),
	ProductSubCategoryName nvarchar(50),
	SrcModifiedDate DateTime,
	InsertDate	DateTime,
	ModifiedDate DateTime
)


