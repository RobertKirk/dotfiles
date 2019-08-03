mdtex2pdf() {
  DIR=$(mktemp -d)
  pandoc $1 -t latex -s | pdflatex "--output-directory=$DIR" > /dev/null
  pdf_file=$(ls --color=never $DIR | grep '.pdf')
  mv "$DIR/$pdf_file" .
  zathura $pdf_file &
}
