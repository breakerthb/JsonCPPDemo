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

clean:
	@(for d in $(SUBDIRS); do make -C $$d clean; done)

.PHONY: all install uninstall clean $(SUBDIRS)