######################################
# Make Static Library
# lib*.a
######################################
# Target File
# lib*.a
TARGET  := libjsoncpp.a

ALL_HPP := -I ../include
#ALL_CPP=$(shell ls ../lib_json/*.cpp)
ALL_CPP=$(wildcard ../lib_json/*.cpp)

######################################
# Compile and Lib
#编译参数
CC      := g++
AR		:= ar
RANLIB  := ranlib
LIBS    :=
LDFLAGS :=
DEFINES := -DHAVE_CONFIG_H
INCLUDE := $(ALL_HPP)
CFLAGS  := -g -c -Wall $(DEFINES) $(INCLUDE) # Debug option
#CFLAGS  := -O -c -Wall $(DEFINES) $(INCLUDE) # Release option
CXXFLAGS:= $(CFLAGS) -std=c++11
SHARE   := -fPIC -shared

SOURCES=$(ALL_CPP)
OBJS=$(SOURCES:.cpp=.o) # Replace SOURCES '.cpp' -> '.o'

all:$(TARGET)

$(TARGET): $(OBJS)
	$(AR) cru $(TARGET) $(OBJS)
	$(RANLIB) $(TARGET)

%.o: %.cpp
	$(CC) $(INCLUDE) -fPIC -c -o $@ $^

clean:
	rm -f $(OBJS) *~ $(TARGET) core