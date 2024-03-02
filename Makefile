install:
  # https://gist.github.com/georgiana-gligor/fd247d02f8a44ce745db
	brew install pandoc
	brew install --cask basictex
	ln -s -v /Library/TeX/texbin/pdflatex /usr/local/bin/pdflatex

pdf: 
	pandoc cv.md -s -o Igor_Budasov_CV.pdf

