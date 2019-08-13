mdtex2pdf() {
  DIR=$(mktemp -d)
  pandoc $1 -t latex -s | pdflatex "--output-directory=$DIR" > /dev/null
  pdf_file=$(ls --color=never $DIR | grep '.pdf')
  mv "$DIR/$pdf_file" .
  zathura $pdf_file &
}

check_papers() {
  for file in $(fd . ~/notes/paper_notes); do
    lines=$(cat $file | wc -l)
    if [ $lines -ge 7 ]; then
      file_name=$(basename $file | rev | cut -c 4- | rev)
      if [ -f "$HOME/papers/$file_name.pdf" ]; then
        echo > /dev/null
      else
        echo $file_name pdf missing
      fi
    fi
  done
}
