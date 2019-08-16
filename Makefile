all: build

dist:
		mkdir -p dist

clean:
		rm -r dist || true

dist/fuseki-*.tgz: dist
		helm package fuseki -d dist

dist/registry-*.tgz: dist
		helm package registry -d dist

dist/sapi-api-*.tgz: dist
		helm package sapi-api -d dist

dist/sapi-app-*.tgz: dist
		cd sapi-app && helm dep update && cd ../
		helm package sapi-app -d dist

dist/sns-webhook-*.tgz: dist
		helm package sns-webhook -d dist

dist/nginx-proxy-*.tgz: dist
		helm package nginx-proxy -d dist

dist/tdb-builder-*.tgz: dist
		helm package tdb-builder -d dist

build-fuseki: dist/fuseki-*.tgz

build-registry: dist/registry-*.tgz

build-sapi-api: dist/sapi-api-*.tgz

build-sapi-app: dist/sapi-app-*.tgz

build-sns-webhook: dist/sns-webhook-*.tgz

build-nginx-proxy: dist/nginx-proxy-*.tgz

build-tdb-builder: dist/tdb-builder-*.tgz

build: build-fuseki build-registry build-sapi-api build-sapi-app build-sns-webhook build-nginx-proxy

deploy: build
	for x in dist/*.tgz ; do helm s3 push $$x --force epi-charts ; done
