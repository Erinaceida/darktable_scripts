local dt = require "darktable"

-- Collect t3mujin styles
local t3mujin_styles = {}
for _, name in ipairs(dt.styles.get_names()) do
  if name:lower():find("t3mujinpack") == 1 then
    table.insert(t3mujin_styles, name)
  end
end

-- Shortcut function
local function test_apply_first_t3mujin()
  local selection = dt.gui.selection()
  if #selection == 0 then
    dt.print("No images selected.")
    return
  end

  -- Print styles to confirm detection
  if #t3mujin_styles == 0 then
    dt.print("No t3mujin styles found.")
    return
  end

  local all_styles = table.concat(t3mujin_styles, ", ")
  dt.print("Styles: " .. all_styles)

  -- Apply only first style
  local first_style = t3mujin_styles[1]
  for _, image in ipairs(selection) do
    local copy = image:duplicate()
    if copy then
      dt.styles.apply(first_style, copy)
      dt.print("Applied style: " .. first_style)
    else
      dt.print("Failed to duplicate image.")
    end
  end
end

-- Register shortcut
dt.register_event("test_t3mujin_one", "shortcut",
  test_apply_first_t3mujin,
  "Duplicate and apply first t3mujinpack style"
)
