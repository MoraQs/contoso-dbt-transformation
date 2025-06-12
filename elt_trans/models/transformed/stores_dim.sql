select 
	sto.storekey as "storeKey",
	sto."Store Type" as "storeType",
	sto."Store Name" as "storeName",
	geo.country,
	sto.status, 
	sto."Close Reason" as "closeReason",
	sto."Employee Count" as "NumberOfEmployee",
	sto."Selling Area Size" as "sellingAreaSize"
from
	{{ref('stg_stores')}} as sto
left join {{ref('stg_geography')}} as geo
	on sto.geographykey = geo.geographykey