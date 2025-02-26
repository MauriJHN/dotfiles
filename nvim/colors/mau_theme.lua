-- ~/.config/nvim/colors/my_custom_nord.lua

-- Define the modified Nord color palette with bluer accents and darker background
local colors = {
    nord0  = "#252a34", -- Darker background
    nord1  = "#2c313c", -- Darker than original
    nord2  = "#3B4252", -- Original
    nord3  = "#434C5E", -- Original
    nord4  = "#D8DEE9", -- Original foreground (lighter)
    nord5  = "#E5E9F0", -- Original
    nord6  = "#ECEFF4", -- Original
    nord7  = "#8FBCBB", -- Cyan
    nord8  = "#4FA3F7", -- Bluer (modified from original light cyan)
    nord9  = "#368adf", -- Bluer (modified from original blue)
    nord10 = "#2B6CBF", -- Darker, stronger blue (modified)
    nord11 = "#BF616A", -- Red (unchanged)
    nord12 = "#D08770", -- Orange (unchanged)
    nord13 = "#EBCB8B", -- Yellow (unchanged)
    nord14 = "#A3BE8C", -- Green (unchanged)
    nord15 = "#B48EAD", -- Purple (unchanged)
}

-- Utility function for applying highlights
local function highlight(group, fg, bg, style)
    local cmd = string.format("hi %s guifg=%s guibg=%s gui=%s", group, fg or "NONE", bg or "NONE", style or "NONE")
    vim.cmd(cmd)
end

-- Apply Nord colors to Neovim's highlight groups
local function apply_highlights()
    -- Editor UI
    highlight("Normal", colors.nord4, colors.nord0)         -- Normal text
    highlight("CursorLine", nil, colors.nord1)              -- Highlighted cursor line
    highlight("CursorLineNr", colors.nord8, colors.nord1)   -- Line number in the cursor line
    highlight("LineNr", colors.nord3, nil)                  -- Line numbers
    highlight("Visual", nil, colors.nord2)                  -- Visual selection

    -- Popup menu and completion menu
    highlight("Pmenu", colors.nord4, colors.nord1)          -- Popup menu background
    highlight("PmenuSel", colors.nord0, colors.nord8)       -- Popup menu selected item

    -- Syntax highlighting
    highlight("Comment", colors.nord3, nil, "italic")       -- Comments
    highlight("Constant", colors.nord7)                     -- Constants (e.g., numbers, booleans)
    highlight("String", colors.nord14)                      -- Strings
    highlight("Function", colors.nord9)                     -- Functions
    highlight("Identifier", colors.nord8)                   -- Identifiers
    highlight("Statement", colors.nord9)                    -- Statements (e.g., `if`, `return`)
    highlight("Keyword", colors.nord9, nil, "bold")         -- Keywords (e.g., `if`, `else`)
    highlight("Type", colors.nord7)                         -- Type declarations (e.g., `int`, `float`)
    highlight("Special", colors.nord13)                     -- Special characters or text
    highlight("Error", colors.nord11, nil, "bold")          -- Error messages
    highlight("Todo", colors.nord12, nil, "bold")           -- TODO comments

    -- Status Line and Tabline
    highlight("StatusLine", colors.nord4, colors.nord1)     -- Status line
    highlight("StatusLineNC", colors.nord3, colors.nord0)   -- Inactive status line
    highlight("TabLine", colors.nord4, colors.nord1)        -- Tab line
    highlight("TabLineFill", nil, colors.nord1)             -- Tab line background
    highlight("TabLineSel", colors.nord0, colors.nord8)     -- Active tab

    -- Git-related highlights
    highlight("DiffAdd", colors.nord14, colors.nord0)       -- Added lines
    highlight("DiffChange", colors.nord13, colors.nord0)    -- Changed lines
    highlight("DiffDelete", colors.nord11, colors.nord0)    -- Deleted lines
    highlight("DiffText", colors.nord9, colors.nord0)       -- Changed text

    -- LSP diagnostics
    highlight("DiagnosticError", colors.nord11)             -- Error diagnostics
    highlight("DiagnosticWarn", colors.nord13)              -- Warning diagnostics
    highlight("DiagnosticInfo", colors.nord8)               -- Information diagnostics
    highlight("DiagnosticHint", colors.nord7)               -- Hint diagnostics

    -- Search highlighting
    highlight("Search", colors.nord0, colors.nord8)         -- Highlight search matches
    highlight("IncSearch", colors.nord0, colors.nord9)      -- Incremental search matches
    highlight("MatchParen", colors.nord9, nil, "bold")      -- Matching parentheses
end

-- Apply the highlights when the theme is loaded
apply_highlights()



