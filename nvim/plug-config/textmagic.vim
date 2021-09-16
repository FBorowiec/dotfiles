autocmd Filetype tex setl updatetime=1

lua << EOF
-- Only default build engines made available (pdflatex, xelatex, dvipspdf)
require('texmagic').setup{}
EOF
