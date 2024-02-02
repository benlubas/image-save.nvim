# image-save.nvim

An incredibly simple plugin that adds an easy command for saving
[3rd/image.nvim](https://github.com/3rd/image.nvim) images.

## Install

with Lazy:

```lua
{ "benlubas/image-save.nvim", cmd = "SaveImage" },
```

## Usage

The `:SaveImage` will find the nearest image to your cursor in the current window, and prompt you to
save that image.

The file path you enter is used in a `cp` command from the current wording directory. So you can
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
