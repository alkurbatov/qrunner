(*
 This file is a part of QRunner project

 Copyright (C) 2017, Alexander Kurbatov <sir.alkurbatov@yandex.ru>

 QRunner is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 QRunner is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>.
*)

on run argv
	tell application "Safari"
		activate
		open location "https://jira.sw.ru/browse/" & argv
	end tell
end run
