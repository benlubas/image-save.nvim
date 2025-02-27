# image-save.nvim

An incredibly simple plugin that adds an easy command for saving
[3rd/image.nvim](https://github.com/3rd/image.nvim) images.



https://github.com/benlubas/image-save.nvim/assets/56943754/99ef6bba-b943-4e07-8414-657230ef779a



## Install

with Lazy:

```lua
{ "benlubas/image-save.nvim", cmd = "SaveImage" },
```

## Usage

The `:SaveImage` command will find the nearest image to your cursor in the current window, and either:
- Prompt you to save that image if no path is provided
- Save directly to the specified path if provided (e.g. `:SaveImage path/to/save.png`)

You can map this command to a key combination, for example:
```lua
vim.api.nvim_set_keymap('n', '<leader>is', ':SaveImage /tmp/test.png<CR>')
```

The command supports file path completion, so you can use <Tab> to complete paths.

The file path (whether entered in prompt or passed to command) is used in a `cp` command from the current working directory. So you can
pass `~/path/to/cwd/image.png` or just `image.png` and those are the same.

_Yes I know the command and the plugin title are 'backwards' :SaveImage makes more sense, but
save-image.nvim makes it seem like I'm some type of Messiah_

## Config

You do not need to call setup unless you want to enable the mouse menu option.

```lua
require("image-save").setup({
    -- Add a "Save Image" option to the Popup menu.
    -- This lets you "right click > save" an image.
    -- Will remove "How to Disable Mouse" from the Popup menu.
    enable_mouse = true
})
```

## Shameless Self Promotion

This plugin is made for use with the [molten-nvim](https://github.com/benlubas/molten-nvim) plugin
to allow users to easily save their plots/charts. Go check it out.
