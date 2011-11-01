CLASSES = UUposter
STYLES = UUxetex
OBJECTS = $(CLASSES) $(STYLES)
LATEX = pdflatex
MAKEINDEX = makeindex

all : $(OBJECTS)

$(CLASSES) : % : %.cls %.pdf

$(STYLES) : % : %.sty %.pdf

$(patsubst %,%.pdf,$(CLASSES)) : %.pdf : %.cls

$(patsubst %,%.pdf,$(STYLES)) : %.pdf : %.sty

%.cls : %.ins %.dtx
	$(LATEX) $<

%.sty : %.ins %.dtx
	$(LATEX) $<

%.glo : %.dtx
	$(LATEX) $<

%.gls : %.glo
	-$(MAKEINDEX) -s gglo.ist -o $@ $<

%.idx: %.dtx
	$(LATEX) $<

%.ind: %.idx
		-$(MAKEINDEX) -s gind.ist $<

%.pdf : %.dtx %.ind %.gls
	$(LATEX) $<

VERSION := $(shell git describe --tags)
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
.PHONY : archive
archive : $(VERSION).zip

%.zip :
	git archive --worktree-attributes -o $@ $(BRANCH)
	cp $@  ~/cp/web/jossc163/latex/uuposter/

.PHONY : clean	
clean :
	-rm -f $(patsubst %,%.ind,$(OBJECTS))
	-rm -f $(patsubst %,%.idx,$(OBJECTS))
	-rm -f $(patsubst %,%.aux,$(OBJECTS))
	-rm -f $(patsubst %,%.dvi,$(OBJECTS))
	-rm -f $(patsubst %,%.log,$(OBJECTS))
	-rm -f $(patsubst %,%.out,$(OBJECTS))
	-rm -f $(patsubst %,%.gls,$(OBJECTS))
	-rm -f $(patsubst %,%.glo,$(OBJECTS))
	-rm -f $(patsubst %,%.ilg,$(OBJECTS))
	-rm -f UUposter-*.zip

.PHONY : veryclean
veryclean : clean
	-rm -f $(patsubst %,%.sty,$(STYLES))
	-rm -f $(patsubst %,%.cls,$(CLASSES))
	-rm -f $(patsubst %,%.pdf,$(OBJECTS))
