include Makefile.def

INSTALLDIR ?= ./install

SUBDIRS := lib_json execute

#ifneq (,$(MONGODIR))
#SUBDIRS += mongo
#endif

all: $(SUBDIRS)

$(SUBDIRS):
	make -C $@

install: uninstall all
	mkdir -p $(INSTALLDIR) 
	mv JsonTest $(INSTALLDIR)

uninstall:
	rm -fr $(INSTALLDIR)

#lint:
#	@(for d in $(SUBDIRS); do make -C $$d lint; done)

clean:
	@(for d in $(SUBDIRS); do make -C $$d clean; done)

.PHONY: all install uninstall lint clean $(SUBDIRS)