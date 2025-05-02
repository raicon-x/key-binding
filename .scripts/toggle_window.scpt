-- Set log file
set logFile to (POSIX path of (path to home folder)) & "toggle_window_simple.log"
set logText to ""

-- Get all visible apps (excluding background-only processes)
tell application "System Events"
	set visibleProcs to application processes whose background only is false
	set visibleApps to {}
	repeat with proc in visibleProcs
		set end of visibleApps to name of proc
	end repeat
end tell

set logText to logText & "Visible apps: " & visibleApps & linefeed

-- Check if any app is frontmost
set frontAppFound to false
tell application "System Events"
	repeat with proc in visibleProcs
		if frontmost of proc is true then
			set frontAppFound to true
			exit repeat
		end if
	end repeat
end tell

set logText to logText & "Front app found: " & frontAppFound & linefeed

-- If no app is frontmost, activate the top visible app
if frontAppFound is false then
	set appName to item 1 of visibleApps
	set logText to logText & "Activating: " & appName & linefeed
	do shell script "open -a " & quoted form of appName
end if

-- Write log
do shell script "echo " & quoted form of logText & " >> " & quoted form of logFile

