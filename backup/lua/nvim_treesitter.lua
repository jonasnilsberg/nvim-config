require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true
  },
  rainbow = {
    enable = false,
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}
