select 
	geographykey as "geographyKey",
	"Geography Type" as "geographyType",
	"Continent Name" as "continentName",
	country
from
    {{ref('stg_geography')}}