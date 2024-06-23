@echo off
rem
rem Renames all the built-in map kneeboard pages to remove them from the kneeboard.
rem NOTE ">nul 2>&1" redirects standard output to nul and standard error to standard output, see https://stackoverflow.com/a/32607539 .
rem

echo RESTORING built-in map kneeboard pages...
rename "C:\Games\DCS World OpenBeta\Mods\terrains\Caucasus\Kneeboard\*.old" *.png
rename "C:\Games\DCS World OpenBeta\Mods\terrains\Falklands\kneeboard\*.old" *.png
rem rename "C:\Games\DCS World OpenBeta\Mods\terrains\MarianaIslands\kneeboard\*.old" *.png
rename "C:\Games\DCS World OpenBeta\Mods\terrains\Nevada\Kneeboard\*.old" *.png
rename "C:\Games\DCS World OpenBeta\Mods\terrains\Syria\kneeboard\*.old" *.png

@pause
