if not exist WebController\Programs mkdir WebController\Programs
if not exist WebController\Zones mkdir WebController\Zones

copy ExternalPrograms\bin\Release\ExternalPrograms.dll WebController\Programs\ExternalPrograms.dll
copy ExternalZones\bin\Release\ExternalZones.dll WebController\Zones\ExternalZones.dll