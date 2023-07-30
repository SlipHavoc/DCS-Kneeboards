rem
rem Put this in the DCS Input folder root (C:\Users\<username>\Saved Games\DCS.openbeta\Config\Input)
rem

@echo off

echo Don't run this unless you mean it...
@pause
exit rem Comment out this exit command when you actually want to run it.

rem NOTE No space around the =.
set oldJoystick=vJoy Device {2BAF4040-8E43-11ea-8005-444553540000}.diff.lua
set oldThrottle=vJoy Device {9DF9F050-8DA3-11ea-8002-444553540000}.diff.lua
rem set oldRudder=vJoy Device {7F7D9EA0-AC58-11ea-8002-444553540000}.diff.lua
set oldCollective=vJoy Device {1E540FC0-8E43-11ea-8003-444553540000}.diff.lua
rem oldSEM=

set newJoystick=vJoy Device {C6442630-209E-11ed-8002-444553540000}.diff.lua
set newThrottle=vJoy Device {9DF9F050-8DA3-11ea-8002-444553540000}.diff.lua
rem set newRudder=vJoy Device {95872130-0689-11ec-8008-444553540000}.diff.lua
set newCollective=vJoy Device {1E540FC0-8E43-11ea-8003-444553540000}.diff.lua
rem set newSEM=vJoy Device {2BAF4040-8E43-11ea-8005-444553540000}.diff.lua

rem Iterate through all the subfolders in current folder and do stuff with %%d.
for /D %%d in (./*) do (
	if exist "%%d\joystick\%oldJoystick%" (
		ren "%%d\joystick\%oldJoystick%" "TEMP_JOYSTICK.lua"
	)
rem	if exist "%%d\joystick\%oldThrottle%" (
rem		ren "%%d\joystick\%oldThrottle%" "TEMP_THROTTLE.lua"
rem	)
rem	if exist "%%d\joystick\%oldRudder%" (
rem		ren "%%d\joystick\%oldRudder%" "TEMP_RUDDER.lua"
rem	)
rem	if exist "%%d\joystick\%oldCollective%" (
rem		rem ren "%%d\joystick\%oldCollective%" "TEMP_COLLECTIVE.lua"
rem	)
)

rem Iterate through all the subfolders in current folder and do stuff with %%d.
for /D %%d in (./*) do (
	if exist "%%d\joystick\TEMP_JOYSTICK.lua" (
		ren "%%d\joystick\TEMP_JOYSTICK.lua" "%newJoystick%"
	)
rem	if exist "%%d\joystick\TEMP_THROTTLE.lua" (
rem		ren "%%d\joystick\TEMP_THROTTLE.lua" "%newThrottle%"
rem	)
rem	if exist "%%d\joystick\TEMP_RUDDER.lua" (
rem		ren "%%d\joystick\TEMP_RUDDER.lua" "%newRudder%"
rem	)
rem	if exist "%%d\joystick\TEMP_COLLECTIVE.lua" (
rem		rem ren "%%d\joystick\TEMP_COLLECTIVE.lua" "%newCollective%"
rem	)
)

@pause
