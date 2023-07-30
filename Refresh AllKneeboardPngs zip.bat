@echo off
rem
rem Makes a zip file of all the kneeboard pngs.
rem NOTE ">nul 2>&1" redirects standard output to nul and standard error to standard output, see https://stackoverflow.com/a/32607539 .
rem

echo Creating AllKneeboardPngs.7z archive...
del /q AllKneeboardPngs.7z
7z a AllKneeboardPngs.7z "%userprofile%\Saved Games\DCS.openbeta\Kneeboard\*.png" -r -mx9 >nul 2>&1
rem 7z u AllKneeboardPngs.7z "%userprofile%\Saved Games\DCS.openbeta\Kneeboard\*.png" -r -mx9 rem >nul 2>&1

@pause
