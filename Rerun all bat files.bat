@echo off
rem
rem This copies all .png files from the airplane subfolders in the current folder to the matching airplane folders in DCS.  It will only copy if there is a matching folder in DCS.
rem NOTE ">nul 2>&1" redirects standard output to nul and standard error to standard output, see https://stackoverflow.com/a/32607539 .
rem

set /p "reply=Do you want to re-run all the bat files to regenerate all the PNGs?  WARNING: SLOW [y|n]: "
if /i not "%reply%" == "y" goto :eof

rem Iterate through all the subfolders in current folder and delete existing .png files from matching folder in DCS Kneeboard folder.
rem NOTE findstr doesn't like spaces in the search string, so I got lucky that the one I want to exclude I can do without a space...
for /f "delims=" %%f in ('dir /s /b Convert*.bat | findstr /v "Kneeboards\\Convert"') do (
	echo %%f
	echo Calling %%f ...
	rem call "%%f"
)

@pause
