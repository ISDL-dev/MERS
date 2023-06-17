.PHONY: create-jar
create-jar:
	cd backend/openapi-custom-generator && mvn package -DskipTests=true && cp target/go-custom-server-openapi-generator-1.0.0.jar ../tools/

.PHONY: generate
generate:
	cd backend && java -cp tools/openapi-generator-cli-6.3.0.jar:tools/go-custom-server-openapi-generator-1.0.0.jar \
	org.openapitools.codegen.OpenAPIGenerator generate -g go-custom-server -i ../openapi.yaml
