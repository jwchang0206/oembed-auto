test:
	make compile && \
	./node_modules/.bin/mocha \
		--compilers coffee:coffee-script \
		--reporter spec \
		--recursive \
		--slow 1000 \
		--timeout 30000 \
		test/$(path)

compile:
	./node_modules/.bin/coffee -c src/oembed.coffee && mv src/oembed.js lib/oembed.js && \
	cp src/oembedList.json lib/oembedList.json

.PHONY: test