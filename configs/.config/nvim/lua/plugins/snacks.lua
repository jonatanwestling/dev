return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          {
            section = "terminal",
            -- cmd = "chafa /Users/jonatanwestling/.config/nvim/creeper.png --format symbols --symbols vhalf --size 30x17 --stretch; sleep .1",
            cmd = "pokemon-colorscripts -n gengar --no-title; sleep .1",
            --cmd = "chafa Documents/jonis/wallpapers/chicken.png --format symbols --symbols vhalf --size 120x17 --stretch; sleep .1",
            height = 17,
            padding = 1,
            indent = 15,
          },
          {
            pane = 2,
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
      },
    },
  },
}
