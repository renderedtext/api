.PHONY: all doc setup


all: doc

doc:
	mkdir -p doc
	./node_modules/raml2html/bin/raml2html --input raml/api.raml --validate --output doc/api.html
	cd doc ; ln -s api.html index.html
	./node_modules/raml2html/bin/raml2html --theme raml2html-markdown-theme raml/api.raml --output doc/api.md
	./node_modules/raml2html/bin/raml2html --theme raml2html-slate-theme raml/api.raml --output doc/api-slate.html

setup:
	bundle install --path .bundle -j 4
	npm i raml2html
	npm i raml2html-markdown-theme
	npm i raml2html-slate-theme

# Watch source dir and recompile as needed
guard:
	bundle exec guard
