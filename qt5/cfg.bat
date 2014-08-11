CALL "C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\vcvarsall.bat" amd64
set PATH=%SRC_DIR%\gnuwin32\bin;%PATH%
set PATH=%SRC_DIR%\qtrepotools\bin;%PATH%
set PATH=%SRC_DIR%\qtbase\bin;%PATH%
set QMAKESPEC=win32-msvc2010

CALL configure -prefix %PREFIX% ^
      -libdir %PREFIX%\lib ^
      -bindir %PREFIX%\lib\qt5\bin ^
      -headerdir %PREFIX%\include\qt5 ^
      -archdatadir %PREFIX%\lib\qt5 ^
      -datadir %PREFIX%\share\qt5 ^
      -opensource ^
      -confirm-license ^
      -nomake examples ^
      -nomake tests ^
      -fontconfig ^
      -qt-libpng ^
      -qt-zlib

nmake
nmake install

::for file in $PREFIX/lib/qt5/bin/*
::do
::    ln -sfv ../lib/qt5/bin/$(basename $file) $PREFIX/bin/$(basename $file)-qt5
::done

rm -r %PREFIX%\share\qt5