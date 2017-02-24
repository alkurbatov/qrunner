on run argv
	tell application "Safari"
		activate
		open location "https://docs.python.org/2/search.html?q=" & item 1 of argv
	end tell
end run
