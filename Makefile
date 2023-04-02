NOTES = 2021-08-01-css-hack\
	oxyserve-data-folder\
	2021-08-14-charger1\
	2021-09-04-arch-btw\
	2022-03-02-new-site\
	2022-04-04-til-certbot-http2
SOURCES = index $(patsubst %, %/index, $(NOTES))
RESOURCES = img/avatar.svg style.css favicon.png
SERVER_DIR = /var/www/notes.andi-makes.dev

OBJECTS = $(patsubst %, output/%.html, $(SOURCES)) $(patsubst %, output/%, $(RESOURCES))

TEMPLATE = template.html

compile: $(OBJECTS)

output/%.html output/%/index.html: src/%.md $(TEMPLATE) my.theme
	mkdir -p $(@D)
	pandoc -s --wrap=preserve --highlight-style my.theme --template=$(TEMPLATE) --css=/style.css $< -o $@

output/%: resources/%
	mkdir -p $(@D)
	cp -Ru $< $@
	
upload: compile
	tar -cz -C output . | ssh root@schmarrnfee.schmarrn.dev "rm -rf $(SERVER_DIR) && mkdir $(SERVER_DIR) && tar -xzv -C $(SERVER_DIR) --no-same-permissions"

clean:
	rm -r output
