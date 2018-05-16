#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo ERROR: Missing repo id or url!
    echo USAGE: deployToRemoteMavenRepo.sh my-repo-id https://myrepourl/mypath
    exit 1
fi

set -e

GROUP_ID=org.flywaydb.trial
REPO_ID=$1
REPO_URL=$2

echo "============== DEPLOYING $GROUP_ID version 5.0.7 artifacts TO $REPO_ID ($REPO_URL)"

mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-parent/pom.xml                                            -DartifactId=flyway-parent        -Dpackaging=pom    -DupdateReleaseInfo=true
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-core/flyway-core-5.0.7.jar                             -DartifactId=flyway-core          -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-core/pom.xml          -Djavadoc=flyway-core/flyway-core-5.0.7-javadoc.jar                   
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-gradle-plugin/flyway-gradle-plugin-5.0.7.jar           -DartifactId=flyway-gradle-plugin -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-gradle-plugin/pom.xml -Djavadoc=flyway-gradle-plugin/flyway-gradle-plugin-5.0.7-javadoc.jar 
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-maven-plugin/flyway-maven-plugin-5.0.7.jar             -DartifactId=flyway-maven-plugin  -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-maven-plugin/pom.xml  -Djavadoc=flyway-maven-plugin/flyway-maven-plugin-5.0.7-javadoc.jar   
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7.jar               -DartifactId=flyway-commandline   -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-commandline/pom.xml   -Djavadoc=flyway-commandline/flyway-commandline-5.0.7-javadoc.jar     
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7.zip               -DartifactId=flyway-commandline   -Dpackaging=zip    -DgeneratePom=false
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7.tar.gz            -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7-windows-x64.zip   -DartifactId=flyway-commandline   -Dpackaging=zip    -DgeneratePom=false -Dclassifier=windows-x64
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7-linux-x64.tar.gz  -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false -Dclassifier=linux-x64
mvn deploy:deploy-file -DrepositoryId=$REPO_ID -Durl=$REPO_URL -DgroupId=$GROUP_ID -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7-macosx-x64.tar.gz -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false -Dclassifier=macosx-x64

echo ============== DEPLOY SUCCESS