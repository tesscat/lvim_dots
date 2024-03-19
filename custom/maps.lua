-- KEY MAPPINGS

-- mappings for persistence
lvim.builtin.which_key.mappings["S"]= {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}


-- we bind snap to this, so we don't need it
-- fz is fuzzy
lvim.builtin.which_key.mappings["fz"] = lvim.builtin.which_key.mappings["f"]
lvim.builtin.which_key.mappings["f"] = {}

lvim.builtin.which_key.mappings["lg"] = {
    name = "Goto",
    d = {'<cmd>lua require"telescope.builtin".lsp_definitions()<cr>', "Go to definitions"},
    i = {'<cmd>lua require"telescope.builtin".lsp_implementations()<cr>', "Go to implementations"},
}
lvim.builtin.which_key.mappings["ln"] = {"<cmd>Neogen<cr>", "Generate doc-comment"}
