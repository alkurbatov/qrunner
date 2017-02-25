(*
	For additional details please visit
	https://www.iterm2.com/documentation-scripting.html
*)
on run argv
	tell application "iTerm"
		activate
		select first window

		tell current window
			tell current session
				write text argv
			end tell
		end tell
	end tell
end run
