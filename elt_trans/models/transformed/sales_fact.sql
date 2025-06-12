select 
	saleskey as sales_key,
	date::date as transaction_date,
	productkey as product_key,
	channelkey as channel_key,
	storekey as store_key,
	promotionkey as promotion_key,
	geographykey as geography_key,
	"Sales Quantity" as gross_quantity,
	"Sales Quantity" - "Return Quantity" - "Discount Quantity" as net_quantity,
	"Unit Cost" * ("Sales Quantity" - "Return Quantity" - "Discount Quantity") as net_cost_amount,
	"Unit Price" * ("Sales Quantity" - "Return Quantity" - "Discount Quantity") as net_sales_amount
from 
    {{ref('stg_sales')}}