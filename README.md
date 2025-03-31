## Cavernous

A bright colorscheme made by and for me. This plugin currently does not support
user customization.

I have always been frustrated that colorschemes have a "vibe" color.
Gruvbox is a bit orange-brown and tokyonight is a bit blue-green. This
is probably a good choice from a color theory perspective, but it
often lead to me getting tired of that particular color over a long 
programming session. 

Cavernous was created with the following goals in mind: 

1) When looking at an average page of code, no color should stick out as being the "main" color
2) Each token should be surrounded by a token of a significantly different color, where possible
3) Avoid pure white tokens

# Samples

The goals were accomplished with limited success. Some compromises were necessary, especially for 
delimiters. Cavernous relies pretty heavily on semantic tokens, so your mileage may vary depending 
on the language server used and if you have semantic tokens enabled in Neovim.

The background is from Hyprland. The font is Berkeley Mono.

## Rust

![image](https://github.com/user-attachments/assets/ed0e3c8e-2d23-4a30-9a77-1f892546a51e)

## Lua (pico8-ls)

![image](https://github.com/user-attachments/assets/20ee59c1-3dbf-4216-95ae-4f61938cfd93)

## C++

![image](https://github.com/user-attachments/assets/ea9a7d99-816a-49ea-bac6-f82a6de4f646)

# Setup

## Lazy.nvim

```lua
{
    "shakesbeare/cavernous.nvim",
    name = "cavernous",
    config = function()
        vim.cmd[[colorscheme cavernous]]
    end
}

```

# Contributing

Because of the reliance on semantic tokens, performance between languages may vary fairly significantly. 
If your favorite language doesn't look very good and you like Cavernous, feel free to submit a PR to add
some token highlights for it. 

