# My Dotfiles

A robust, reproducible setup for Arch Linux & Hyprland.

## Structure

*   `bootstrap.sh`: The main entry point. Run this to install packages and deploy configs.
*   `configs/`: The "Source of Truth".
    *   `configs/.config/`: Folders here mirror `~/.config/`.
    *   `configs/.local/`: Folders here mirror `~/.local/`.
    *   `configs/.zshrc`: Copied to `~/.zshrc`.
*   `setup/`: Helper scripts.
    *   `install_packages.sh`: Installs Arch/AUR packages.
    *   `deploy_configs.sh`: **Wipes** local targets and copies from `configs/`.

## Usage

### 1. Fresh Install

```bash
git clone https://github.com/your/repo.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

### 2. Updating Configs

1.  Make changes in `~/dotfiles/configs/...`
2.  Run `./run` to apply them to your system.

### 3. Submodules (Neovim)

This repo uses **Git Submodules** for configurations that live in their own repositories (like `nvim`).
By default, `configs/.config/nvim` is linked to [jonatanwestling/nvim-config](https://github.com/jonatanwestling/nvim-config).

To change it to your own:

```bash
# 1. Deinit the current submodule
git submodule deinit -f configs/.config/nvim
git rm -f configs/.config/nvim

# 2. Add your own
git submodule add https://github.com/YOUR_USER/YOUR_REPO.git configs/.config/nvim
```

**WARNING:** Do not edit files in `~/.config/...` directly! They will be deleted the next time you run the deploy script. Always edit in `~/dotfiles/configs/` and redeploy.
