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

build-fuseki: dist/fuseki-*.tgz

build-registry: dist/registry-*.tgz

build-sapi-api: dist/sapi-api-*.tgz

build-sapi-app: dist/sapi-app-*.tgz

build: build-fuseki build-registry build-sapi-api build-sapi-app

deploy-fuseki: build-fuseki
	helm s3 push dist/fuseki-*.tgz --force epi-charts

deploy-registry: build-registry
	helm s3 push dist/registry-*.tgz --force epi-charts

deploy-sapi-api: build-sapi-api
	helm s3 push dist/sapi-api-*.tgz --force epi-charts

deploy-sapi-app: build-sapi-app
	helm s3 push dist/sapi-app-*.tgz --force epi-charts

deploy: deploy-fuseki deploy-registry deploy-sapi-api deploy-sapi-app
