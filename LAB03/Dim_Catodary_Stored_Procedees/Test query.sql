select * from DimProductCategory

insert into SLIIT_Retail_Staging.dbo.StgProductCategory(ProductCategoryID,ModifiedDate,Name)values(10,GETDATE(),'TestCategory')
update SLIIT_Retail_Staging.dbo.StgProductCategory set Name ='TestCategory' where ProductCategoryID =10