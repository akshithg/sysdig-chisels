--[[
Copyright (C) 2013-2014 Draios inc.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-- Chisel description
description = "Sorthed list of the processes that use the most network bandwidth."
short_description = "Top processes by network I/O"
category = "Net"

-- Chisel argument list
args = {}

-- Initialization callback
function on_init()
	chisel.exec("table_generator", 
		"proc.name",
		"Process",
		"evt.rawarg.res",
		"Bytes",
		"(fd.type=ipv4 or fd.type=ipv6) and evt.is_io=true", 
		"100",
		"bytes")
		
	return true
end
