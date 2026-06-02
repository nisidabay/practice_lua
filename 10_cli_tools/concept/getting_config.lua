#!/usr/bin/env lua
--
local config = {
	name = "GameServer",
	ports = { 8080, 8081, 8082 },
}

io.write("Parsing config file\n")
for _, port in ipairs(config.ports) do
	print("Getting port number: ", port)
end

for key, value in pairs(config) do
	if type(value) == "table" then
		io.write("Getting table:  ", key, " = { ")
		local first = true
		for _, v in ipairs(value) do
			if not first then
				io.write(", ")
			end
			io.write(tostring(v))
			first = false
		end
		io.write(" }\n")
	else
		io.write("Getting key values: ", key, "=", value)
		print()
	end
end
