#
# Makefile for Dragon ROMS rom.
#
# 2006, 2020-02-19, P.Harvey-Smith.
#

AS=lwasm
ASFILES=DragonROM.asm 
ASFLAGS=-9 -r -I defs
ASFLAGS_SCREEN=$(ASFLAGS) -DROM_SCREEN_EDITOR
ASFLAGS_KBDFIX=$(ASFLAGS) -DROM_KBD_ROLLOVER_FIX
ASFLAGS_SCREEN_KBDFIX=$(ASFLAGS_SCREEN) -DROM_KBD_ROLLOVER_FIX

all: d32 d64_1 d64_2 screen
screen: screen32 screen64_1 screen64_2
kbdfix: kbdfix32 kbdfix64_1
screenkbdfix: screenkbdfix32 screenkbdfix64_1
#d32_test

d32:	DragonROM.asm
	$(AS) $(ASFLAGS) -oroms/dragon32.rom -llist/d32.lst DragonROM.asm
	

d64_1:	DragonROM.asm
	$(AS) $(ASFLAGS) -DDragon64 -oroms/dragon64_1.rom -llist/d64_1.lst DragonROM.asm

d64_2:	DragonROM.asm
	$(AS) $(ASFLAGS) -DDragon64 -DDragon64ram -oroms/dragon64_2.rom -llist/d64_2.lst DragonROM.asm

screen32:	DragonROM.asm
	$(AS) $(ASFLAGS_SCREEN) -oroms/dragon32_screen.rom -llist/d32_screen.lst DragonROM.asm

screen64_1:	DragonROM.asm
	$(AS) $(ASFLAGS_SCREEN) -DDragon64 -oroms/dragon64_1_screen.rom -llist/d64_1_screen.lst DragonROM.asm

screen64_2:	DragonROM.asm
	$(AS) $(ASFLAGS_SCREEN) -DDragon64 -DDragon64ram -oroms/dragon64_2_screen.rom -llist/d64_2_screen.lst DragonROM.asm

kbdfix32:	DragonROM.asm
	$(AS) $(ASFLAGS_KBDFIX) -oroms/dragon32_kbdfix.rom -llist/d32_kbdfix.lst DragonROM.asm

kbdfix64_1:	DragonROM.asm
	$(AS) $(ASFLAGS_KBDFIX) -DDragon64 -oroms/dragon64_1_kbdfix.rom -llist/d64_1_kbdfix.lst DragonROM.asm

screenkbdfix32:	DragonROM.asm
	$(AS) $(ASFLAGS_SCREEN_KBDFIX) -oroms/dragon32_screen_kbdfix.rom -llist/d32_screen_kbdfix.lst DragonROM.asm

screenkbdfix64_1:	DragonROM.asm
	$(AS) $(ASFLAGS_SCREEN_KBDFIX) -DDragon64 -oroms/dragon64_1_screen_kbdfix.rom -llist/d64_1_screen_kbdfix.lst DragonROM.asm

install32screen:
	@cmd.exe /C copy /Y "C:\Users\44798\Sync\Projects\DragonASM\DragonROMScreenEdit\Git branches\DragonRom\roms\dragon32_screen.rom" "C:\Users\44798\Documents\xroar\dragon32_screen.rom"

clean:
	rm -f roms/*.rom
	rm -f list/*.lst
	
check:
	cmp -l roms/dragon32.rom ../ROMS/d32.rom
	cmp -l roms/dragon64_1.rom ../ROMS/d64_1.rom
	cmp -l roms/dragon64_2.rom ../ROMS/d64_2.rom
