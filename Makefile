PREFIX=/usr
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/man1
DESTDIR=

ministat:
	gcc -lm ministat.c -o ministat

clean:
	rm -rf *.o ministat ministat.1.gz

all: ministat

install-man:
	gzip -c ministat.1 > ministat.1.gz

install: install-man ministat
	install -m 0755 ministat $(DESTDIR)$(BINDIR)
	install -m 0644 ministat.1.gz $(DESTDIR)$(MANDIR)

uninstall:
	rm $(DESTDIR)$(BINDIR)/minista
	rm $(DESTDIR)$(MANDIR)/ministat.1.gz
