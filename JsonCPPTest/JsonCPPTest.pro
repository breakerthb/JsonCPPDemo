#-------------------------------------------------
#
# Project created by QtCreator 2016-12-08T20:06:37
#
#-------------------------------------------------
QT       -= core gui

TARGET = JsonCPPTest

TEMPLATE = app

INCLUDEPATH += ../JsonCPP/include

LIBS += -L../libs \
        -ljsoncpp

SOURCES += main.cpp
