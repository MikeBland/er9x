#!/bin/bash
cd src
echo
make clean
make EXT=FRSKY TEMPLATES=NO HELI=NO
mv er9x.hex ../er9x-frsky-noht.hex

cd ..