
set deployPath=F:\Project\build-QUsb2snes-Desktop_Qt_5_11_1_MSVC2017_64bit-Release\qtc_Desktop_Qt_5_11_1_MSVC2017_64bit_Release\install-root
set projectPath=F:\Project\QUsb2snes
set usb2snes=F:\Romhacking\usb2snes_v7\usb2snes_v7
set magic2snes=F:\Project\deploy\Magic2Snes
set qfile2snes=F:\Project\deploy\QFile2Snes
set snesclassicmod=F:\Project\snesclassicstuff\serverstuff\hmod\serverstuff.hmod
set savestate2snes=F:\Project\deploy\Savestate2snes

cd %deployPath%


echo "Deploy QT"
windeployqt.exe --no-translations --no-system-d3d-compiler --no-opengl-sw --no-opengl --no-webkit --no-patchqt --no-webkit2 --release  %deployPath%\QUsb2Snes.exe

:: Clean up Qt extra stuff
::rmdir /Q /S %deployPath%\imageformats
::del %deployPath%\Qt5core.dll
::xcopy /y C:\Qt\Qt5.11.0\5.11.0\msvc2017_64\bin\Qt5core.dll %deployPath%
del %deployPath%\libEGL.dll
del %deployPath%\libGLESV2.dll
del %deployPath%\vc_redist.x64.exe
::xcopy %deployPath% "D:\VM shared\qubs2snes" /syq
rmdir /Q /S %deployPath%\apps
mkdir %deployPath%\apps
mkdir %deployPath%\apps\Savestate2snes
mkdir %deployPath%\apps\QFile2Snes
mkdir %deployPath%\Magic2Snes
xcopy %usb2snes%\apps %deployPath%\apps /syq
xcopy %magic2snes% %deployPath%\Magic2Snes /syq
xcopy %savestate2snes% %deployPath%\apps\Savestate2snes /syq
xcopy %qfile2snes% %deployPath%\apps\QFile2Snes /syq
xcopy %snesclassicmod% %deployPath%\
xcopy %projectPath%\LICENSE %deployPath%\
xcopy %projectPath%\README.md %deployPath%\Readme.txt

cd %projectPath%
