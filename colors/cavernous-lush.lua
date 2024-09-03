-- You probably always want to set this in your vim file
vim.opt.background = 'dark'
vim.g.colors_name = 'cavernous'

package.loaded['cavernous.cavernous'] = nil

-- include our theme file and pass it to lush to apply
require('lush')(require('cavernous.cavernous'))
