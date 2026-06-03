# Coroutines — Cooperative Multitasking

coroutine.create, resume, yield — pipelines, producers, and schedulers.

## Quick Start

```bash
lua basic-coroutine.lua       # Simplest coroutine: create → resume
lua coroutine-1.lua           # yield and resume with values
lua producer_consumer.lua     # Producer → consumer pipeline
lua simulate_pipeline.lua     # Multi-stage data pipeline
lua task_scheduler.lua        # Simple cooperative scheduler
lua async_file_processing.lua # Simulated async with coroutines
lua monitor_sys_logs.lua      # Coroutine-based log monitor
```

## Common Patterns

```lua
-- Basic coroutine
local co = coroutine.create(function()
    print("step 1")
    coroutine.yield()
    print("step 2")
end)
coroutine.resume(co)  --> step 1
coroutine.resume(co)  --> step 2

-- Producer-consumer
local function producer()
    for i = 1, 3 do coroutine.yield(i) end
end
local co = coroutine.create(producer)
while coroutine.status(co) ~= "dead" do
    local _, val = coroutine.resume(co)
    if val then print("Got:", val) end
end

-- Pipeline: filter → transform → output
local function filter(source, pred)
    return coroutine.create(function()
        for val in source do
            if pred(val) then coroutine.yield(val) end
        end
    end)
end
```

## Now Build Your Own

Build a simple task scheduler that runs multiple coroutines round-robin.
