local dt = require "darktable"

local function duplicate_selected_images()
  local selection = dt.gui.selection()
  if #selection == 0 then
    dt.print("No images selected.")
    return
  end

  for _, image in ipairs(selection) do
    local copy = image:duplicate()
    if copy then
      dt.print("Duplicated: " .. image.filename)
    else
      dt.print("Failed to duplicate: " .. image.filename)
    end
  end
end

dt.register_event("duplicate_test", "shortcut",
  duplicate_selected_images,
  "Duplicate each selected image once"
)
