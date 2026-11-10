-- NixOS: every LSP, formatter, linter, tree-sitter CLI and codelldb comes from
-- home-manager (/etc/nixos/home/dgaillet/home.nix). Mason downloads generic
-- dynamically linked binaries that NixOS can't run, and it prepends its bin dir
-- to PATH, shadowing the working Nix ones. So Mason is disabled entirely.
return {
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
}
