on run argv
	tell application "Safari"
		activate
		open location "https://www.google.ru/?q=" & item 1 of argv
	end tell
end run