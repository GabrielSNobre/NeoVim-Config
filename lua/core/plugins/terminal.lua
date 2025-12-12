return {
  {
    -- plugin local
    name = "term",
    dir = vim.fn.stdpath("config") .. "/lua/custom",
    init = function()
      require("custom.term").setup()
    end,
  }
}
