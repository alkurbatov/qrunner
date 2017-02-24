on run argv
	tell application "Safari"
		activate
		open location "https://translate.yandex.ru/?lang=en-ru&text=" & argv
	end tell
end run
