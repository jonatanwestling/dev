return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          {
            section = "terminal",
            cmd = (function()
              local poke = vim.fn.exepath("pokemon-colorscripts")
              if poke == "" then
                -- fallback command:
                return "echo 'pokemon-colorscripts not found'; sleep 1"
              else
                return poke .. " -r --no-title; sleep .1"
              end
            end)(),
            height = 17,
            padding = 1,
            indent = 15,
          },
          {
            pane = 2,
            { section = "keys",   gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
      },
    },
  },
}
