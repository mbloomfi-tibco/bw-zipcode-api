build:
	mvn -s .m2/settings.xml -f tibco.bwce.sample.binding.soap.http.ZipCodeServiceProvider.application.parent clean initialize package install -DskipTests 
push:
	docker push harbor.tibcopsg.net/cloud-demos/zipcodeexample:latest

run-local:
	docker run -p 8080:8080 -p 7777:7777 harbor.tibcopsg.net/cloud-demos/zipcodeexample:latest
 
test-sonar-local:
	sonar-scanner -Dsonar.projectKey=zipcode-example -Dsonar.projectVersion=1.0 -Dsonar.sources=tibco.bwce.sample.binding.soap.http.ZipCodeServiceProvider -Dsonar.host.url=http://sonarqube.tibcopsg.net -Dsonar.login=90d354c25fb153c040d62c14f22e8a0370311a95 
	
test-local:
	curl http://localhost:8080/citydata/city/FR
