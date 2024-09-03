local opt = {
  number = true,
  relativenumber = false,
  laststatus = 0,
  cursorline = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,
  clipboard = "unnamedplus",
  wrap = true,
}

for k, v in pairs(opt) do
  vim.opt[k] = v
end
