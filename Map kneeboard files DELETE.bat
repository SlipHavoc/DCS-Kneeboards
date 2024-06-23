@echo off
rem
rem Renames all the built-in map kneeboard pages to remove them from the kneeboard.
rem NOTE ">nul 2>&1" redirects standard output to nul and standard error to standard output, see https://stackoverflow.com/a/32607539 .
rem

echo DELETING built-in map kneeboard pages...

copy "C:\Games\DCS World OpenBeta\Mods\terrains\Caucasus\Kneeboard\*.png" "C:\Games\DCS World OpenBeta\Mods\terrains\Caucasus\Kneeboard\*.old"
del /q "C:\Games\DCS World OpenBeta\Mods\terrains\Caucasus\Kneeboard\*.png"

copy "C:\Games\DCS World OpenBeta\Mods\terrains\Falklands\kneeboard\*.png" "C:\Games\DCS World OpenBeta\Mods\terrains\Falklands\kneeboard\*.old"
del /q "C:\Games\DCS World OpenBeta\Mods\terrains\Falklands\kneeboard\*.png"

rem NOTE Marianas doesn't have kneeboard map images.
rem copy "C:\Games\DCS World OpenBeta\Mods\terrains\MarianaIslands\kneeboard\*.png" "C:\Games\DCS World OpenBeta\Mods\terrains\MarianaIslands\kneeboard\*.old"
rem del /q "C:\Games\DCS World OpenBeta\Mods\terrains\MarianaIslands\kneeboard\*.png"

copy "C:\Games\DCS World OpenBeta\Mods\terrains\Nevada\Kneeboard\*.png" "C:\Games\DCS World OpenBeta\Mods\terrains\Nevada\Kneeboard\*.old"
del /q "C:\Games\DCS World OpenBeta\Mods\terrains\Nevada\Kneeboard\*.png"

copy "C:\Games\DCS World OpenBeta\Mods\terrains\Syria\kneeboard\*.png" "C:\Games\DCS World OpenBeta\Mods\terrains\Syria\kneeboard\*.old"
del /q "C:\Games\DCS World OpenBeta\Mods\terrains\Syria\kneeboard\*.png"

@pause
