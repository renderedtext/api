.PHONY: compile publish server

compile:
	docker-compose run app ./scripts/compile

publish:
	./script/publish

server:
	docker-compose up
