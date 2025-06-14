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
	{{ref('bronze_stores')}} as sto
left join {{ref('bronze_geography')}} as geo
	on sto.geographykey = geo.geographykey