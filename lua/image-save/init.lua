local M = {}

local default_config = {
  enable_mouse = false,
}

M.setup = function(opts)
  local config = vim.tbl_deep_extend("force", default_config, opts)

  if config.enable_mouse then
    pcall(vim.cmd.aunmenu, "PopUp.How-to\\ disable\\ mouse")
    pcall(vim.cmd.aunmenu, "PopUp.How-to\\ disable\\ mouse")
    pcall(vim.cmd.aunmenu, "PopUp.-1-")
    vim.cmd.menu("PopUp.Save\\ Image :SaveImage<CR>")
  end
end

M.save_as = function(path)
  vim.schedule(function()
    vim.ui.input({ prompt = "Path to saved image:\n", completion = "file" }, function(save_to)
      if save_to then
        os.execute("cp " .. path .. " " .. save_to)
      else
        vim.notify("Aborting image save", vim.log.levels.INFO)
      end
    end)
  end)
end

M.save_nearby_image = function()
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_get_current_buf()

  local row = vim.api.nvim_win_get_cursor(win)[1]

  local closest_img = nil
  local closest_distance = math.huge
  for _, img in ipairs(require("image").get_images({ window = win, buffer = buf })) do
    if img.is_rendered then
      local ig = img.rendered_geometry
      local d = math.min(math.abs(ig.y - row), math.abs((ig.y + ig.height) - row))
      if d < closest_distance then
        closest_img = img
        closest_distance = d
      end
    end
  end

  if not closest_img then
    vim.notify("couldn't find image to save", vim.log.levels.WARN)
    return
  end

  M.save_as(closest_img.path)
end

return M
