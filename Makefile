.PHONY: all
all: paper
	 open prospectus.pdf

paper: bibliography-update
	pdflatex -synctex=1 -interaction=nonstopmode prospectus.tex
	bibtex prospectus.aux
	pdflatex -synctex=1 -interaction=nonstopmode prospectus.tex
	bibtex prospectus.aux
	pdflatex -synctex=1 -interaction=nonstopmode prospectus.tex
	bibtex prospectus.aux

clean:
	rm -f *.bbl
	rm -f *.out
	rm -f *.synctex.gz
	rm -f *.aux
	rm -f *.blg
	rm -f *.bbl
	rm -f *latexmk
	rm -f *.fls
	rm -f *.log
	rm -f *_flymake*

bibliography:
	git clone http://star-rep.inf.usi.ch/root/bibliography.git

bibliography-update: bibliography
	-(cd bibliography && git pull)

