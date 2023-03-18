.PHONY: generate
generate:
	java -cp backend/tools/openapi-generator-cli-6.3.0.jar:backend/tools/go-custom-server-openapi-generator-1.0.0.jar \
	org.openapitools.codegen.OpenAPIGenerator generate -g go-custom-server -i backend/api/openapi.yaml

.PHONY: create-jar
create-jar:
	cd backend/openapi-custom-generator && mvn package -DskipTests=true
