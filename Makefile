PREFIX = /usr/local

.PHONY: default
default:
	@echo "Use make install to install this program to the appropriate location."

.PHONY: install
install:
	install -m755 -D -t $(DESTDIR)$(PREFIX)/bin/ sbill
	install -m644 -D -t $(DESTDIR)$(PREFIX)/share/man/man1/ sbill.1
	install -m644 -D -t $(DESTDIR)$(PREFIX)/share/doc/sbill/ README.html
	install -m644 -D -t $(DESTDIR)$(PREFIX)/share/doc/sbill/ LICENSE

htmldoc: README.html
	pandoc -f markdown -t html -o README.html README.md
