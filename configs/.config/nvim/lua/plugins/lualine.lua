return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local custom_theme = {
        normal = {
          a = { fg = "#0d1117", bg = "#58a6ff", gui = "bold" }, -- blue
          b = { fg = "#c9d1d9", bg = "#161b22" },
          c = { fg = "#c9d1d9", bg = "#21262d" },
        },
        insert = {
          a = { fg = "#0d1117", bg = "#3fb950", gui = "bold" }, -- green
          b = { fg = "#c9d1d9", bg = "#161b22" },
          c = { fg = "#c9d1d9", bg = "#21262d" },
        },
        visual = {
          a = { fg = "#0d1117", bg = "#d2a8ff", gui = "bold" }, -- purple
          b = { fg = "#c9d1d9", bg = "#161b22" },
          c = { fg = "#c9d1d9", bg = "#21262d" },
        },
        replace = {
          a = { fg = "#0d1117", bg = "#f85149", gui = "bold" }, -- red
          b = { fg = "#c9d1d9", bg = "#21262d" },
          c = { fg = "#c9d1d9", bg = "#161b22" },
        },
        command = {
          a = { fg = "#0d1117", bg = "#f2cc60", gui = "bold" }, -- yellow
          b = { fg = "#c9d1d9", bg = "#21262d" },
          c = { fg = "#c9d1d9", bg = "#161b22" },
        },
        inactive = {
          a = { fg = "#8b949e", bg = "#0d1117" },
          b = { fg = "#8b949e", bg = "#0d1117" },
          c = { fg = "#8b949e", bg = "#0d1117" },
        },
      }

      opts.options.theme = custom_theme
      opts.options.globalstatus = true
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }

      opts.sections.lualine_a = { "mode" }

      opts.sections.lualine_b = {
        { "branch", icon = "" },
        { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
        "diagnostics",
      }

      opts.sections.lualine_c = {
        {
          "filename",
          path = 0,
          symbols = { modified = "●", readonly = "🔒", unnamed = "[No Name]" },
        },
      }

      local macro_component = {
        "macro",
        fmt = function()
          local reg = vim.fn.reg_recording()
          if reg ~= "" then
            return "⏺ @" .. reg
          end
          return ""
        end,
        color = { fg = "#f2cc60", gui = "bold" },
        draw_empty = false,
      }

      opts.sections.lualine_x = {
        macro_component,
        "encoding",
        { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
        "filetype",
      }

      opts.sections.lualine_y = { "progress" }
      opts.sections.lualine_z = { "location" }
    end,
  },
}
