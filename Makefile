INSTALL_PATH?=/usr/local
COMPILER?=c++

PROGRAM = gilbert
SQUIRREL = squirrel
SQ_SRC = \
	$(SQUIRREL)/sqstdlib/sqstdblob.cpp \
	$(SQUIRREL)/sqstdlib/sqstdio.cpp \
	$(SQUIRREL)/sqstdlib/sqstdstream.cpp \
	$(SQUIRREL)/sqstdlib/sqstdmath.cpp \
	$(SQUIRREL)/sqstdlib/sqstdsystem.cpp \
	$(SQUIRREL)/sqstdlib/sqstdstring.cpp \
	$(SQUIRREL)/sqstdlib/sqstdaux.cpp \
	$(SQUIRREL)/sqstdlib/sqstdrex.cpp \
	$(SQUIRREL)/squirrel/sqapi.cpp \
	$(SQUIRREL)/squirrel/sqbaselib.cpp \
	$(SQUIRREL)/squirrel/sqfuncstate.cpp \
	$(SQUIRREL)/squirrel/sqdebug.cpp \
	$(SQUIRREL)/squirrel/sqlexer.cpp \
	$(SQUIRREL)/squirrel/sqobject.cpp \
	$(SQUIRREL)/squirrel/sqcompiler.cpp \
	$(SQUIRREL)/squirrel/sqstate.cpp \
	$(SQUIRREL)/squirrel/sqtable.cpp \
	$(SQUIRREL)/squirrel/sqmem.cpp \
	$(SQUIRREL)/squirrel/sqvm.cpp \
	$(SQUIRREL)/squirrel/sqclass.cpp
SOURCE_FILES = 	\
	squirrel.c \
	gilbert.c $(SQ_SRC)

LIBRARIES = \
	-lSDL2 \
	-Isquirrel/include

CFLAGS += $(LIBRARIES)

all: compile
	@echo "Done."

build: setup compile

setup:
	@echo "Setting up directories and generating dependecies."
	@mkdir -p build
	@echo "Done setting up."

compile:
	@echo "Compiling \"$(PROGRAM)\" program."
	$(COMPILER) $(SOURCE_FILES) -o build/$(PROGRAM) $(CFLAGS)
	@echo "$(PROGRAM) built successfully."

clean:
	@echo "Cleaning up..."
	@rm -rf build/

run: 
	@echo "Running '$(PROGRAM)' ..."
	@build/$(PROGRAM)

install: build
	@echo "Installing \"$(PROGRAM)\" program ..."
	@echo "Copying executables to $(INSTALL_PATH)/bin ..."
#	@cp build/$(PROGRAM) $(INSTALL_PATH)/bin
	@echo "Copying libraries to $(INSTALL_PATH)/lib..."
#	@cp libraries $(INSTALL_PATH)/lib or $(INSTALL_PATH)/lib/$(PROGRAM)
	@echo "Copying manual pages from $(INSTALL_PATH)/share/man/ ..."
#	@cp $(PROGRAM).1 $(INSTALL_PATH)/share/man/man1
	@echo "Copying documentation to $(INSTALL_PATH)/share/$(PROGRAM) ..."
#	@cp $(PROGRAM).md $(PROGRAM).pdf $(INSTALL_PATH)/share/$(PROGRAM)	
	@echo "Copying configuration files to $(INSTALL_PATH)/etc/$(PROGRAM) ..."
#	@cp $(PROGRAM).conf $(INSTALL_PATH)/etc/$(PROGRAM)
	@echo "Copying source header files to $(INSTALL_PATH)/include/$(PROGRAM)..."
#	@cp headers $(INSTALL_PATH)/include/$(PROGRAM)
	@echo "$(PROGRAM) installed successfully."

uninstall:
	@echo "Installing \"$(PROGRAM)\" program ..."
	@echo "Removing executables from $(INSTALL_PATH)/bin ..."
#	rm -rf $(INSTALL_PATH)/bin/$(PROGRAM)
	@echo "Removing libraries from $(INSTALL_PATH)/lib..."
	@echo "Removing manual pages from $(INSTALL_PATH)/share/man/ ..."
	@echo "Removing documentation from $(INSTALL_PATH)/share/$(PROGRAM) ..."
#	rm -rf $(INSTALL_PATH)/share/man/man1/$(PROGRAM).1
	@echo "Removing configuration files from $(INSTALL_PATH)/etc/$(PROGRAM) ..."
#	rm -rf $(INSTALL_PATH)/etc/$(PROGRAM)
	@echo "Removing source header files from $(INSTALL_PATH)/include/$(PROGRAM)..."
	@echo "$(PROGRAM) uninstalled successfully."
