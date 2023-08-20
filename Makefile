VERSION=$(shell grep '"version":' manifest.json | tr --delete '" ,' | sed 's/version://')
ADDON=ReplyWithHeaderMozilla-$(VERSION).xpi

xpi: $(ADDON)

%.xpi:
	zip -r $@  chrome experiment icon.png LICENSE manifest.json options scripts skin

clean:
	rm -f -- $(ADDON)

.PHONY: clean
