all: build

dist:
		mkdir -p dist

clean:
		rm -r dist || true

lint:
		find . -maxdepth 1 -type d ! -path './.git' ! -path './bin' ! -path '.' ! -path './dist' ! -path './tiller-setup' -exec bash -c 'helm lint "$$0"' {}  \;


build: clean dist lint
		find . -maxdepth 1 -type d ! -path './.git' ! -path './bin' ! -path '.' ! -path './dist' ! -path './tiller-setup' -exec bash -c 'helm package "$$0" -d dist' {}  \;

deploy: build
		for x in dist/*.tgz ; do helm s3 push $$x --force epi-charts ; done
