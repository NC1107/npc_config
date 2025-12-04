# NPC Config

Working on building up my config so that i can clone it down on new machines instead of starting from stratch

## Contents

- `nvim/` - Neovim configuration
- `kitty/` - Kitty terminal configuration

## Setup

### Neovim
```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Create symlink
ln -s ~/Documents/personal_projects/npc_config/nvim ~/.config/nvim
```

### Kitty
```bash
# Backup existing config (if any)
mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup

# Create symlink
ln -s ~/Documents/personal_projects/npc_config/kitty/kitty.conf ~/.config/kitty/kitty.conf
```
