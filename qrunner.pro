QT += core gui widgets

TARGET = qrunner
TEMPLATE = app

CONFIG += debug_and_release

Debug:DESTDIR = dist/debug
Debug:PRECOMPILED_DIR = $$DESTDIR
Debug:MOC_DIR = $$DESTDIR/.moc
Debug:OBJECTS_DIR = $$DESTDIR/.obj

Release:DESTDIR = dist/release
Release:PRECOMPILED_DIR = $$DESTDIR
Release:MOC_DIR = $$DESTDIR/.moc
Release:OBJECTS_DIR = $$DESTDIR/.obj

HEADERS += src/query.h

SOURCES += src/main.cpp \
           src/query.cpp

QMAKE_CLEAN += $(TARGET)

dmg.target = dmg
dmg.commands = cd dist/release && \ 
               macdeployqt qrunner.app -dmg -always-overwrite && \
               cd - && \
               rm -fv qrunner.dmg && \
               hdiutil convert -format UDRW -o qrunner dist/release/qrunner.dmg && \
               open -W qrunner.dmg && \
               ln -s /Applications /Volumes/qrunner/Applications && \
               cd - && \
               umount /Volumes/qrunner
dmg.depends = release

QMAKE_EXTRA_TARGETS += dmg
