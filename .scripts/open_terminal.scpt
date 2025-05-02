tell application "System Events"
	set frontApp to name of first application process whose frontmost is true
end tell

-- Get path from Finder or fallback to home
if frontApp is "Finder" then
	tell application "Finder"
		set finderPath to (insertion location as alias)
		set thePath to POSIX path of finderPath
	end tell
else
	set thePath to POSIX path of (path to home folder)
end if

-- Extract last path component
do shell script "basename " & quoted form of thePath
set folderName to the result

-- Open Terminal, new tab, cd, and set tab title
tell application "Terminal"
	activate
	tell application "System Events" to keystroke "t" using command down
	delay 0.2
	do script "cd " & quoted form of thePath & "; clear" in front window
	delay 0.2
	set custom title of selected tab of front window to folderName
end tell

