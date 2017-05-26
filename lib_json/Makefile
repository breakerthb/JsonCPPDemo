######################################
#
#
######################################

# Target File
# lib*.so
TARGET  := libJsonTest.so

# Compile Files
#ALL_CPP=$(shell ls ./*.cpp)
ALL_CPP=$(wildcard *.cpp)
ALL_HPP=-I ../include

#compile and lib parameter
#编译参数
CC      := g++
LIBS    :=
LDFLAGS :=
DEFINES := -DHAVE_CONFIG_H
INCLUDE := $(ALL_HPP)
CFLAGS  := -g -Wall -O3 $(DEFINES) $(INCLUDE)
CXXFLAGS:= $(CFLAGS) -std=c++11
SHARE   := -fPIC -shared -o

# Debug option
#CFLAGS=-g -c -Wall
# Release option
#CFLAGS=-O -c -Wall

SOURCE  := $(ALL_CPP)
# Replace SOURCES '.cpp' -> '.o'
OBJS=$(SOURCES:.cpp=.o)

.PHONY : all clean

all: $(TARGET)
 
$(TARGET):$(OBJS)
	$(CC) $(CXXFLAGS) $(SHARE) $@ $(OBJS) $(LDFLAGS) $(LIBS)
	echo $(OBJS)
	
%.o: %.cpp
	$(CC) $(CXXFLAGS) -fPIC -c -o $@ $^
	echo $(OBJS)

clean:
	rm -f $(OBJS) *~ $(TARGET) core