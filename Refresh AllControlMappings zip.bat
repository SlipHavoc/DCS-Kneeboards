@echo off
rem
rem Makes a zip file of all the control mapping files.
rem NOTE ">nul 2>&1" redirects standard output to nul and standard error to standard output, see https://stackoverflow.com/a/32607539 .
rem

echo Creating AllControlMappings.7z archive...
del /q AllControlMappings.7z
7z a AllControlMappings.7z "%userprofile%\Saved Games\DCS.openbeta\Config\Input\*" -r -mx9 >nul 2>&1

@pause
