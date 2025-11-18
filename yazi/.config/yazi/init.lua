-- Yazi plugin initialization
-- This file is loaded after all plugins are loaded

-- Plugin: smart-enter
-- Automatically enter directories and extract archives with 'l' key
require("smart-enter"):setup({
	open_multi = false, -- Open multiple selected files (default: false)
})

-- Plugin: git
-- Git integration for file status indicators
require("git"):setup()

-- Plugin: full-border
-- Full border around yazi UI
require("full-border"):setup()

-- Plugin: vcs-files
-- Show only version control tracked files
-- No setup required, use 'vf' keybinding to toggle
