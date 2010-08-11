#! /usr/bin/env ruby


require File.dirname(__FILE__)+"/cstruct.rb"
require 'pp'
require 'optparse'

class String
  def lcut(n)
    ret=self[0,n]
    self[0,n]=""
    return ret
  end
end




# V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4V4

MAX_MODELS_V4 = 16
MAXFILES_V4   = (1+MAX_MODELS_V4+3)

CStruct.defStruct "DirEnt_V4",<<-"END_TYP"
  uint8_t  startBlk;
  uint16_t size_typ;
  END_TYP

CStruct.defStruct "EeFs_V4",<<-"END_TYP"
  uint8_t  version;
  uint8_t  mySize;
  uint8_t  freeList;
  uint8_t  bs;
  DirEnt_V4   files[#{MAXFILES_V4}];
  END_TYP

CStruct.defStruct "MixData_V4",<<-"END_TYP"
  uint8_t destCh4_srcRaw4; //
  int8_t  weight;
  uint8_t  swtch5_curve3;
  uint8_t  speedUp4_speedDwn4;
  END_TYP



CStruct.defStruct "Crv5_V4",<<-"END_TYP"
  int8_t    c[5];
  END_TYP
CStruct.defStruct "Crv9_V4",<<-"END_TYP"
  int8_t    c[9];
  END_TYP
CStruct.defStruct "ModelData_V4",<<-"END_TYP"
  char      name[10];    // 10
  uint8_t   stickMode;   // 1
  uint8_t   tmrMode;     // 1
  uint16_t  tmrVal;      // 2
  uint8_t   protocol;    // 1
  char      res[3];      // 3
  LimitData_V1 limitData[8];// 3*8
  ExpoData_V1  expoData[4]; // 3*4
  MixData_V4   mixData[#{MAX_MIXERS_V1}]; //4*20
  Crv5_V4   curves5[2];   // 10
  Crv9_V4   curves9[2];   // 18
  TrimData_V1  trimData[4]; // 3*4
  END_TYP

CStruct.defStruct "TrainerData1_V4",<<-"END_TYP"
  uint8_t srcChn3_swtch5; //0-7 = ch1-8
  uint8_t weight6_mode2;  //off,add-mode,subst-mode
  END_TYP

CStruct.defStruct "TrainerData_V4",<<-"END_TYP"
  int16_t       calib[4];
  TrainerData1_V4  chanMix[4];
  END_TYP
CStruct.defStruct "EEGeneral_V4",<<-"END_TYP"
  uint8_t myVers;
  int16_t calibMid[4];
  int16_t calibSpan[4];
  uint16_t chkSum;
  uint8_t currModel; //0..15
  uint8_t contrast;
  uint8_t vBatWarn;
  int8_t  vBatCalib;  
  int8_t  lightSw;
  TrainerData_V4 trainer;
  END_TYP
class ErrorBadNextIndex < Exception; end
class Reader_V4
  def deepCopy(dst,src,key="")
    #pp "---",src
    src.each{|n,val,obj|
      n=n.sub(/swtch_posNeg/,"swtch5_curve3")
      n=n.sub(/destCh_srcRaw/,"destCh4_srcRaw4")
      k2 = key+"/"+n #.to_s
      if(!dst.child(n))
        puts "#{k2} not in dst"
        next
      end
      if obj.is_a? CStruct::BaseT
        dst.child(n).set(val)
      else
        deepCopy(dst.child(n),obj,k2)
      end
    }
  end
  def mod_fromV1(modv1)
    modv4=CStruct::ModelData_V4.new()
    deepCopy(modv4,modv1)
    modv4.limitData.each{|n,val,obj|
      obj.min+=100
      obj.max-=100
    }
    modv4.mixData.each{|n,val,obj|
      if (obj.swtch5_curve3 & 0x1f) != 0
        obj.swtch5_curve3-=1 if (obj.swtch5_curve3 & 0x1f) <  0x10
        obj.swtch5_curve3+=1 if (obj.swtch5_curve3 & 0x1f) >= 0x10
      end
    }
    modv4
    #puts modv4
  end
  def read(f)
    @eefs=CStruct::EeFs_V4.new()
    @eefs.read(f)
    @eefs.mySize == (@eefs.sizeof) or raise "bad size eefs"
    @bs=@eefs.bs
    @blocks = 0.chr*@eefs.mySize + f.read

    @fat=Array.new(@blocks.length/16,nil)
    @fbuf=[]
    @fbufdec=[]

    MAXFILES_V4.times{|fi|
      bi  = @eefs.files[fi].startBlk
      sz  = @eefs.files[fi].size_typ & 0xfff
      buf=""
      chain_each(bi){ |j,cnt,nxt|
        buf+=@blocks[j*16+1,15]
        if @fat[j] 
          puts "ERROR multiple use of block #{j}" 
          infoMap
          break
        end
        @fat[j]=(fi+?a).chr+("%02d "%cnt);
        true
      }
      @fbuf[fi]    = buf[0,sz]
      @fbufdec[fi] = decode(@fbuf[fi])
    }
    #free chain
    @freeBlks=0
    chain_each(@eefs.freeList){|j,cnt,nxt| 
      @freeBlks+=1
      puts "ERROR used block is also in free chain #{j}" if @fat[j] 
      if nxt>=0x80
        puts "ERROR bad chain index #{nxt} at idx#{j} = adr 0x%04x"%(j*16)
        @fat[j]="%+3d "%(nxt-j); 
        false
      else
        @fat[j]="%+3d "%(nxt-j); 
        true
      end
    }
    @fat.each_with_index{|f,i|
      next if i<4
      puts "ERROR lost block #{i}" if !f 
    }
  end
  def format
    @eefs=CStruct::EeFs_V4.new()
    @eefs.version=4
    @eefs.mySize=64
    @eefs.bs=16
    @blocks = 0.chr*2048
    (5..127).each{|i|
      @blocks[i*16]=i-1
    }
    @eefs.freeList=127
    general=CStruct::EEGeneral_V4.new()
    general.myVers = 1
    general.contrast = 30
    general.vBatWarn = 90
    sum=0
    4.times{|i|
      general.calibMid[i]  = 0x200;
      general.calibSpan[i] = 0x180;
      sum+=0x200+0x180
    }
    general.chkSum = sum & 0xffff;
    write(0,1,encode(general.toBin))
  end
  def alloc()
    ret=@eefs.freeList
    @eefs.freeList=@blocks[ret*16]
    @blocks[ret*16]=0
    ret
  end
  def write(fi,typ,buf)
    @eefs.files[fi].startBlk = p = alloc()
    @eefs.files[fi].size_typ = buf.length + (typ << 12 ) 
    while buf.length!=0
      ct=buf.lcut(15)
      @blocks[p*16+1,ct.length] = ct
      if buf.length!=0
         p=@blocks[p*16]=alloc
      end
    end
  end
  def close
    @eefs.toBin+@blocks[64..-1]
  end

  def infoMap
    puts "allocation map"
    @fat.each_with_index{|fx,i|
      print fx ? fx : '////'
      puts if i%16==15
    }
    puts
    puts "name sz typ sz2  blocks"
    puts "-----------------------"
    #     a    24  1   40  127, 126,
    MAXFILES_V4.times{|i|infoFile(i)}
    MAXFILES_V4.times{|i|infoFileFull(i)} if $opt_v>=1
  end
  def info
    @eefs.each{|n,val,obj|
      printf("%10s %5d 0x%x (%s)\n",n,val,val,obj.class.to_s[9..-1]) if val.is_a? Numeric
    }
    puts
    puts "freeBlks=#{@freeBlks} freeSz=#{@freeBlks*@bs}"
    infoMap
  end

  def encode(buf)
    buf=buf.dup
    obuf   = ""
    cnt    = 0
    state0 = true
    i_len  = buf.length
    (i_len+1).times{|i|
      nst0 = buf[i] == 0
      nst0 = false if  nst0 && !state0 && buf[i+1]!=0
      if nst0 != state0 || cnt>=0x7f || i==i_len
        if(state0)
          if cnt>0
            cnt|=0x80;
            obuf += cnt.chr
            cnt=0;
          end
        else
          obuf += cnt.chr
          obuf += buf[i-cnt,cnt]
          cnt=0;
        end
        state0 = nst0
      end
      cnt+=1
    }
    obuf
  end
  def decode(inbuf)
    inbuf=inbuf.dup
    outbuf=""
    while inbuf.length != 0
      ctrl = inbuf.lcut(1)[0]
      if ctrl &0x80 != 0
        outbuf += 0.chr * (ctrl&0x7f)
      else
        outbuf += inbuf.lcut(ctrl)
      end
    end
    outbuf
  end
  def chain_each(i,lim=255)
    cnt=0
    while i!=0
      nxt=@blocks[i*16+0]
      #printf("chain %d -> %d \n",i,nxt)
      if block_given?
        break if ! yield( i,cnt,nxt)
      end
      cnt += 1
      break if cnt>=lim
      raise ErrorBadNextIndex.new("bad next index %d"%nxt)  if nxt>=0x80
      i = nxt
    end
  end
  def infoFileFull(fi)
    puts "--- File #{fi}: ---------------------------------"
    return if @fbufdec[fi] == ""
    if fi==0
      general=CStruct::EEGeneral_V4.new()
      general.fromBin(@fbufdec[fi])
      puts general
    else
      buf=@fbufdec[fi]
      if (l1=buf.length) < (l2=CStruct::ModelData_V4.sizeof)
        puts "bad length #{l1} != #{l2} fill up with zeroes"
        buf=buf+(0.chr*(l2-l1))
      end
      mod=CStruct::ModelData_V4.new()
      mod.fromBin(buf)
      puts mod
    end
  end
  def infoFile(fi)
    bi  = @eefs.files[fi].startBlk
    sz  = @eefs.files[fi].size_typ & 0xfff
    typ = @eefs.files[fi].size_typ   >> 12
    printf("%s  %4d %2d  %3d ",(fi+?a).chr,sz,typ,@fbufdec[fi] ? @fbufdec[fi].length : 0)
    chain_each(bi,10){|j,cnt,nxt|  printf(" %d,",j); true}
    puts
  end
  def export(dir)
    @fbufdec.each_with_index{|buf,i|
      typ = @eefs.files[i].size_typ   >> 12
      File.open(dir+("/V4_%02d_%d"%[i,typ]),"w"){|fh|fh.write(buf)}
    }
  end
end



class Main
  def initialize
    opts=ARGV.options
    prg=File.basename($0)
    opts.summary_width=20
    opts.banner = "
Synopsis
    #{prg} [options] cmd
    #{prg}  info   file
    #{prg}  export file [dir=export]
Description
Options
"
    opts.on("-h","--help", "show this message")   {puts opts; exit}
    $opt_v=0
    opts.on("-q",          "be quiet")            {$opt_v  = -1  }
    opts.on("-v[lev]",     "set or increase verbose level (#{$opt_v})") { |v|        $opt_v += 1
      $opt_v  = v.to_i   if v =~ /^\d+$/
      $opt_v += v.length if v =~ /^v+$/
    }
    opts.parse!
    cmd=ARGV.shift || "info"
    send(cmd)
  end
  def export()
    file = ARGV[0] || 'eeprom.bin'
    dir  = ARGV[1] || 'export'
    Dir.mkdir(dir) if !File.directory?(dir)
    r=read(file)
    r.export(dir)
  end
  def info()
    file = ARGV[0] || 'eeprom.bin'
    r=read(file)
    #puts "eeprom version: #{@vers}"
    r.info
  end
  def convert
    file = ARGV[0] || 'eeprom.bin'
    dir  = ARGV[1] || 'export'
    Dir.mkdir(dir) if !File.directory?(dir)
    dv1=read(file).data
    puts dv1.modelData[0]
    rv4=Reader_V4.new
    rv4.format
    16.times{|m|
      dv4 = rv4.mod_fromV1(dv1.modelData[m])
      buf = dv4.toBin
      pp buf
      buf2 = rv4.encode(buf)
      buf == rv4.decode(buf2) or raise
      pp buf2
      #File.open(dir+("/V4_%02d_%d"%[m+1,2]),"w"){|fh|dv4.write(fh)}
      rv4.write(m+1,2,buf2)
    }
    File.open(dir+"/eeprom.gen","w"){|fh| fh.write( rv4.close) }
  end
  def read(file)
    File.open(file){|f|
      @vers=f.read(1)[0]
      f.seek(0)
      case @vers
      when 1; r=Reader_V1.new; r.read(f); return r
      when 4; r=Reader_V4.new; r.read(f); return r
      else
        raise "unknown eeprom version #{vers}"
      end
    }
  end
end


Main.new
