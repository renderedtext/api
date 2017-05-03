SHELL=/bin/bash

.PHONY: all compile setup generate server

DEST_DIR=generated/


all: compile

compile:
	mkdir -p $(DEST_DIR)
	bundle exec prmd combine --meta meta.json schemata/ > $(DEST_DIR)/schema.json
	cat $(DEST_DIR)/schema.json | bundle exec prmd verify | \
          bundle exec prmd doc --prepend overview.md --settings config.json > $(DEST_DIR)/schema.md
	bundle exec rake render_html

setup:
	bundle install --path .bundle -j 4

RESOURCE_PATH="schemata/$(RESOURCE).yml"
generate:
ifndef RESOURCE
	$(error RESOURCE is undefined)
endif
	bundle exec prmd init --yaml $(RESOURCE) > $(RESOURCE_PATH)
	echo "Generated resource - $(RESOURCE_PATH)"

server:
	UNSECURE='true' bundle exec rackup config.ru --host local.semaphore --port 3000
