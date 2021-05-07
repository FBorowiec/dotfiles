" Basic Key-bindings

" Better indenting
vnoremap < <gv
vnoremap > >gv

" alias for 'escape' to NORMAL from INSERT
inoremap klk <Esc>

" insert stuff
nnoremap <Space>ic :r!<right>

" select whole word
nnoremap ,w viw

" Explore
nnoremap <Space>. :Sex!<CR>
nnoremap <Space><Space> :Files<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" move lines using 'Alt', vscode-like
nnoremap <M-Up> :move -2<CR>
nnoremap <M-Down> :move +1<CR>

" close brackets
" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap [ []<left>
" inoremap ' ''<left>

" xsel commands
nnoremap <Space>avv "+p
nnoremap <Space>acc V"+y
nnoremap <Space>axx V"+d
vnoremap <Space>avv "+p
vnoremap <Space>acc "+y
vnoremap <Space>axx "+d

nnoremap <Space>acq V"qy
nnoremap <Space>acw V"wy
nnoremap <Space>ace V"ey
nnoremap <Space>acr V"ry
nnoremap <Space>act V"ty
nnoremap <Space>acy V"yy
nnoremap <Space>acu V"uy
nnoremap <Space>aci V"iy
nnoremap <Space>aco V"oy
nnoremap <Space>acp V"py
nnoremap <Space>aca V"ay
nnoremap <Space>acs V"sy
nnoremap <Space>acd V"dy
nnoremap <Space>acf V"fy
nnoremap <Space>acg V"gy
nnoremap <Space>ach V"hy
nnoremap <Space>acj V"jy
nnoremap <Space>ack V"ky
nnoremap <Space>acl V"ly

nnoremap <Space>acQ V"Qy
nnoremap <Space>acW V"Wy
nnoremap <Space>acE V"Ey
nnoremap <Space>acR V"Ry
nnoremap <Space>acT V"Ty
nnoremap <Space>acY V"Yy
nnoremap <Space>acU V"Uy
nnoremap <Space>acI V"Iy
nnoremap <Space>acO V"Oy
nnoremap <Space>acP V"Py
nnoremap <Space>acA V"Ay
nnoremap <Space>acS V"Sy
nnoremap <Space>acD V"Dy
nnoremap <Space>acF V"Fy
nnoremap <Space>acG V"Gy
nnoremap <Space>acH V"Hy
nnoremap <Space>acJ V"Jy
nnoremap <Space>acK V"Ky
nnoremap <Space>acL V"Ly

vnoremap <Space>acq "qy
vnoremap <Space>acw "wy
vnoremap <Space>ace "ey
vnoremap <Space>acr "ry
vnoremap <Space>act "ty
vnoremap <Space>acy "yy
vnoremap <Space>acu "uy
vnoremap <Space>aci "iy
vnoremap <Space>aco "oy
vnoremap <Space>acp "py
vnoremap <Space>aca "ay
vnoremap <Space>acs "sy
vnoremap <Space>acd "dy
vnoremap <Space>acf "fy
vnoremap <Space>acg "gy
vnoremap <Space>ach "hy
vnoremap <Space>acj "jy
vnoremap <Space>ack "ky
vnoremap <Space>acl "ly

vnoremap <Space>acQ "Qy
vnoremap <Space>acW "Wy
vnoremap <Space>acE "Ey
vnoremap <Space>acR "Ry
vnoremap <Space>acT "Ty
vnoremap <Space>acY "Yy
vnoremap <Space>acU "Uy
vnoremap <Space>acI "Iy
vnoremap <Space>acO "Oy
vnoremap <Space>acP "Py
vnoremap <Space>acA "Ay
vnoremap <Space>acS "Sy
vnoremap <Space>acD "Dy
vnoremap <Space>acF "Fy
vnoremap <Space>acG "Gy
vnoremap <Space>acH "Hy
vnoremap <Space>acJ "Jy
vnoremap <Space>acK "Ky
vnoremap <Space>acL "Ly

nnoremap <Space>axq V"qd
nnoremap <Space>axw V"wd
nnoremap <Space>axe V"ed
nnoremap <Space>axr V"rd
nnoremap <Space>axt V"td
nnoremap <Space>axy V"yd
nnoremap <Space>axu V"ud
nnoremap <Space>axi V"id
nnoremap <Space>axo V"od
nnoremap <Space>axp V"pd
nnoremap <Space>axa V"ad
nnoremap <Space>axs V"sd
nnoremap <Space>axd V"dd
nnoremap <Space>axf V"fd
nnoremap <Space>axg V"gd
nnoremap <Space>axh V"hd
nnoremap <Space>axj V"jd
nnoremap <Space>axk V"kd
nnoremap <Space>axl V"ld

