@echo off
REM This script sets up a build environment for the preconditioned solver project.
REM It points to tools from the main sundials_win_env project.

ECHO Activating SUNDIALS Preconditioner Build Environment...

REM Add the MinGW compiler from our other project to the PATH
SET "PATH=C:\C_projects\sundials_win_env\mingw64\bin;%PATH%"

REM Add the system-wide CMake to the PATH
SET "PATH=C:\Program Files\CMake\bin;%PATH%"

ECHO.
ECHO Environment is ready. Verifying tools...
ECHO.
gcc --version
cmake --version
ECHO.