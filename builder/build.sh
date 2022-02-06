#!/bin/bash

set -e
cd $(dirname $0)

# Build HAL
git clone https://github.com/Lora-net/picoGW_hal
pushd picoGW_hal
sed -i 's/#define STM32FWVERSION 0x010a0006/#define STM32FWVERSION 0x010a0004/' libloragw/inc/loragw_mcu.h
make
popd

# Build Packet forwarder
git clone https://github.com/Lora-net/picoGW_packet_forwarder.git
pushd picoGW_packet_forwarder
make
popd

