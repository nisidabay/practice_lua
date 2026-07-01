-- Lua 5.4+ project
std = "lua54"

-- Ignore unused args in concept files (they're often partial examples)
ignore = {
  "212",  -- unused argument
}

-- No global variables allowed by default
read_globals = {}
