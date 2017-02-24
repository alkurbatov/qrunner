on run argv
	tell application "Safari"
		activate
		open location "https://www.google.ru/?q=" & argv
	end tell
end run