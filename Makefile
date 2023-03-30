.PHONY: create-jar
create-jar:
	cd backend/openapi-custom-generator && mvn package -DskipTests=true

.PHONY: generate
generate:
	cd backend && java -cp tools/openapi-generator-cli-6.3.0.jar:tools/go-custom-server-openapi-generator-1.0.0.jar \
	org.openapitools.codegen.OpenAPIGenerator generate -g go-custom-server -i ../openapi.yaml -o internal/schema
