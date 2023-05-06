# RGBDS_PATH = "~/gbdev/rgbds/0.6.1/"

OUTPUT_NAME = tetris


BUILD_PATH = build$(EXTRA_BUILD_PATH)
RGBDS_ARG += -D BUILD_PATH=$(BUILD_PATH)

ifdef BUILD_MEGADUCK
	RGBDS_ARG += -D TARGET_MEGADUCK
endif


OBJS = $(BUILD_PATH)/bank_000.o $(BUILD_PATH)/soundEngine.o
BANK_0_FILES = \
	code/BType.s \
	code/gfx.s \
	code/inGameFlow.s \
	code/introScreens.s \
	code/menuScreens.s \
	code/multiplayer.s \
	code/shuttleRocket.s
RAM_OBJS = $(BUILD_PATH)/wram.o $(BUILD_PATH)/hram.o
INCS = include/constants.s include/hardware.inc include/macros.s include/structs.s

GFX_1BPP_OBJS = $(shell find gfx/1bpp/ -name '*.png' | sed "s/gfx\/1bpp/$(BUILD_PATH)/" | sed "s/.png/.1bpp/")
GFX_2BPP_OBJS = $(shell find gfx/2bpp/ -name '*.png' | sed "s/gfx\/2bpp/$(BUILD_PATH)/" | sed "s/.png/.2bpp/")
OUTFILES = -n $(BUILD_PATH)/tetris.sym -m $(BUILD_PATH)/tetris.map

all: $(BUILD_PATH)/tetris.gb

$(BUILD_PATH)/titleScreen.2bpp: gfx/2bpp/titleScreen.png
	$(RGBDS_PATH)rgbgfx -o $@ $< -x 9

$(BUILD_PATH)/menuScreens.2bpp: gfx/2bpp/menuScreens.png
	$(RGBDS_PATH)rgbgfx -o $@ $< -x 11

$(BUILD_PATH)/%.2bpp: gfx/2bpp/%.png
	$(RGBDS_PATH)rgbgfx -o $@ $<

$(BUILD_PATH)/%.1bpp: gfx/1bpp/%.png
	$(RGBDS_PATH)rgbgfx -d 1 -o $@ $<

$(BUILD_PATH)/wram.o: include/wram.s
	$(RGBDS_PATH)rgbasm $(RGBDS_ARG) -h -L -o $@ $<

$(BUILD_PATH)/hram.o: include/hram.s
	$(RGBDS_PATH)rgbasm $(RGBDS_ARG) -h -L -o $@ $<

$(BUILD_PATH)/bank_000.o: code/bank_000.s $(GFX_1BPP_OBJS) $(GFX_2BPP_OBJS) $(INCS) $(BANK_0_FILES)
	$(RGBDS_PATH)rgbasm $(RGBDS_ARG) -h -L -o $@ $<

$(BUILD_PATH)/soundEngine.o: code/soundEngine.s $(INCS)
	$(RGBDS_PATH)rgbasm $(RGBDS_ARG) -h -L -o $@ $<

$(BUILD_PATH)/tetris.gb: $(GFX_1BPP_OBJS) $(GFX_2BPP_OBJS) $(OBJS) $(RAM_OBJS)
	$(RGBDS_PATH)rgblink $(OUTFILES) -w -o $@ $(OBJS) $(RAM_OBJS)
# MegaDuck has no Header
ifndef BUILD_MEGADUCK
	$(RGBDS_PATH)rgbfix -v -p 255 $@
endif
	md5sum $@
ifdef BUILD_MEGADUCK
	mv -f $(BUILD_PATH)/tetris.gb $(BUILD_PATH)/tetris.duck
endif

clean:
	rm -f $(BUILD_PATH)/*
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +

romusage:
	romusage build/tetris.map

duckusage:
	romusage build_duck/tetris.map

megaduck:
	${MAKE} BUILD_MEGADUCK=ON EXTRA_BUILD_PATH=_duck

cleanduck:
	${MAKE} BUILD_MEGADUCK=ON EXTRA_BUILD_PATH=_duck clean

# Needs stock inside gadgets firmware to work, can use flashgbx ui to swap it out if needed
# Make sure 32K cart is specified
flashduck:
	-cd ../tools/gbxcart_duck; ./gbxcart_rw_megaduck_32kb_flasher ../../disasm/build_duck/tetris.duck &



