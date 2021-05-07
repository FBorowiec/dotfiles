
" vnoremap <C-S-v> :!

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Within vscode
" single-key mapping
nnoremap <silent> <Space>x  :call VSCodeNotify('workbench.action.showCommands')<CR>
nnoremap <silent> <Space>.  :call VSCodeNotify('breadcrumbs.focusAndSelect')<CR>

" +action
vnoremap <silent> <Space>ac "+y
vnoremap <silent> <Space>ax "+d
nnoremap <silent> <Space>ap "+p

" +buffer
nnoremap <silent> <Space>bb :call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <silent> <Space>bk :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" +code
nnoremap <silent> <Space>cd :call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap <silent> <Space>ch :call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <silent> <Space>ci :call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
nnoremap <silent> <Space>cr :call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap <silent> <Space>cR :call VSCodeNotify('editor.action.rename')<CR>
nnoremap <silent> <Space>c, :call VSCodeNotify('editor.action.marker.previous')<CR>
nnoremap <silent> <Space>c. :call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap <silent> <Space>c[ :call VSCodeNotify('editor.action.marker.previousInFiles')<CR>
nnoremap <silent> <Space>c] :call VSCodeNotify('editor.action.marker.nextInFiles')<CR>

" +dired
nnoremap <silent> <Space>db :call VSCodeNotify('extension.dired.goUpDir')<CR>
nnoremap <silent> <Space>dc :call VSCodeNotify('extension.dired.copy')<CR>
nnoremap <silent> <Space>dC :call VSCodeNotify('extension.dired.createDir')<CR>
nnoremap <silent> <Space>dd :call VSCodeNotify('extension.dired.open')<CR>
nnoremap <silent> <Space>de :call VSCodeNotify('extension.dired.enter')<CR>
nnoremap <silent> <Space>dq :call VSCodeNotify('extension.dired.close')<CR>
nnoremap <silent> <Space>dr :call VSCodeNotify('extension.dired.refresh')<CR>
nnoremap <silent> <Space>dR :call VSCodeNotify('extension.dired.rename')<CR>
nnoremap <silent> <Space>ds :call VSCodeNotify('extension.dired.select')<CR>
nnoremap <silent> <Space>du :call VSCodeNotify('extension.dired.unselect')<CR>

" +evaluate/edit
nnoremap <silent> <Space>ec :call VSCodeNotify('code-runner.run')<CR>
nnoremap <silent> <Space>eq :call VSCodeNotify('code-runner.stop')<CR>
nnoremap <silent> <Space>ev :vs ~/.config/nvim/vscode/settings.vim<CR>

" +file
nnoremap <silent> <Space>fs :call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <silent> <Space>fz :call VSCodeNotify('workbench.action.toggleZenMode')<CR>

nnoremap <silent> <Space>gB :call VSCodeNotify('magit.blame-file')<CR>
nnoremap <silent> <Space>gg :call VSCodeNotify('magit.status')<CR>
nnoremap <silent> <Space>gS :call VSCodeNotify('magit.stage')<CR>
nnoremap <silent> <Space>gF :call VSCodeNotify('magit.fetching')<CR>
nnoremap <silent> <Space>gL :call VSCodeNotify('magit.logging')<CR>
nnoremap <silent> <Space>gb :call VSCodeNotify('magit.branching')<CR>
nnoremap <silent> <Space>gy :call VSCodeNotify('magit.remoting')<CR>
nnoremap <silent> <Space>gh :call VSCodeNotify('magit.help')<CR>
nnoremap <silent> <Space>gg :call VSCodeNotify('magit.status')<CR>

" +help
nnoremap <silent> <Space>hk :call VSCodeNotify('workbench.action.openGlobalKeybindings')<CR>

" +insert
nnoremap <silent> <Space>ic :r !<right>  
nnoremap <silent> <Space>id :r ! date<CR>
nnoremap <silent> <Space>if :r %f<CR>

" +misc

" +open
nnoremap <silent> <Space>ot :call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>

" +project
" ++ cmake
" nnoremap <silent> <Space>pcb :call VSCodeNotify('cmake.build')<CR>
" nnoremap <silent> <Space>pcB :call VSCodeNotify('cmake.outline.cleanRebuild')<CR>
" nnoremap <silent> <Space>pcc :call VSCodeNotify('cmake.configure')<CR>
" nnoremap <silent> <Space>pcC :call VSCodeNotify('cmake.outline.clean')<CR>
" nnoremap <silent> <Space>pch :call VSCodeNotify('cmake.onlineHelp')<CR>
" nnoremap <silent> <Space>pci :call VSCodeNotify('cmake.install')<CR>
" nnoremap <silent> <Space>pcl :call VSCodeNotify('cmake.launchTarget')<CR>
" nnoremap <silent> <Space>pcL :call VSCodeNotify('cmake.viewLog')<CR>
" nnoremap <silent> <Space>pco :call VSCodeNotify('cmake.outline.revealInCMakeLists')<CR>
" nnoremap <silent> <Space>pcq :call VSCodeNotify('cmake.outline.stop')<CR>
" nnoremap <silent> <Space>pcr :call VSCodeNotify('cmake.cleanConfigure')<CR>
" nnoremap <silent> <Space>pcs :call VSCodeNotify('cmake.selectActiveFolder')<CR>
" nnoremap <silent> <Space>pcS :call VSCodeNotify('cmake.selectKit')<CR>
" nnoremap <silent> <Space>pct :call VSCodeNotify('cmake.ctest')<CR>

