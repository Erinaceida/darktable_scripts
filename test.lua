local dt = require "darktable"

-- Hardcoded t3mujin styles (from your screenshots)
local t3mujin_styles = {
  "t3mujinpack - Color Slide_Kodak Ektachrome 100 G",
  "t3mujinpack - Color Negative_Kodak Portra 400",
  "t3mujinpack - Color Negative_Fuji Superia 100",
  -- add more here as needed...
}

-- Simple shortcut test
dt.register_event("shortcut", function()
  dt.print("Shortcut triggered!")

  local selection = dt.gui.selection()
  if #selection == 0 then
    dt.print("No images selected.")
    return
  end

  local img = selection[1]
  local duplicate = dt.database.duplicate(img)

  -- Print the full list of t3mujin styles
  for _, style in ipairs(t3mujin_styles) do
    dt.print_log("Found style: " .. style)
  end

  -- Apply just the first style
  local first_style = t3mujin_styles[1]
  dt.styles.apply(first_style, duplicate)
  dt.tags.attach(first_style, duplicate)
  dt.print("Applied style: " .. first_style)
end, "Apply first t3mujin style and print list")
