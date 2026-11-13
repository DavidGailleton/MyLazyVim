# MyLazyVim

My Neovim configuration, built on [LazyVim](https://github.com/LazyVim/LazyVim) and forked from the [LazyVim starter](https://github.com/LazyVim/starter). I use it on NixOS for C, Python and Rust.

## What I changed from the starter

**LazyVim extras** (`lazyvim.json`): `lang.clangd`, `lang.python`, `lang.rust`, `lang.sql`, `lang.docker`, `lang.json`, `lang.markdown`, `lang.toml`, `lang.yaml`, `ai.claudecode`, `util.dot`.

**My plugin files** (`lua/plugins/`):

| File | What it does |
|---|---|
| `formatting.lua` | conform.nvim formatters: `black --line-length 79` for Python, `rustfmt` for Rust, `jq` for JSON, `clang-format` for C (the project's `.clang-format` if there is one, otherwise tabs of width 4, as the 42 norm asks) |
| `python.lua` | pyright and ruff; pyright picks up the project's `.venv` (uv projects) |
| `sql.lua` | `sqlfluff` with the PostgreSQL dialect |
| `image.lua` | Images shown inside kitty with snacks.nvim |
| `nix.lua` | Turns Mason off (see below) |

## NixOS: Mason is off

Mason downloads generic binaries that NixOS cannot run, and it puts them first on Neovim's `PATH`, where they hide the working ones. So Mason is disabled, and every language server, formatter and debugger comes from my Nix configuration instead.

On another distribution, delete `lua/plugins/nix.lua` to get Mason back.

## Install

Needs Neovim 0.11 or newer, git, and a [Nerd Font](https://www.nerdfonts.com/).

```sh
git clone https://github.com/DavidGailleton/MyLazyVim ~/.config/nvim
nvim
```

## License

Apache 2.0, as the LazyVim starter (see `LICENSE`).