" nnoremap <silent> <Space>pcb :call VSCodeNotify('cmake.build')<CR>
" nnoremap <silent> <Space>pcB :call VSCodeNotify('cmake.outline.cleanRebuild')<CR>
" nnoremap <silent> <Space>pcc :call VSCodeNotify('cmake.configure')<CR>
" nnoremap <silent> <Space>pcC :call VSCodeNotify('cmake.outline.clean')<CR>
" nnoremap <silent> <Space>pch :call VSCodeNotify('cmake.onlineHelp')<CR>
" nnoremap <silent> <Space>pci :call VSCodeNotify('cmake.install')<CR>
" nnoremap <silent> <Space>pcl :call VSCodeNotify('cmake.launchTarget')<CR>
" nnoremap <silent> <Space>pcL :call VSCodeNotify('cmake.viewLog')<CR>
" nnoremap <silent> <Space>pco :call VSCodeNotify('cmake.outline.revealInCMakeLists')<CR>
" nnoremap <silent> <Space>pcq :call VSCodeNotify('cmake.outline.stop')<CR>
" nnoremap <silent> <Space>pcr :call VSCodeNotify('cmake.cleanConfigure')<CR>
" nnoremap <silent> <Space>pcs :call VSCodeNotify('cmake.selectActiveFolder')<CR>
" nnoremap <silent> <Space>pcS :call VSCodeNotify('cmake.selectKit')<CR>
" nnoremap <silent> <Space>pct :call VSCodeNotify('cmake.ctest')<CR>

" ++ docker

" ++ latex
nnoremap <silent> <Space>plb :call VSCodeNotify('latex-workshop.build')<CR>
nnoremap <silent> <Space>plc :call VSCodeNotify('latex-workshop.clean')<CR>
nnoremap <silent> <Space>plv :call VSCodeNotify('latex-workshop.view')<CR>

" +quit
nnoremap <silent> <Space>qa :call VSCodeNotify('workbench.action.closeAllEditors')<CR>
nnoremap <silent> <Space>qr :call VSCodeNotify('workbench.action.reloadWindow')<CR>

" +register

" +search
nnoremap <silent> <Space>sff :call VSCodeNotify('fzf-quick-open.runFzfFilePwd')<CR>
nnoremap <silent> <Space>sfs :call VSCodeNotify('fzf-quick-open.runFzfSearchPwd')<CR>
nnoremap <silent> <Space>sw  :call VSCodeNotify('search.action.openNewEditorToSide')<CR>

" +toggle
nnoremap <silent> <Space>td :call VSCodeNotify('C_Cpp.SwitchHeaderSource')<CR>
nnoremap <silent> <Space>to :call VSCodeNotify('workbench.action.output.toggleOutput')<CR>
nnoremap <silent> <Space>tp :call VSCodeNotify('workbench.actions.view.toggleProblems')<CR>
nnoremap <silent> <Space>tw :call VSCodeNotify('workbench.action.toggleEditorGroupLayout')<CR>

" +window
" nnoremap <silent> <Space>wb <C-^>
nnoremap <silent> <Space>wc :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <silent> <Space>wm :call VSCodeNotify('workbench.action.maximizeEditor')<CR>
nnoremap <silent> <Space>ws :call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap <silent> <Space>wt :call VSCodeNotify('workbench.action.toggleEditorGroupLayout')<CR>
nnoremap <silent> <Space>wv :call VSCodeNotify('workbench.action.splitEditorRight')<CR>
" nnoremap <silent> <Space>wh <C-W>h
" nnoremap <silent> <Space>wj <C-W>j
" nnoremap <silent> <Space>wk <C-W>k
" nnoremap <silent> <Space>wl <C-W>l
" nnoremap <silent> <Space>ws <C-W>s
" nnoremap <silent> <Space>wv <C-W>v
" nnoremap <silent> <Space>ww <C-W>w
" nnoremap <silent> <Space>w- <C-W>s
" nnoremap <silent> <Space>w| <C-W>v
" nnoremap <silent> <Space>w= <C-W>=
" nnoremap <silent> <Space>w2 <C-W>v
