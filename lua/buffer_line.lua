vim.opt.termguicolors = true
require("bufferline").setup{
    options={
        numbers="ordinal",
        color_icons=true,
        diagnostics='nvim_lsp', 
        separator_style='thick',
        tab_size=30
    }
}
