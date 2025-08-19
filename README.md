# Pharo Application Generator

This project provides a tool to generate the scripts and metadata for packaging application.
In the current state, it works for Windows and MacOS.
For the supported platforms it packages the VM, image and resources generating an executable file.
Then, from this executable file it generates an installable package that can be distributed to the final users.

It works in the following way:

1. Load your application in Pharo.
2. Load this project in the same Pharo image.
3. Generate scripts and project files required for the target platform.
4. Execute the build scripts to package the application and generate the installers

Script for step 2:
```smalltalk
Metacello new
    baseline: 'ApplicationGenerator';
    repository: 'github://tesonep/PharoApplicationGenerator:master/src';
    load.
```

# Consideration about the application

This tool it is intended to package any Pharo application. 
However the application should have an entry point exposed as a CommandLineHandler.
The command line handler will start the application and if required open the world.
Applications developed with Bloc, Spec-GTK or SDL can open the required windows without need of having a World window opened.

# Error Handling

This project provides a way of catching and handling all errors and exceptions produced during the application.
An error handler can be registered to perform any operation when an error occurs.
You can check the examples for more detail.

This project provides two examples:

- A null error handler that does nothing, just killing the application (AppGeneratorNullErrorHandler)
- An error handler that shows a SDL message box with the error description (AppGeneratorSDLMessageErrorHandler)

These examples, are basic and can be extended to include specific behavior of the application like: error logging, exporting the exception to fuel, notification to a central server or system logging.

# Examples
In this project there is a simple example in the class AppGeneratorExample. 
For a deeper example for a whole application, you can check the usage in the Takuzu game (https://github.com/tesonep/Takuzu)

# Installing

```smalltalk
Metacello new
	baseline: 'ApplicationGenerator';
	repository: 'github://Gwen0317/Packager/src';
	load
```

# Dependencies

## Windows

The whole process is implemented using CMake and Cygwin. As it compiles a new executable some dependencies are needed:

- A working Pharo
- CMake (at least version 2.8.4)
- CLang
- Binutils (make and friends)
- wget
- unzip

## MacOS

The process uses some external tools, you should have installed:

- A working Pharo
- XCode
- Brew (https://brew.sh/)
- ImageMagick from Brew (brew install imagemagick)
- create-dmg from Brew (brew install create-dmg)


# Script to retrieve the latest version of the external folder

```.bat
@echo off
setlocal enabledelayedexpansion

REM === Définir les URLs des fichiers à télécharger ===
set "VM_URL=http://files.pharo.org/vm/pharo-spur64-headless/Windows-x86_64/latest10.zip"
set "INCLUDE_URL=http://files.pharo.org/vm/pharo-spur64-headless/Windows-x86_64/include/latest10.zip"

REM === Obtenir le chemin absolu du dossier du .bat ===
set "SCRIPT_DIR=%~dp0"

REM === Créer les dossiers nécessaires ===
mkdir "%SCRIPT_DIR%external"
mkdir "%SCRIPT_DIR%external\include"

REM === Télécharger le fichier VM ===
echo Downloading VM...
powershell -Command "Invoke-WebRequest -Uri '%VM_URL%' -OutFile '%SCRIPT_DIR%external\latest10.zip'"

REM === Télécharger le fichier include ===
echo Downloading VM Headers...
powershell -Command "Invoke-WebRequest -Uri '%INCLUDE_URL%' -OutFile '%SCRIPT_DIR%external\include\latest10.zip'"

echo Done!
pause

```


