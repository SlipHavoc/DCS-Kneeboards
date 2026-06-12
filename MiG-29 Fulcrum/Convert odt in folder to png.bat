@echo off
rem
rem This calls OpenOffice command line to convert all .odt files in the current folder to .png files in the "pngs" subfolder.
rem

rem Delete the existing .png files.
del .\pngs\*.png

rem Iterate through all the .odt files in the current folder, calling OpenOffice on each one.
rem Use "for /R %%f..." for recursive searching for files in all subfolders
for %%f in (*.odt) do (
	echo Converting %%f ...
	rem echo "c:\Program Files\LibreOffice\program\swriter.exe" --headless --convert-to png --outdir .\pngs "%%f"
	"c:\Program Files\LibreOffice\program\swriter.exe" --headless --convert-to png --outdir .\pngs "%%f"
)
@pause
