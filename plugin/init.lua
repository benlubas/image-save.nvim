vim.api.nvim_create_user_command("SaveImage", require("image-save").save_nearby_image, {})
