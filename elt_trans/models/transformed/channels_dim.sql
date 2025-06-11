select
	"Channel ID" as "channelId",
	"Channel Name" as "channelName"
from 
	{{ref('bronze_channels')}}