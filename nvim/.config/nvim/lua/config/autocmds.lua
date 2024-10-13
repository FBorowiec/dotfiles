-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

function GoToBazelTarget()
  local line = vim.fn.getline(".")
  local target_pattern = "//%S+:%S+"
  local target = string.match(line, target_pattern)
  if target then
    local package_path = string.match(target, "//([^:]+)")
    local build_file_path = package_path .. "/BUILD"
    if vim.fn.filereadable(build_file_path) == 1 then
      vim.cmd("edit " .. build_file_path)
      print("Opened and switched to buffer: " .. build_file_path)
    else
      print("File not found: " .. build_file_path)
    end
  else
    print("No Bazel target found on this line")
  end
end
