# Which Compiler
CC=g++ 

# Debug option
CFLAGS=-g -c -Wall
# Release option
#CFLAGS=-O -c -Wall
CFLAGS+=-std=c++11

#DEFINE=-DUNICODE -D_LINUX_ 

#ALL_CPP=$(shell ls ./*.cpp)
ALL_CPP=$(wildcard *.cpp)
ALL_HPP=-I ./include

SOURCES=$(ALL_CPP)
INCDIR=$(ALL_HPP)

# Replace SOURCES '.cpp' -> '.o'
OBJS=$(SOURCES:.cpp=.o)

# Libs
LIB_PATH=lib_json

TARGET=JsonTest

all:$(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(INCDIR) $^ -o $@ -L$(LIB_PATH) -ljsoncpp -Wl,-rpath=$(LIB_PATH)

%.o: %.cpp
	$(CC) $(INCDIR) -fPIC -c -o $@ $^
	
.cc.o:
	$(CC) $(CFLAGS) $(DEFINE) $(INCDIR) -c $<

clean:
	rm -f $(OBJS) *~ $(TARGET) core
