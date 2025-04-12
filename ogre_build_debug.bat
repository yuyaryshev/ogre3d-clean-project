@echo off
setlocal

REM Load environment config
call "%~dp0env-config.bat"

REM Construct the full build directory path
set BUILD_TRIPLET=msvc%VSTOOLSET%_%OGRE_BUILD_MODE%
set FULL_BUILD_DIR=%OGRE_BUILDS%ogre-%OGRE_VERSION%_%BUILD_TRIPLET%

REM Handle --clean argument
if "%1"=="--clean" (
    echo Cleaning build directory: %FULL_BUILD_DIR%
    rmdir /S /Q "%FULL_BUILD_DIR%"
)

REM Create build directory if it doesn't exist
if not exist "%FULL_BUILD_DIR%" (
    mkdir "%FULL_BUILD_DIR%"
)

REM Change to build directory
cd /D "%FULL_BUILD_DIR%"

REM Run CMake configuration
cmake -G "Visual Studio 17 2022" ^
      -A x64 ^
      -T v%VSTOOLSET% ^
      -DCMAKE_BUILD_TYPE=%OGRE_BUILD_MODE% ^
      -DOGRE_BUILD_SAMPLES=OFF ^
      -DOGRE_BUILD_TESTS=OFF ^
      -DOGRE_INSTALL_SAMPLES=OFF ^
      -DOGRE_BUILD_DEPENDENCIES=ON ^
      "%OGRE_SOURCES%"

if errorlevel 1 (
    echo CMake configuration failed.
    exit /b 1
)

REM Build the project using MSBuild
cmake --build . --config %OGRE_BUILD_MODE%

if errorlevel 1 (
    echo Build failed.
    exit /b 1
)

echo Build succeeded!
exit /b 0
