:: may need to change these depending on environment:
CALL "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.cmd" /x64
::set QMAKESPEC=win32-msvc2010

:: set path to find resources shipped with qt-5:
set PATH=%SRC_DIR%\gnuwin32\bin;%PATH%
::set PATH=%SRC_DIR%\qtrepotools\bin;%PATH%
::set PATH=%SRC_DIR%\qtbase\bin;%PATH%

:: make sure we can find ICU:
set INCLUDE=%PREFIX%\include;%INCLUDE%
set LIB=%PREFIX%\libs;%LIB%
set PATH=%PREFIX%\DLLs;%PATH%

:: this needs to be CALLed due to an exit statement at the end of configure:
CALL configure -prefix %PREFIX% ^
      -libdir %PREFIX%\libs ^
      -bindir %PREFIX%\libs\qt5\bin ^
      -headerdir %PREFIX%\include\qt5 ^
      -archdatadir %PREFIX%\libs\qt5 ^
      -datadir %PREFIX%\share\qt5 ^
      -opensource ^
      -confirm-license ^
      -no-warnings-are-errors ^
      -nomake examples ^
      -nomake tests ^
      -fontconfig ^
      -qt-libpng ^
      -qt-zlib
      -skip qtwebkit ^
      -skip qtwebkit-examples
:: Hopefully we don't need to exclude qtwebkit in the future
:: But for now, its holding up the rest of the build due to an apparent
:: missing build dependency (google "RegExpJitTables.h no such file")


:: jom is nmake alternative with multicore support, uses all cores by default
jom
nmake install

:: temporary abort to check health of the standard unrelocated build
:: inspect to identify binary_has_prefix_files
:: identify binaries that need Scripts/*.bat wrappers
exit 1

::for file in $PREFIX/lib/qt5/bin/*
::do
::    ln -sfv ../lib/qt5/bin/$(basename $file) $PREFIX/bin/$(basename $file)-qt5
::done

:: remove docs, phrasebooks, translations
rmdir %PREFIX%\share\qt5 /s /q
