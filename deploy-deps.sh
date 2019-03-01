#!/usr/bin/env bash

# execute command below to publish all required enunciate libraries
# ./gradlew dependencies --configuration runtime | grep FORK-COLLIBRA | awk -F":" '{print $2}' | sort -u | xargs -n 1 ./deploy-deps.sh

# requires separate publish of the enunciate-parent pom

module=${1#"enunciate-"}
echo $module
mvn deploy:deploy-file -DgroupId=com.webcohesion.enunciate -DartifactId="$1" -Dversion=2.12.0-FORK-COLLIBRA -DpomFile="../enunciate/${module}/pom.xml" -Dfile="../enunciate/${module}/target/$1-2.12.0-FORK-COLLIBRA.jar" -DrepositoryId=nexus -Durl=https://nexus.collibra.com/repository/collibra-gradle-plugins

