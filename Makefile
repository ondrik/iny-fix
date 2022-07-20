# the name of the output
CO=main
# names of files other than sources the change of which should recompile the
# source
#CHANGED_FILES_OTHER =literature.bib
CHANGED_FILES_OTHER+=$(wildcard *.tex) $(wildcard *.bib)
CHANGED_FILES_OTHER+=$(wildcard figs/*)

# List of TeX files
#TEX_FILES=$(wildcard *.tex)

###############################################################################
#                                 Rules                                       #
###############################################################################

.PHONY: all clean

all: $(CO).pdf

$(CO).pdf: $(CO).tex $(CHANGED_FILES_OTHER)
#	pdflatex $(CO)
#	bibtex $(CO)
#	pdflatex $(CO)
#	pdflatex $(CO)
	rubber --unsafe --pdf $<
#	rubber-info --errors $<
#	rubber-info --check $<

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof
	rm -f $(CO).pdf
	rm -f *~
