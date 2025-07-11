local dt = require "darktable"

-- Collect all styles that belong to t3mujinpack
local t3mujin_styles = {}
for _, name in ipairs(dt.styles.get_names()) do
  if name:lower():find("t3mujinpack") == 1 then
    table.insert(t3mujin_styles, name)
  end
end

-- Function to duplicate and apply styles
local function apply_styles_to_image(image)
  for _, style in ipairs(t3mujin_styles) do
    local copy = image:duplicate() -- <-- corrected line
    dt.styles.apply(style, copy)
    dt.tags.attach(style, copy)
  end
end

-- Shortcut command
dt.register_event("apply_t3mujin_styles", "shortcut",
  function()
    local selection = dt.gui.selection()
    if #selection == 0 then
      dt.print("No images selected.")
      return
    end
    dt.print("Applying " .. #t3mujin_styles .. " styles to each selected image...")
    for _, img in ipairs(selection) do
      apply_styles_to_image(img)
    end
    dt.print("Done!")
  end,
  "Apply all t3mujinpack styles to selected images"
)
