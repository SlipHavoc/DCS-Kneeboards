@echo off
rem
rem Makes a zip file of all the custom loadout files.
rem NOTE ">nul 2>&1" redirects standard output to nul and standard error to standard output, see https://stackoverflow.com/a/32607539 .
rem

echo Creating AllCustomLoadouts.7z archive...
del /q AllCustomLoadouts.7z
7z a AllCustomLoadouts.7z "%userprofile%\Saved Games\DCS.openbeta\MissionEditor\UnitPayloads\*" -r -mx9 >nul 2>&1

@pause
