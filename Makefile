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
	npm version $(shell date '+%y.%-V%u.%-d%H%M') --force --allow-same-version --no-git-tag-version
	npm install
	$(TSC)

deploy-git:
	npm version $(shell date '+%y.%-V%u.%-d%H%M') --force --allow-same-version
	git push
	git push --tags
	npm publish
