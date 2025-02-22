vim.api.nvim_create_user_command("SaveImage", function(opts)
  require("image-save").save_nearby_image(opts.args)
end, {
  nargs = "?",
  complete = "file"
})
