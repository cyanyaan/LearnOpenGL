# Compiler and flags
CC = g++
CFLAGS = -Iinclude
LDFLAGS = -lglfw -ldl -lGL -lm

# Source files
SRC_DIR = src
INCLUDE_DIR = include
GLAD_SRC = $(SRC_DIR)/glad.c
MAIN_SRC = $(SRC_DIR)/main.cpp

# Output files
OBJ_DIR = obj
GLAD_OBJ = $(OBJ_DIR)/glad.o
MAIN_EXEC = engine

# Phony targets
.PHONY: all clean

# Rule to build the project
all: $(MAIN_EXEC)

# Ensure object directory exists before compiling
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Compile glad.c to glad.o
$(GLAD_OBJ): $(GLAD_SRC) | $(OBJ_DIR)
	$(CC) -c $(GLAD_SRC) -o $(GLAD_OBJ) $(CFLAGS)

# Build the executable by linking glad.o and main.cpp
$(MAIN_EXEC): $(MAIN_SRC) $(GLAD_OBJ)
	$(CC) $(MAIN_SRC) $(GLAD_OBJ) -o $(MAIN_EXEC) $(CFLAGS) $(LDFLAGS)

# Clean up object files and executable
clean:
	rm -rf $(OBJ_DIR) $(MAIN_EXEC)