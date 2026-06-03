#!/usr/bin/env lua
--
-- Returning from the middle of a block
local function process_file_workflow(filename)
	print("Starting file processing for: " .. filename)

	-- Step 1: Validate input file
	do
		local is_valid_file = (filename ~= nil and #filename > 0)
		if not is_valid_file then
			print("Error: Invalid filename provided.")
			return false, "Invalid filename"
		end
		print("Step 1: File validation successful.")
	end

	-- Step 2: Simulate reading file content
	do
		local file_content = "Simulated content of " .. filename
		if string.len(file_content) < 10 then -- Simulate a condition for failure
			print("Error: File content too short.")
			return false, "File content too short"
		end
		print("Step 2: File content read successfully. Content length: " .. #file_content)
	end

	-- Step 3: Simulate processing content
	do
		local processed_data = "PROCESSED_" .. filename
		if string.find(processed_data, "ERROR") then -- Simulate another failure condition
			print("Error: Content processing failed.")
			return false, "Content processing failed"
		end
		print("Step 3: Content processed successfully.")
	end

	-- Step 4: Simulate writing output file
	do
		local output_filename = "output_" .. filename
		-- In a real scenario, this would involve file I/O
		print("Step 4: Output written to " .. output_filename)
	end

	print("File processing completed successfully for: " .. filename)
	return true, "Success"
end

-- Example usage:
local success, message = process_file_workflow("my_document.txt")
print("Workflow result: " .. tostring(success) .. ", Message: " .. message)

print("\n--- Testing with an invalid filename ---")
success, message = process_file_workflow("")
print("Workflow result: " .. tostring(success) .. ", Message: " .. message)

print("\n--- Testing with content too short (simulated) ---")
