#!/usr/bin/lua
--
-- Simple task scheduler using coroutines
--

-- Define a task to simulate downloading a file
-- @param file The name of the file to download
local function downloadFile(file)
	for i = 1, 3 do
		print("Downloading " .. file .. ": " .. (i * 33) .. "% complete")
		coroutine.yield() -- Yield control back to the scheduler
	end
	print("Download complete: " .. file)
end

-- Define a task to simulate processing data
-- @param data The data to process
local function processData(data)
	for i = 1, 2 do
		print("Processing " .. data .. ": step " .. i)
		coroutine.yield() -- Yield control back to the scheduler
	end
	print("Processing complete: " .. data)
end

-- Task scheduler to manage and run tasks
-- @param tasks A list of tasks to run
local function taskScheduler(tasks)
	local taskQueue = {}
	for _, task in ipairs(tasks) do
		table.insert(taskQueue, coroutine.create(task))
	end

	while #taskQueue > 0 do
		local task = table.remove(taskQueue, 1)
		coroutine.resume(task)
		if coroutine.status(task) ~= "dead" then
			table.insert(taskQueue, task)
		end
	end
end

-- Define tasks
local tasks = {
	function()
		downloadFile("file1.txt")
	end,
	function()
		downloadFile("file2.txt")
	end,
	function()
		processData("data1")
	end,
	function()
		processData("data2")
	end,

}


-- Run the task scheduler
taskScheduler(tasks)
