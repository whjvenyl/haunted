COMPILE = node_modules/.bin/compile

all: haunted.js index.js web.js
.PHONY: all

haunted.js: src/*.js
	$(COMPILE) -f es -o $@ -e https://unpkg.com/lit-html@^0.12.0/lit-html.js src/haunted.js

index.js: haunted.js
	sed 's/https:\/\/unpkg\.com\/lit-html@\^0\.12\.0\/lit-html\.js/lit-html/' $^ > $@

web.js: haunted.js
	sed 's/https:\/\/unpkg\.com\/lit-html@\^0\.12\.0\/lit-html\.js/\.\.\/\.\.\/node_modules\/lit-html\/lit-html\.js/' $^ > $@

clean:
	@rm -f haunted.js index.js web.js
.PHONY: clean
