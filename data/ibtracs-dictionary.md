"Name,"	"Plot Name,"	"Units,"	"Description,"	"Format,"
"Serial_Num,"	"Serial Number,"	"N/A,"	A unique storm identifier (SID) assigned by IBTrACS algorithm	"YYYYJJJHTTNNN (YYYY-Year, JJJ- Day, H - Hemisphere, TT- absolute value of the rounded latitude, NNN - the rounded longitude"
Season	Season	Year	Season (year) that the storm began.	YYYY
Num	Number 	#	Number of the storm for the year (restarts at 1 for each year)	Count(integer)
Basin	Basin	BB	Basin of the current storm position	"SI = South Indian, SA = South Atlantic, SP = South Pacific, NI = North Indian, WP = Western Pacific, EP = Eastern Pacific, NA =	North Atlantic"
Sub_basin	Subbasin	BB	Sub-basin of the current storm position	"WA (SI) = Western Australia, EA (SP) = Eastern Australia, AS (NI) = Arabian Sea, BB (NI) = Bay of Bengal, CP (EP) = Central Pacific, CS (NA) = Caribbean Sea, GM (NA) = Gulf of Mexico"
Name	Name	N/A	Name of system give by source (if available)	String
ISO_time	ISO Time	YYYY-MM-DD HH:MM:SS	Time of the observation in ISO format 	(YYYY-MM-DD hh:mm:ss)
Nature	Nature	N/A	Type of storm	Characters to classify storm type
Latitude	Latitude	deg_north	Mean position - latitude 	Decimal(real)
Longitude	Longitude	deg_east	Mean position - longitude	Decimal(real)
Wind(WMO)	Wind	kt	Maximum sustained wind speed assigned by the responsible WMO agency	Decimal(real)
Pres(WMO)	Pressure	mb	Minimum central pressure assigned by the responsible WMO agency	Decimal(real)