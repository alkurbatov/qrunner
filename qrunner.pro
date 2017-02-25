QT += core gui widgets

TARGET = qrunner
TEMPLATE = app

HEADERS += src/query.h

SOURCES += src/main.cpp \
           src/query.cpp

DESTDIR = dist
MOC_DIR = dist
OBJECTS_DIR = dist

