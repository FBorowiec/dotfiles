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

function SwitchBetweenHeaderSource()
  local source_exts = { ".cpp", ".c", ".cxx" }
  local header_exts = { ".h", ".hpp", ".hxx" }

  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
  local filename = vim.fn.fnamemodify(current_file, ":t:r")
  local extension = vim.fn.fnamemodify(current_file, ":e")

  local is_header = vim.tbl_contains(header_exts, "." .. extension)
  local is_source = vim.tbl_contains(source_exts, "." .. extension)

  if not is_header and not is_source then
    print("Not a recognized C/C++ source or header file.")
    return
  end

  local dirs_to_search = { current_dir }
  if current_dir:find("/src") then
    table.insert(dirs_to_search, current_dir:gsub("/src", "/include"))
  elseif current_dir:find("/include") then
    table.insert(dirs_to_search, current_dir:gsub("/include", "/src"))
  else
    table.insert(dirs_to_search, current_dir .. "/src")
    table.insert(dirs_to_search, current_dir .. "/include")
  end

  local target_exts = is_header and source_exts or header_exts

  local possible_files = {}
  for _, dir in ipairs(dirs_to_search) do
    for _, ext in ipairs(target_exts) do
      local name = filename .. ext
      local filepath = dir .. "/" .. name
      table.insert(possible_files, filepath)
    end
  end

  for _, filepath in ipairs(possible_files) do
    if vim.fn.filereadable(filepath) == 1 then
      vim.api.nvim_command("edit " .. filepath)
      local file_name = vim.fn.fnamemodify(filepath, ":t")
      print("Switched to: " .. file_name)
      return
    end
  end

  print("Corresponding file not found.")
end
