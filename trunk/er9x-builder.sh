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
l2=(frsky jeti ardupilot); #ext
l3=(noht); #heli/templates

# main build function
function build {

  echo "";
	echo "===== making $1 $2 $3 =======";

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

  echo "> compiling";
	make $ext $noht $beeper > ../buildlog/$logname 2>&1
	mv er9x.hex ../$destination >> ../buildlog/$logname 2>&1;
	if [ $? -eq 1 ]; then
		echo "> error during compile"
		tail -n 18 ../buildlog/$logname;
		exit;
	else
	  echo "> ok";
	fi
	
	#test=$(egrep "cannot stat" ../buildlog/$logname);
	
	#check if error ocurred
	
	
  echo "======================";

}

#create buildlog folder if you do not have it!
if [[ ! -d "buildlog" ]];then
  mkdir buildlog;
fi

cd src/


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