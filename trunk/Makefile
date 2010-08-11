

SRC= simu.cpp th9x.cpp menus.cpp pers.cpp file.cpp lcd.cpp drivers.cpp 
SRC:=$(foreach f,$(SRC),src/$(f))


all:  tgt_bin 


INC=-I/usr/local/include/fox-1.6 -I/usr/include/fox-1.6 \
    -I$(FOXPATH)/include

LIB=-L/usr/local/lib \
    -L$(FOXPATH)/src/.libs \
    -lFOX-1.6 \
    -Wl,-rpath,$(FOXPATH)/src/.libs



CFLAGS= -g -Wall
simu: $(SRC) Makefile src/*.h src/*.lbm eeprom.bin
	gcc src/stamp.cpp $(SRC) $(CFLAGS) -o$@ $(INC) $(LIB)  -MD -DSIM
	mv *.dsimu OBJS


eeprom.bin:
	dd if=/dev/zero of=$@ bs=1 count=2048

tgt_bin:
	ruby ./make.rb bin

dump:
	ruby ./make.rb dump

file: src/file.cpp
	g++  -DTEST -DSIM $(CFLAGS) src/file.cpp -o$@

-include OBJS/*.dsimu
