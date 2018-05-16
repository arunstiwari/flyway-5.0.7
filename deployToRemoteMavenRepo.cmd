@REM
@REM Copyright 2010-2018 Boxfuse GmbH
@REM
@REM
@REM Boxfuse GmbH grants the Licensee a non-exclusive,
@REM timely limited and non-transferable license
@REM to install and use the Software under the terms of
@REM the Flyway License and Maintenance Agreement.
@REM
@REM
@REM This software is distributed with a LIMITED WARRANTY.
@REM See the Flyway License and Maintenance Agreement
@REM for more details:
@REM https://flywaydb.org/licenses/flyway-trial.txt
@REM

@echo off

if [%1]==[] goto :usage
if [%2]==[] goto :usage

setlocal

set GROUP_ID=org.flywaydb.trial
set REPO_ID=%1
set REPO_URL=%2

echo ============== DEPLOYING %GROUP_ID% version 5.0.7 artifacts TO %REPO_ID% (%REPO_URL%)

call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-parent/pom.xml                                             -DartifactId=flyway-parent        -Dpackaging=pom    -DupdateReleaseInfo=true || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-core/flyway-core-5.0.7.jar                             -DartifactId=flyway-core          -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-core/pom.xml          -Djavadoc=flyway-core/flyway-core-5.0.7-javadoc.jar                   || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-gradle-plugin/flyway-gradle-plugin-5.0.7.jar           -DartifactId=flyway-gradle-plugin -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-gradle-plugin/pom.xml -Djavadoc=flyway-gradle-plugin/flyway-gradle-plugin-5.0.7-javadoc.jar || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-maven-plugin/flyway-maven-plugin-5.0.7.jar             -DartifactId=flyway-maven-plugin  -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-maven-plugin/pom.xml  -Djavadoc=flyway-maven-plugin/flyway-maven-plugin-5.0.7-javadoc.jar   || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7.jar               -DartifactId=flyway-commandline   -Dpackaging=jar    -DupdateReleaseInfo=true -DpomFile=flyway-commandline/pom.xml   -Djavadoc=flyway-commandline/flyway-commandline-5.0.7-javadoc.jar     || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7.zip               -DartifactId=flyway-commandline   -Dpackaging=zip    -DgeneratePom=false || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7.tar.gz            -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7-windows-x64.zip   -DartifactId=flyway-commandline   -Dpackaging=zip    -DgeneratePom=false -Dclassifier=windows-x64 || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7-linux-x64.tar.gz  -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false -Dclassifier=linux-x64 || goto :error
call mvn deploy:deploy-file -DrepositoryId=%REPO_ID% -Durl=%REPO_URL% -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline/flyway-commandline-5.0.7-macosx-x64.tar.gz -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false -Dclassifier=macosx-x64 || goto :error

echo ============== DEPLOY SUCCESS
goto :EOF

:error
set ERRORLVL=%errorlevel%
echo ============== DEPLOY FAILED WITH ERROR %ERRORLVL%
exit /b %ERRORLVL%

:usage
echo ERROR: Missing repo id or url!
echo USAGE: deployToRemoteMavenRepo.cmd my-repo-id https://myrepourl/mypath
exit /b 1