select 
	"Promotion Key" as "promotionKey",
	"Promotion Name" as "promotionName",
	"Discount Percent" as "discountPercent",
	"Start Date"::date as "startDate",
	"End Date"::date as "endDate"
from 
    {{ref('stg_promotion')}}