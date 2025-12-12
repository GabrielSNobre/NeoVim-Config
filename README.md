# Neovim Configuration

This repository contains my personal Neovim configuration, organized
with **Lazy.nvim** and structured for clarity, modularity, and ease of
maintenance.\
Below is an overview of the folder tree and a description of what each
file does.

    .
    ├── init.lua
    ├── lazy-lock.json
    └── lua
        ├── core
        │   ├── init.lua
        │   ├── keymaps.lua
        │   ├── lazy.lua
        │   ├── options.lua
        │   └── plugins
        │       ├── lsp.lua
        │       ├── mason.lua
        │       ├── mini.lua
        │       ├── nvim-tree.lua
        │       └── terminal.lua
        └── custom
            └── term.lua

## 📌 **Main Files**

### **`init.lua`**

The entry point of the configuration. It: - Loads basic settings - Sets
the runtime path - Requires the main modules inside `lua/core`

## 📁 `lua/core/`

### **`core/init.lua`**

Responsible for importing all core modules: - `options.lua` -
`keymaps.lua` - `lazy.lua`

### **`core/options.lua`**

Contains general Neovim settings: - UI behavior - Tabs and indentation -
Search settings - Performance tweaks

### **`core/keymaps.lua`**

Defines global keybindings such as: - Window navigation\
- Buffer control\
- Plugin toggles

### **`core/lazy.lua`**

Configures **Lazy.nvim** and loads plugin definitions.

## 📁 `lua/core/plugins/`

### **`plugins/lsp.lua`**

LSP configuration including: - `nvim-lspconfig` - `blink.cmp`

### **`plugins/mason.lua`**

Handles external tools installation via Mason.

### **`plugins/mini.lua`**

Configures: - `mini.pairs` - `mini.pick` - `mini.statusline`

### **`plugins/nvim-tree.lua`**

Sets up the file explorer sidebar.

### **`plugins/terminal.lua`**

Loads the custom terminal plugin located in `lua/custom/term.lua`.

## 📁 `lua/custom/`

### **`custom/term.lua` --- Custom Terminal Plugin**

A personal custom terminal implementation with: - Two persistent
terminal sessions - Toggle functionality - Bottom-split layout -
Integration with `nvim-tree`