nnoremap <Space>axQ V"Qd
nnoremap <Space>axW V"Wd
nnoremap <Space>axE V"Ed
nnoremap <Space>axR V"Rd
nnoremap <Space>axT V"Td
nnoremap <Space>axY V"Yd
nnoremap <Space>axU V"Ud
nnoremap <Space>axI V"Id
nnoremap <Space>axO V"Od
nnoremap <Space>axP V"Pd
nnoremap <Space>axA V"Ad
nnoremap <Space>axS V"Sd
nnoremap <Space>axD V"Dd
nnoremap <Space>axF V"Fd
nnoremap <Space>axG V"Gd
nnoremap <Space>axH V"Hd
nnoremap <Space>axJ V"Jd
nnoremap <Space>axK V"Kd
nnoremap <Space>axL V"Ld

vnoremap <Space>axq "qd
vnoremap <Space>axw "wd
vnoremap <Space>axe "ed
vnoremap <Space>axr "rd
vnoremap <Space>axt "td
vnoremap <Space>axy "yd
vnoremap <Space>axu "ud
vnoremap <Space>axi "id
vnoremap <Space>axo "od
vnoremap <Space>axp "pd
vnoremap <Space>axa "ad
vnoremap <Space>axs "sd
vnoremap <Space>axd "dd
vnoremap <Space>axf "fd
vnoremap <Space>axg "gd
vnoremap <Space>axh "hd
vnoremap <Space>axj "jd
vnoremap <Space>axk "kd
vnoremap <Space>axl "ld

vnoremap <Space>axQ "Qd
vnoremap <Space>axW "Wd
vnoremap <Space>axE "Ed
vnoremap <Space>axR "Rd
vnoremap <Space>axT "Td
vnoremap <Space>axY "Yd
vnoremap <Space>axU "Ud
vnoremap <Space>axI "Id
vnoremap <Space>axO "Od
vnoremap <Space>axP "Pd
vnoremap <Space>axA "Ad
vnoremap <Space>axS "Sd
vnoremap <Space>axD "Dd
vnoremap <Space>axF "Fd
vnoremap <Space>axG "Gd
vnoremap <Space>axH "Hd
vnoremap <Space>axJ "Jd
vnoremap <Space>axK "Kd
vnoremap <Space>axL "Ld

nnoremap <Space>avq "qp
nnoremap <Space>avw "wp
nnoremap <Space>ave "ep
nnoremap <Space>avr "rp
nnoremap <Space>avt "tp
nnoremap <Space>avy "yp
nnoremap <Space>avu "up
nnoremap <Space>avi "ip
nnoremap <Space>avo "op
nnoremap <Space>avp "pp
nnoremap <Space>ava "ap
nnoremap <Space>avs "sp
nnoremap <Space>avd "dp
nnoremap <Space>avf "fp
nnoremap <Space>avg "gp
nnoremap <Space>avh "hp
nnoremap <Space>avj "jp
nnoremap <Space>avk "kp
nnoremap <Space>avl "lp

nnoremap <Space>avQ "Qp
nnoremap <Space>avW "Wp
nnoremap <Space>avE "Ep
nnoremap <Space>avR "Rp
nnoremap <Space>avT "Tp
nnoremap <Space>avY "Yp
nnoremap <Space>avU "Up
nnoremap <Space>avI "Ip
nnoremap <Space>avO "Op
nnoremap <Space>avP "Pp
nnoremap <Space>avA "Ap
nnoremap <Space>avS "Sp
nnoremap <Space>avD "Dp
nnoremap <Space>avF "Fp
nnoremap <Space>avG "Gp
nnoremap <Space>avH "Hp
nnoremap <Space>avJ "Jp
nnoremap <Space>avK "Kp
nnoremap <Space>avL "Lp

vnoremap <Space>avq "qp
vnoremap <Space>avw "wp
vnoremap <Space>ave "ep
vnoremap <Space>avr "rp
vnoremap <Space>avt "tp
vnoremap <Space>avy "yp
vnoremap <Space>avu "up
vnoremap <Space>avi "ip
vnoremap <Space>avo "op
vnoremap <Space>avp "pp
vnoremap <Space>ava "ap
vnoremap <Space>avs "sp
vnoremap <Space>avd "dp
vnoremap <Space>avf "fp
vnoremap <Space>avg "gp
vnoremap <Space>avh "hp
vnoremap <Space>avj "jp
vnoremap <Space>avk "kp
vnoremap <Space>avl "lp

vnoremap <Space>avQ "Qp
vnoremap <Space>avW "Wp
vnoremap <Space>avE "Ep
vnoremap <Space>avR "Rp
vnoremap <Space>avT "Tp
vnoremap <Space>avY "Yp
vnoremap <Space>avU "Up
vnoremap <Space>avI "Ip
vnoremap <Space>avO "Op
vnoremap <Space>avP "Pp
vnoremap <Space>avA "Ap
vnoremap <Space>avS "Sp
vnoremap <Space>avD "Dp
vnoremap <Space>avF "Fp
vnoremap <Space>avG "Gp
vnoremap <Space>avH "Hp
vnoremap <Space>avJ "Jp
vnoremap <Space>avK "Kp
vnoremap <Space>avL "Lp
