@echo off
REM env-config.bat file below:
REM --------- Following are used by game project ---------------------
set OGRE3D_PROJECT_PATH=D:\b\Mine\git_gamedev\ogre3d-clean-project
set OGRE_CONFIG_DIR=%OGRE3D_PROJECT_PATH%\cfg
set OGRE_DIR=D:\b\Mine\git_gamedev\ogre-sdk-master-msvc142-x64
set BUILD_DIR=D:\temp\cpp_build_dir\ogre3d-clean-project
set PATH=%OGRE_DIR%\bin;%OGRE_DIR%\bin\Release;%PATH%

REM --------- Following are only used to build ogre3d from sources ---------------------
set VSTOOLSET=143
set OGRE_VERSION=14.3.4
set OGRE_BUILD_MODE=Debug

set OGRE_SOURCES=D:/b/Mine/git_gamedev/ogre-sources/ogre-%OGRE_VERSION%
set OGRE_BUILDS=D:/ogre3d_builds/


