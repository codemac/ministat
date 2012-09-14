PREFIX=/usr
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man/man1
DESTDIR=

ministat:
	gcc -lm ministat.c -o ministat

clean:
	rm -rf *.o ministat ministat.1.gz

all: ministat

install-man:
	gzip -c ministat.1 > ministat.1.gz

install: install-man ministat
	install -D -m 0755 ministat $(DESTDIR)$(BINDIR)/ministat
	install -D -m 0644 ministat.1.gz $(DESTDIR)$(MANDIR)/ministat.1.gz

uninstall:
	rm $(DESTDIR)$(BINDIR)/ministat
	rm $(DESTDIR)$(MANDIR)/ministat.1.gz
