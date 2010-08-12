	.file	"stamp.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
.global	stamp1
	.section	.progmem.data,"a",@progbits
	.type	stamp1, @object
	.size	stamp1, 19
stamp1:
	.string	"VERS: V1.1801-erez"
.global	stamp2
	.type	stamp2, @object
	.size	stamp2, 17
stamp2:
	.string	"DATE: 12.08.2010"
.global	stamp3
	.type	stamp3, @object
	.size	stamp3, 15
stamp3:
	.string	"TIME: 14:23:58"
.global	stamp4
	.type	stamp4, @object
	.size	stamp4, 15
stamp4:
	.string	" SVN: trunk-r7"
	.text
.Letext0:
	.section	.debug_info
	.long	0x116
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF14
	.byte	0x4
	.long	.LASF15
	.long	.LASF16
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF17
	.byte	0x3
	.byte	0x7a
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF7
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x6
	.long	.LASF9
	.byte	0x1
	.word	0x1a2
	.long	0x2c
	.byte	0x1
	.byte	0x1
	.uleb128 0x7
	.long	0x78
	.long	0x9d
	.uleb128 0x8
	.long	0x75
	.byte	0x12
	.byte	0x0
	.uleb128 0x9
	.long	.LASF10
	.byte	0x2
	.byte	0x7
	.long	0xaf
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	stamp1
	.uleb128 0xa
	.long	0x8d
	.uleb128 0x7
	.long	0x78
	.long	0xc4
	.uleb128 0x8
	.long	0x75
	.byte	0x10
	.byte	0x0
	.uleb128 0x9
	.long	.LASF11
	.byte	0x2
	.byte	0x8
	.long	0xd6
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	stamp2
	.uleb128 0xa
	.long	0xb4
	.uleb128 0x7
	.long	0x78
	.long	0xeb
	.uleb128 0x8
	.long	0x75
	.byte	0xe
	.byte	0x0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x2
	.byte	0x9
	.long	0xfd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	stamp3
	.uleb128 0xa
	.long	0xdb
	.uleb128 0x9
	.long	.LASF13
	.byte	0x2
	.byte	0xa
	.long	0x114
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	stamp4
	.uleb128 0xa
	.long	0xdb
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x3a
	.word	0x2
	.long	.Ldebug_info0
	.long	0x11a
	.long	0x9d
	.string	"stamp1"
	.long	0xc4
	.string	"stamp2"
	.long	0xeb
	.string	"stamp3"
	.long	0x102
	.string	"stamp4"
	.long	0x0
	.section	.debug_line
	.long	.LELT0-.LSLT0
.LSLT0:
	.word	0x2
	.long	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1
	.ascii	"../src"
	.byte	0
	.ascii	"/usr/lib/gcc/avr/4.3.4/../../../avr/include"
	.byte	0
	.byte	0x0
	.string	"er9x.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"stamp.cpp"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdint.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF5:
	.string	"long long int"
.LASF2:
	.string	"unsigned int"
.LASF11:
	.string	"stamp2"
.LASF4:
	.string	"long unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF7:
	.string	"bool"
.LASF9:
	.string	"g_beepCnt"
.LASF17:
	.string	"uint8_t"
.LASF1:
	.string	"unsigned char"
.LASF8:
	.string	"char"
.LASF10:
	.string	"stamp1"
.LASF3:
	.string	"long int"
.LASF12:
	.string	"stamp3"
.LASF13:
	.string	"stamp4"
.LASF15:
	.string	"../src/stamp.cpp"
.LASF0:
	.string	"signed char"
.LASF14:
	.string	"GNU C++ 4.3.4"
.LASF16:
	.string	"/home/erez/Desktop/er9x/er9x/OBJS"
