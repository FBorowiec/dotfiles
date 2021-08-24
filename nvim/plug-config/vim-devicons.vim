set guifont=DroidSansMono\ Nerd\ Font\ 11

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "zsh"
  },
  ['zshrc'] = {
    icon = "",
    color = "#428850",
    name = "zshrc"
  },
  ['inputrc'] = {
    icon = "",
    color = "#428850",
    name = "inputrc"
  },
  ['.gitconfig'] = {
    icon = '',
    color = '#e0cc75',
    name = 'gitconfig'
  },
  gitconfig = {
    icon = '',
    color = '#e0cc75',
    name = 'gitconfig'
  },
  ['.gitignore'] = {
    icon = '',
    color = '#e0cc75',
    name = 'gitignore'
  },
  gitignore = {
    icon = '',
    color = '#e0cc75',
    name = 'gitignore'
  },
  ['.lfsconfig'] = {
    icon = '',
    color = '#e0cc75',
    name = 'lfsconfig'
  },
  ['.gitlint'] = {
    icon = '',
    color = '#e0cc75',
    name = 'gitlint'
  },
  ['TODO'] = {
    icon = '',
    color = '#ffc0cb',
    name = 'TODO'
  },
  ['BUILD'] = {
    icon = '',
    color = '#008000',
    name = 'BUILD'
  },
  ['WORKSPACE'] = {
    icon = '',
    color = '#008000',
    name = 'WORKSPACE'
  },
  ['.bazeliskrc'] = {
    icon = '',
    color = '#008000',
    name = 'bazeliskrc'
  },
  ['.bazelrc'] = {
    icon = '',
    color = '#008000',
    name = 'bazelrc'
  },
  bazelrc = {
    icon = '',
    color = '#008000',
    name = 'bazelrc'
  },
  bzl = {
    icon = '',
    color = '#008000',
    name = 'bzl'
  },
  ['.bazelversion'] = {
    icon = '',
    color = '#008000',
    name = 'bazelversion'
  },
  txt = {
    icon = '',
    color = '#6B4683',
    name = 'txt'
  },
  ['version'] = {
    icon = '',
    color = '#6B4683',
    name = 'version'
  },
  config = {
    icon = '',
    color = '#6d8086',
    name = 'config'
  },
  ['.coveragerc'] = {
    icon = '',
    color = '#6d8086',
    name = 'coveragerc'
  },
  ['.pylintrc'] = {
    icon = '',
    color = '#6d8086',
    name = 'pylintrc'
  },
  ['Jenkinsfile'] = {
    icon = '',
    color = '#FFFFFF',
    name = 'Jenkinsfile'
  },
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF
