CLASSES = UUposter
STYLES = UUxetex
OBJECTS = $(CLASSES) $(STYLES)
LATEX = pdflatex
MAKEINDEX = makeindex

all : $(OBJECTS)

$(CLASSES) : % : %.cls %.pdf

$(STYLES) : % : %.sty %.pdf

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

.PHONY : veryclean
veryclean : clean
	-rm -f $(patsubst %,%.sty,$(STYLES))
	-rm -f $(patsubst %,%.cls,$(CLASSES))
	-rm -f $(patsubst %,%.pdf,$(OBJECTS))
