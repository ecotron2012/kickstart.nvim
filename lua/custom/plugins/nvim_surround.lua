local function gh(repo)
    return "https://github.com/" .. repo
end

-- TODO: Add VeryLazy loading
vim.pack.add{{src = gh "kylechui/nvim-surround", version = vim.version.range("^3.0.0")}}

-- return {
--     version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
--     event = "VeryLazy",
--     config = function()
--         require("nvim-surround").setup({
--             -- Configuration here, or leave empty to use defaults
--         })
--     end
-- }
