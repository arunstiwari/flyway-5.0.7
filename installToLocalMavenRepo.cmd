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

setlocal

SET GROUP_ID=org.flywaydb.trial

echo ============== INSTALLING %GROUP_ID% version 5.0.7 artifacts in your local Maven repository

call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-parent\pom.xml                                             -DartifactId=flyway-parent        -Dpackaging=pom || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-core\flyway-core-5.0.7.jar                             -DartifactId=flyway-core          -Dpackaging=jar    -DpomFile=flyway-core\pom.xml          -Djavadoc=flyway-core\flyway-core-5.0.7-javadoc.jar || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-gradle-plugin\flyway-gradle-plugin-5.0.7.jar           -DartifactId=flyway-gradle-plugin -Dpackaging=jar    -DpomFile=flyway-gradle-plugin\pom.xml -Djavadoc=flyway-gradle-plugin\flyway-gradle-plugin-5.0.7-javadoc.jar || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-maven-plugin\flyway-maven-plugin-5.0.7.jar             -DartifactId=flyway-maven-plugin  -Dpackaging=jar    -DpomFile=flyway-maven-plugin\pom.xml  -Djavadoc=flyway-maven-plugin\flyway-maven-plugin-5.0.7-javadoc.jar || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline\flyway-commandline-5.0.7.jar               -DartifactId=flyway-commandline   -Dpackaging=jar    -DpomFile=flyway-commandline\pom.xml   -Djavadoc=flyway-commandline\flyway-commandline-5.0.7-javadoc.jar || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline\flyway-commandline-5.0.7.zip               -DartifactId=flyway-commandline   -Dpackaging=zip    -DgeneratePom=false || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline\flyway-commandline-5.0.7.tar.gz            -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline\flyway-commandline-5.0.7-windows-x64.zip   -DartifactId=flyway-commandline   -Dpackaging=zip    -DgeneratePom=false -Dclassifier=windows-x64 || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline\flyway-commandline-5.0.7-linux-x64.tar.gz  -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false -Dclassifier=linux-x64 || goto :error
call mvn install:install-file -DgroupId=%GROUP_ID% -Dversion=5.0.7 -Dfile=flyway-commandline\flyway-commandline-5.0.7-macosx-x64.tar.gz -DartifactId=flyway-commandline   -Dpackaging=tar.gz -DgeneratePom=false -Dclassifier=macosx-x64 || goto :error

echo ============== INSTALL SUCCESS
goto :EOF

:error
set ERRORLVL=%errorlevel%
echo ============== INSTALL FAILED WITH ERROR %ERRORLVL%
exit /b %ERRORLVL%