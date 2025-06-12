select
	"Channel ID" as "channelId",
	"Channel Name" as "channelName"
from 
	{{ref('stg_channels')}}