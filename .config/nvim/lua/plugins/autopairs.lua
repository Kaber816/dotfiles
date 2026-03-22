return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- lazy-load when entering insert mode
  opts = {
    disable_in_macro = true,           -- disable when recording/executing a macro
    disable_in_visualblock = false,    -- allow in visual block mode
    disable_in_replace_mode = true,    -- disable in replace mode
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=], -- ignore auto-close if next char is a word, %, quote, etc.
    enable_moveright = true,           -- move over closing bracket when pressing it
    enable_afterquote = true,          -- allow pairs after quotes
    enable_check_bracket_line = true,  -- don't auto-close if a closing bracket already exists on the line
    enable_bracket_in_quote = true,    -- allow brackets inside quotes
    enable_abbr = false,               -- don't trigger abbreviation
    break_undo = true,                 -- improve undo after pairs
    check_ts = false,                  -- set true if you want Tree-sitter aware pairs
    map_cr = true,                     -- map Enter inside brackets
    map_bs = true,                     -- map Backspace to delete pair
    map_c_h = false,                   -- don't map Ctrl-H
    map_c_w = false,                   -- don't map Ctrl-W
  },
}
