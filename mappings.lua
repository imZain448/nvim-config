-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
--
-- vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function() require("vim-with-me").StartVimWithMe() end)
vim.keymap.set("n", "<leader>svwm", function() require("vim-with-me").StopVimWithMe() end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- trouble  keymaps Lua
vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open "workspace_diagnostics" end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open "document_diagnostics" end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open "quickfix" end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open "loclist" end)
vim.keymap.set("n", "gR", function() require("trouble").open "lsp_references" end)
vim.keymap.set("n", "xt", "<cmd>TodoTrouble cwd $pwd<CR>")

-- INFO: key bindings for hop.nvim
vim.keymap.set("n", "<leader><leader>s", "<cmd>HopWord<CR>")
vim.keymap.set("n", "<leader><leader>/", "<cmd>HopPattern<CR>")
vim.keymap.set("n", "<leader><leader>l", "<cmd>HopLine<CR>")
vim.keymap.set("n", "<leader><leader>v", "<cmd>HopVertical<CR>")
vim.keymap.set("n", "<leader><leader>c", "<cmd>HopChar1<CR>")

-- doge document generator
-- vim.keymap.set('n' , '<leader>vd' , function() require('doge').open('doge-generate') end)

-- keybinding for noice dismiss notification
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "dismiss all notifications" })

-- TODO: add key bindings for lsp
--
--
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },
    -- mapping for chatgpt
    ["<leader>A"] = { name = "chatgpt" },
    ["<leader>Ac"] = { "<cmd>chatgpt<cr>", desc = "chatgpt" },
    ["<leader>Ae"] = { "<cmd>chatgpteditwithinstruction<cr>", desc = "edit with instruction" },
    ["<leader>Ag"] = { "<cmd>chatgptrun grammar_correction<cr>", desc = "grammar correction" },
    ["<leader>At"] = { "<cmd>chatgptrun translate<cr>", desc = "translate" },
    ["<leader>Ak"] = { "<cmd>chatgptrun keywords<cr>", desc = "keywords" },
    ["<leader>Ad"] = { "<cmd>chatgptrun docstring<cr>", desc = "docstring" },
    ["<leader>Aa"] = { "<cmd>chatgptrun add_tests<cr>", desc = "add tests" },
    ["<leader>Ao"] = { "<cmd>chatgptrun optimize_code<cr>", desc = "optimize code" },
    ["<leader>As"] = { "<cmd>chatgptrun summarize<cr>", desc = "summarize" },
    ["<leader>Af"] = { "<cmd>chatgptrun fix_bugs<cr>", desc = "fix bugs" },
    ["<leader>Ax"] = { "<cmd>chatgptrun explain_code<cr>", desc = "explain code" },
    ["<leader>Ar"] = { "<cmd>chatgptrun roxygen_edit<cr>", desc = "roxygen edit" },
    ["<leader>Al"] = { "<cmd>chatgptrun code_readability_analysis<cr>", desc = "code readability analysis" },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- mapping for chatGPT
    ["<leader>A"] = { name = "chatGPT" },
    ["<leader>Ac"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
    ["<leader>Ae"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
    ["<leader>Ag"] = { "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
    ["<leader>At"] = { "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
    ["<leader>Ak"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
    ["<leader>Ad"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
    ["<leader>Aa"] = { "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
    ["<leader>Ao"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
    ["<leader>As"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
    ["<leader>Af"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
    ["<leader>Ax"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
    ["<leader>Ar"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    ["<leader>Al"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
  },
}
