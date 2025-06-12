with cte_sold_product_id as (
	select
		productkey
	from {{ref('stg_sales')}}
	group by productkey	
),

cte_all_products as(
	select 
		productkey  as "productKey",
		"Product Name" as "productName",
		"Product Description" as "productDesc",
		"Product Category" as "productCategory",
		"Product Subcategory" as "productSubcategory",
		"Brand Name" as "brandName",
		"Class Name" as "className",
		manufacturer
	from
		{{ref('stg_product')}}
)

select * from cte_all_products where "productKey" in (select productkey from cte_sold_product_id)