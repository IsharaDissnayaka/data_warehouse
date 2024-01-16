drop table if exists DimProductCategory;
create table DimProductCategory
(
	ProductCategorySK	int identity(1,1) primary key,
	AlternateProductCategoryID int,
	ProductCategoryName nvarchar(50),
	SrcModifiedDate DateTime,
	InsertDate	DateTime,
	ModifiedDate	DateTime
)



