nmake
nmake install

::for file in $PREFIX/lib/qt5/bin/*
::do
::    ln -sfv ../lib/qt5/bin/$(basename $file) $PREFIX/bin/$(basename $file)-qt5
::done

rm -r %PREFIX%\share\qt5
