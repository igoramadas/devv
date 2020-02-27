TSC:= ./node_modules/.bin/tsc

build:
	$(TSC)

clean:
	rm -rf ./lib
	rm -rf ./node_modules
	rm -f package-lock.json

run:
	$(TSC)
	npm start

update:
	-ncu -u
	npm version $(shell date '+%y.%-V.%u%H') --force --allow-same-version --no-git-tag-version
	npm install
	$(TSC)

publish:
	npm version $(shell date '+%y.%-V.%u%H') --force --allow-same-version
	git push --tags
