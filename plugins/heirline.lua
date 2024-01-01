return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astronvim.utils.status")
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode  {
        -- enable mode text with padding as well as an icon before it
        mode_text = { icon = { kind = "VimIcon", padding = { right = 2, left = 2} } },
        -- surround the component with a separators
        surround = {
          -- it's a left element, so use the left separator
          -- separator = "left",
          separators = {'right', "left"},
          -- set the color of the surrounding based on the current mode using astronvim.utils.status module
          color = function() return { main = status.hl.mode_bg() } end,
        },

      },-- add the mode text
      status.component.git_branch {
        git_branch = {
          icon = { kind = "GitBranch", padding = { left = 3 } }
        }
      },
      status.component.file_info { filetype = {}, filename = false, file_modified = false },
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.treesitter(),
      status.component.nav(),
      -- remove the 2nd mode indicator on the right
    }

    -- return the final configuration table
    return opts
  end,
}
