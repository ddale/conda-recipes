## Packages needed to build with RHEL6

- xcb-util-devel

These may have been optional

- libudev-devel
- pcre-devel
- mesa-libEGL

## Notes concerning OS X

- I found it necessary to uninstall the qt4-mac macports package. Qt5 was
  picking up Qt4 headers.
- Found apparent race conditions when running make with multiple jobs.

## Notes concerning Windows:

- Building from source requires ActivePerl. Building webkit would also require
  ruby, ICU, and perhaps sqlite3.
  See qt-project.org/doc/qt-5/windows-building.html and
  http://qt-project.org/doc/qt-5/windows-requirements.html. Also,
  http://blog.eonsoft.us/?p=545 may be useful. Perhaps it would be easier to
  deal with the Qt-5 windows installer.
