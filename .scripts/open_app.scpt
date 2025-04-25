on run argv
	set appName to item 1 of argv

	-- Open or activate the app reliably via shell
	do shell script "open -a " & quoted form of appName

	delay 0.5 -- allow app to load

	tell application "System Events"
		-- Explicitly click Dock icon to force raise window
		tell process "Dock"
			try
				click UI element appName of list 1
			end try
		end tell
	end tell
end run

