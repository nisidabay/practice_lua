-- Stateful iterator with custom state
local function custom_iterator()
	local state = "initial"
	return function()
		if state == "initial" then
			state = "first"
			return "Step 1"
		elseif state == "first" then
			state = "second"
			return "Step 2"
		elseif state == "second" then
			state = "done"
			return "Step 3"
		else
			return nil -- Iterator is done
		end
	end
end

-- Usage:
local next_step = custom_iterator()
print(next_step()) -- Output: Step 1
print(next_step()) -- Output: Step 2
print(next_step()) -- Output: Step 3
print(next_step()) -- Output: nil (end of iteration)
