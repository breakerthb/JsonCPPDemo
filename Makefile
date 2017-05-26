######################################
#
######################################
#source file
#ALL_CPP=$(shell ls ./*.cpp)
ALL_CPP=$(wildcard *.cpp)
ALL_HPP=-I ./include

SOURCES=$(ALL_CPP)
INCDIR=$(ALL_HPP)

OBJS=$(SOURCES:.cpp=.o) # Replace SOURCES '.cpp' -> '.o'
  
# Target File
TARGET  := JsonTest
  
# Compile and lib
CC      := g++
LIBPATH := StaticLib #DynamicLib
LIBS    := -ljsoncpp
LDFLAGS :=
DEFINES := -DUNICODE
INCLUDE := $(ALL_HPP)
CFLAGS  := -g -c -Wall $(DEFINES) $(INCLUDE) # Debug option
#CFLAGS  := -O -c -Wall $(DEFINES) $(INCLUDE) # Release option
CXXFLAGS:= $(CFLAGS) -DHAVE_CONFIG_H

all:$(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(INCLUDE) $^ -o $@ -L$(LIBPATH) $(LIBS) -Wl,-rpath=$(LIBPATH)

%.o: %.cpp
	$(CC) $(INCLUDE) -fPIC -c -o $@ $^
	
.cc.o:
	$(CC) $(CFLAGS) $(DEFINE) $(INCLUDE) -c $<

clean:
	rm -f $(OBJS) *~ $(TARGET) core
