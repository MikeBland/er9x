#! /usr/bin/env ruby


require "pp"


def extract(f,name,ofs,w,h)
  vbytes=File.read(f)[ofs,w*h/8]
  
  #pp vbytes.length
# #define sticks_width 18
# #define sticks_height 32
# static unsigned char sticks_bits[] = {
# };
  hbytes=Array.new(w*h/8,0)
  x=-1
  wb=w/8
  vbytes.each_byte{|b| x+=1
    yi = x%8
    xb = x/8 % wb
    yb = x/w
    pp [b,yi,xb,yb]
    8.times{|i|
      hbytes[xb+i*wb+ yb*wb*8] |= (1 << yi) if (b & (1 << i)) != 0
    }
  }


  File.open(name+".xbm","w"){|fo|
    fo.puts "#define #{name}_width #{w}"
    fo.puts "#define #{name}_height #{h}"
    fo.puts "static unsigned char #{name}_bits[] = {"

    hbytes.each_with_index{|b,x|
      fo.printf("0x%02x, ",b);
      fo.puts if x % 16 == 15
    }

    fo.puts "};"
  }

end


f="/home/thus/work/avrProj/th9x-orig/flash.bin"
extract(f,"font",0x185b,5*16,6*8)
