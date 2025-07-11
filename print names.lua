local dt = require "darktable"

local function print_t3mujin_styles()
  local all_styles = dt.styles.get_names()
  local found = {}

  for _, name in ipairs(all_styles) do
    if name:lower():find("t3mujinpack") == 1 then
      table.insert(found, name)
    end
  end

  if #found == 0 then
    dt.print("No t3mujin styles found.")
  else
    dt.print("Found " .. #found .. " t3mujin styles.")
    for _, style in ipairs(found) do
      dt.print(style)
    end
  end
end

dt.register_event("list_t3mujin_styles", "shortcut",
  print_t3mujin_styles,
  "Print available t3mujin styles"
)
