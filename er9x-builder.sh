#!/bin/bash
# ======================================
# er9x-builder
# created by rob.thomson to clean up
# the build process.
# l1/l2/l3 control the main er9x suffixes
# in use during compile (see below)
# ======================================

# levels of build used to work out permutations
l1=(er9x);   #base
l2=(frsky jeti ardupilot nmea); #ext
l3=(noht); #heli/templates

# main build function
function build {

	if [ -n "$2" ]; then
		ext="EXT=$2";
	else
		ext="";
	fi

	if [ -n "$3" ]; then
		noht="TEMPLATES=NO HELI=NO";
	else
		noht="";
	fi


	dname=$1-$2-$3.hex;	
	dname2=${dname/--/}	
	destination=${dname2/-.hex/.hex}
	logname=${destination/.hex/.log}

 # echo "";

  echo -n $destination | tr "[a-z]" "[A-Z]";
  echo -n " ";
  
  uext=$(echo -n $ext | tr "[a-z]" "[A-Z]")
  unoht=$(echo -n $noht | tr "[a-z]" "[A-Z]")
  ubeeper=$(echo -n $ubeeper | tr "[a-z]" "[A-Z]")
  
  echo -n "[CLEANING] ";
  make clean > ../buildlog/$logname 2>&1
  echo -n "[COMPILING] ";
	make $uext $unoht $ubeeper >> ../buildlog/$logname 2>&1 	
	mv er9x.hex ../$destination >> ../buildlog/$logname 2>&1;
	if [ $? -eq 1 ]; then
		echo  "[ERROR] [ABORTING]"
		echo " ";
		echo "------------------------------------------------";
		tail -n 18 ../buildlog/$logname;
		echo " ";
		echo "------------------------------------------------";
		exit;
	else
	  echo "[OK]";
	fi
	
	
}


#create buildlog folder if you do not have it!
if [[ ! -d "buildlog" ]];then
  mkdir buildlog;
fi

cd src/


echo "##########################################";
echo "# ER9X BUILDER - COMPILING ALL FIRMWARES #";
echo "##########################################";

echo " ";
#echo "COMPILING...";
#echo " ";

# this is the main loop that calls a function to build the firmware
for i in "${l1[@]}"
do
	:
	build $i;
	for j in  "${l2[@]}"
		do
			:
			build $i $j
			for k in  "${l3[@]}"
				do
					:
					build $i $j $k;
					for l in  "${l4[@]}"
						do
						:
							build $i $j $k $l;
						done
				done
		done
done

cd ../

