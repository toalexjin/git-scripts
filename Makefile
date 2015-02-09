
SOURCE_BIN=$(wildcard ./bin/git-*)
SOURCE_RAW=$(notdir $(SOURCE_BIN))
SOURCE_MAN=$(patsubst %,./doc/%.1,$(SOURCE_RAW))
SOURCE_ASCIIDOC=$(patsubst %,./doc/%.asciidoc,$(SOURCE_RAW))

TARGET_BINDIR=/usr/bin
TARGET_MANDIR=/usr/share/man/man1
TARGET_BIN=$(patsubst %,$(TARGET_BINDIR)/%,$(SOURCE_RAW))
TARGET_MAN=$(patsubst %,$(TARGET_MANDIR)/%.1,$(SOURCE_RAW))


build: $(SOURCE_MAN)

%.1: %.asciidoc
	a2x -d manpage -f manpage $< > /dev/null 2>&1

install:
	install -g 0 -o 0 -m 755 -d $(TARGET_BINDIR)
	install -g 0 -o 0 -m 755 -d $(TARGET_MANDIR)
	install -g 0 -o 0 -m 755 $(SOURCE_BIN) $(TARGET_BINDIR)
	install -g 0 -o 0 -m 644 $(SOURCE_MAN) $(TARGET_MANDIR)

uninstall:
	rm -f $(TARGET_BIN)
	rm -f $(TARGET_MAN)

clean:
	rm -f ./doc/*.1 ./doc/*.xml

echo:
	@echo $(SOURCE_BIN)
	@echo $(SOURCE_MAN)
	@echo $(SOURCE_RAW)
	@echo $(SOURCE_ASCIIDOC)
	@echo $(TARGET_BINDIR)
	@echo $(TARGET_MANDIR)
	@echo $(TARGET_BIN)
	@echo $(TARGET_MAN)

