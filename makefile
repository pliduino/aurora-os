ASM=nasm

SRC=src
BUILD_DIR=build

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	copy .\$(BUILD_DIR)\main.bin .\$(BUILD_DIR)\main_floppy.img
	fsutil file setEOF .\build\main_floppy.img 1440000


$(BUILD_DIR)/main.bin:
	$(ASM) $(SRC)/main.asm -f bin -o $(BUILD_DIR)/main.bin