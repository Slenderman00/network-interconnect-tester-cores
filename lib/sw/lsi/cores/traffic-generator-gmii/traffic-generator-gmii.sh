#!/bin/bash -e
#Usage: traffic-generator-gmii.sh [core-index]
#Example: traffic-generator-gmii.sh 0

function hex2dec {
    echo "obase=10; ibase=16; $1" | bc
}

address="`get-core-offset traffic_generator_gmii $1`"
CONTROL_REG_OFFSET=16
INTERFRAME_GAP_REG_OFFSET=`hex2dec 14`
INTERBURST_GAP_REG_OFFSET=`hex2dec 18`
FRAME_SIZE_REG_OFFSET=`hex2dec 44`
FRAME_BUF_REG_OFFSET=`hex2dec 50`


CONTROL_REG_ADDR="0x`printf '%x\n' $((${address}+${CONTROL_REG_OFFSET}))`"
INTERFRAME_GAP_REG_ADDR="0x`printf '%x\n' $((${address}+${INTERFRAME_GAP_REG_OFFSET}))`"
INTERBURST_GAP_REG_ADDR="0x`printf '%x\n' $((${address}+${INTERBURST_GAP_REG_OFFSET}))`"
FRAME_SIZE_REG_ADDR="0x`printf '%x\n' $((${address}+${FRAME_SIZE_REG_OFFSET}))`"
FRAME_BUF_REG_ADDR="0x`printf '%x\n' $((${address}+${FRAME_BUF_REG_OFFSET}))`"

devmem32 $INTERFRAME_GAP_REG_ADDR 0xC
devmem32 $INTERBURST_GAP_REG_ADDR 0xC
devmem32 $FRAME_SIZE_REG_ADDR 0x48
devmem32 $FRAME_BUF_REG_ADDR  0x55555555
devmem32 $FRAME_BUF_REG_ADDR  0x555555d5
devmem32 $FRAME_BUF_REG_ADDR  0x12345678
devmem32 $FRAME_BUF_REG_ADDR  0x9ABCDEF0
devmem32 $FRAME_BUF_REG_ADDR  0x12345678
devmem32 $FRAME_BUF_REG_ADDR  0x08004500
devmem32 $FRAME_BUF_REG_ADDR  0x002E0000
devmem32 $FRAME_BUF_REG_ADDR  0x00000A11
devmem32 $FRAME_BUF_REG_ADDR  0x2CBCC000
devmem32 $FRAME_BUF_REG_ADDR  0x0201C000
devmem32 $FRAME_BUF_REG_ADDR  0x0202C020
devmem32 $FRAME_BUF_REG_ADDR  0x0007001A
devmem32 $FRAME_BUF_REG_ADDR  0x00000001
devmem32 $FRAME_BUF_REG_ADDR  0x02030405
devmem32 $FRAME_BUF_REG_ADDR  0x06070809
devmem32 $FRAME_BUF_REG_ADDR  0x0A0B0C0D
devmem32 $FRAME_BUF_REG_ADDR  0x0E0F1011
devmem32 $FRAME_BUF_REG_ADDR  0x9CD50E0F

devmem32 $CONTROL_REG_ADDR 1
