bin        = $(shell npm bin)
lsc        = $(bin)/lsc
browserify = $(bin)/browserify
jsdoc      = $(bin)/jsdoc
uglify     = $(bin)/uglifyjs
VERSION    = $(shell node -e 'console.log(require("./package.json").version)')


dist:
	mkdir -p dist

dist/core.arity.umd.js: dist
	$(browserify) lib/index.js --standalone folktale.core.arity > $@

dist/core.arity.umd.min.js: dist/core.arity.umd.js
	$(uglify) --mangle - < $^ > $@

# ----------------------------------------------------------------------
bundle: dist/core.arity.umd.js

minify: dist/core.arity.umd.min.js

documentation: 
	$(jsdoc) --configure jsdoc.conf.json
	ABSPATH=$(shell cd "$(dirname "$0")"; pwd) $(MAKE) clean-docs

clean-docs:
	perl -pi -e "s?$$ABSPATH/??g" ./docs/*.html

clean:
	rm -rf dist build lib

test:
	$(lsc) test/tap.ls

package: documentation bundle minify
	mkdir -p dist/core.arity-$(VERSION)
	cp -r docs dist/core.arity-$(VERSION)
	cp -r lib dist/core.arity-$(VERSION)
	cp dist/*.js dist/core.arity-$(VERSION)
	cp package.json dist/core.arity-$(VERSION)
	cp README.md dist/core.arity-$(VERSION)
	cp LICENCE dist/core.arity-$(VERSION)
	cd dist && tar -czf core.arity-$(VERSION).tar.gz core.arity-$(VERSION)

publish: clean
	npm install
	npm publish

bump:
	node tools/bump-version.js $$VERSION_BUMP

bump-feature:
	VERSION_BUMP=FEATURE $(MAKE) bump

bump-major:
	VERSION_BUMP=MAJOR $(MAKE) bump

.PHONY: test bump bump-feature bump-major publish package clean documentation
