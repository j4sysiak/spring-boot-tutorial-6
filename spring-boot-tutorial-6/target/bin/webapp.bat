@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\springframework\boot\spring-boot-starter-actuator\2.0.1.RELEASE\spring-boot-starter-actuator-2.0.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter\2.0.1.RELEASE\spring-boot-starter-2.0.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-logging\2.0.1.RELEASE\spring-boot-starter-logging-2.0.1.RELEASE.jar;"%REPO%"\ch\qos\logback\logback-classic\1.2.3\logback-classic-1.2.3.jar;"%REPO%"\ch\qos\logback\logback-core\1.2.3\logback-core-1.2.3.jar;"%REPO%"\org\apache\logging\log4j\log4j-to-slf4j\2.10.0\log4j-to-slf4j-2.10.0.jar;"%REPO%"\org\apache\logging\log4j\log4j-api\2.10.0\log4j-api-2.10.0.jar;"%REPO%"\org\slf4j\jul-to-slf4j\1.7.25\jul-to-slf4j-1.7.25.jar;"%REPO%"\org\yaml\snakeyaml\1.19\snakeyaml-1.19.jar;"%REPO%"\org\springframework\boot\spring-boot-actuator-autoconfigure\2.0.1.RELEASE\spring-boot-actuator-autoconfigure-2.0.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-actuator\2.0.1.RELEASE\spring-boot-actuator-2.0.1.RELEASE.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.9.5\jackson-databind-2.9.5.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.9.0\jackson-annotations-2.9.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.9.5\jackson-core-2.9.5.jar;"%REPO%"\org\springframework\spring-context\5.0.5.RELEASE\spring-context-5.0.5.RELEASE.jar;"%REPO%"\com\fasterxml\jackson\datatype\jackson-datatype-jsr310\2.9.5\jackson-datatype-jsr310-2.9.5.jar;"%REPO%"\io\micrometer\micrometer-core\1.0.3\micrometer-core-1.0.3.jar;"%REPO%"\org\hdrhistogram\HdrHistogram\2.1.10\HdrHistogram-2.1.10.jar;"%REPO%"\org\latencyutils\LatencyUtils\2.0.3\LatencyUtils-2.0.3.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-web\2.0.1.RELEASE\spring-boot-starter-web-2.0.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-json\2.0.1.RELEASE\spring-boot-starter-json-2.0.1.RELEASE.jar;"%REPO%"\com\fasterxml\jackson\datatype\jackson-datatype-jdk8\2.9.5\jackson-datatype-jdk8-2.9.5.jar;"%REPO%"\com\fasterxml\jackson\module\jackson-module-parameter-names\2.9.5\jackson-module-parameter-names-2.9.5.jar;"%REPO%"\org\hibernate\validator\hibernate-validator\6.0.9.Final\hibernate-validator-6.0.9.Final.jar;"%REPO%"\javax\validation\validation-api\2.0.1.Final\validation-api-2.0.1.Final.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.3.2.Final\jboss-logging-3.3.2.Final.jar;"%REPO%"\com\fasterxml\classmate\1.3.4\classmate-1.3.4.jar;"%REPO%"\org\springframework\spring-web\5.0.5.RELEASE\spring-web-5.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\5.0.5.RELEASE\spring-beans-5.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-webmvc\5.0.5.RELEASE\spring-webmvc-5.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\5.0.5.RELEASE\spring-aop-5.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\5.0.5.RELEASE\spring-expression-5.0.5.RELEASE.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.25\slf4j-api-1.7.25.jar;"%REPO%"\org\springframework\spring-core\5.0.5.RELEASE\spring-core-5.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-jcl\5.0.5.RELEASE\spring-jcl-5.0.5.RELEASE.jar;"%REPO%"\org\webjars\jquery\3.3.1-1\jquery-3.3.1-1.jar;"%REPO%"\org\webjars\jquery-ui\1.12.1\jquery-ui-1.12.1.jar;"%REPO%"\org\webjars\bootstrap\4.1.0\bootstrap-4.1.0.jar;"%REPO%"\org\webjars\popper.js\1.14.1\popper.js-1.14.1.jar;"%REPO%"\org\springframework\boot\spring-boot-devtools\2.0.1.RELEASE\spring-boot-devtools-2.0.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot\2.0.1.RELEASE\spring-boot-2.0.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-autoconfigure\2.0.1.RELEASE\spring-boot-autoconfigure-2.0.1.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-thymeleaf\2.0.1.RELEASE\spring-boot-starter-thymeleaf-2.0.1.RELEASE.jar;"%REPO%"\org\thymeleaf\thymeleaf-spring5\3.0.9.RELEASE\thymeleaf-spring5-3.0.9.RELEASE.jar;"%REPO%"\org\thymeleaf\thymeleaf\3.0.9.RELEASE\thymeleaf-3.0.9.RELEASE.jar;"%REPO%"\org\attoparser\attoparser\2.0.4.RELEASE\attoparser-2.0.4.RELEASE.jar;"%REPO%"\org\unbescape\unbescape\1.1.5.RELEASE\unbescape-1.1.5.RELEASE.jar;"%REPO%"\org\thymeleaf\extras\thymeleaf-extras-java8time\3.0.1.RELEASE\thymeleaf-extras-java8time-3.0.1.RELEASE.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.5.29\tomcat-embed-jasper-8.5.29.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.5.29\tomcat-embed-core-8.5.29.jar;"%REPO%"\org\apache\tomcat\tomcat-annotations-api\8.5.29\tomcat-annotations-api-8.5.29.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.5.29\tomcat-embed-el-8.5.29.jar;"%REPO%"\org\eclipse\jdt\ecj\3.12.3\ecj-3.12.3.jar;"%REPO%"\javax\annotation\javax.annotation-api\1.3.2\javax.annotation-api-1.3.2.jar;"%REPO%"\com\caveofprogramming\spring-boot-tutorial-6\1.0\spring-boot-tutorial-6-1.0.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" org.baeldung.Application %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
