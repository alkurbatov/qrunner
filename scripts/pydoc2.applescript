on run argv
	tell application "Safari"
		activate
		open location "https://docs.python.org/2/search.html?q=" & argv
	end tell
end run
