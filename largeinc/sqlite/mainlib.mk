
TARGET := EXECUTABLE_PER_SOURCE

TGT_LDLIBS  := ${TARGET_DIR}/libsqlite3.a -pthread -ldl

TGT_PREREQS := libsqlite3.a

SOURCES := shell.c shell2.c shell3.c shell4.c shell5.c

