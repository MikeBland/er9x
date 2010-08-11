#! /usr/bin/env ruby



require File.dirname(__FILE__)+"/cstruct.rb"
require "fileutils"
include FileUtils::Verbose

CStruct.alignment=1
CStruct.defStruct "EEGeneralV1",<<-"END_TYP"
  uint8_t version;
  uint8_t contrast;
  uint8_t vBatWarn;
  uint8_t currModel;
  int16_t calibMid[4];
  int16_t calibSpan[4];
  uint16_t chkSum;
  uint8_t sizeGeneral;
  uint8_t sizeModel;
  uint8_t numModels;
  int8_t  lightSw;
  int8_t  vBatCalib;  
  uint8_t resv[5];  
  END_TYP

def main(file)
  bck=file+"~"
  cp(file,bck)
  buf = File.read(file)
  eegen = CStruct::EEGeneralV1.new(0)
  eegen.fromBin(buf)
  puts eegen
  puts eegen.version.get, eegen.version.offset
  puts eegen.calibMid[2],eegen.calibMid[2].offset
  %w(version sizeGeneral sizeModel numModels).each{|x|
    printf "%s = %d\n",x,eegen.send(x).to_i
  }
end




main(ARGV[0] || "eeprom.bin")
