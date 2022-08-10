# Installing VMWare on Kali Linux

Installing VMWare on Kali linux may bring some unexpected errors. Those errors are related to not being able to properly find the kernel modules of the headers, used to compile.

How to solve it?

1) `find /usr -name "stddef.h"`. Get the path for the headers. Mine is: `/usr/src/linux-headers-5.16.0-1-common/include/linux` 
2) Compile all modules : `sudo CPATH=/usr/src/linux-headers-5.16.0-1-common/include/linux vmware-modconfig --console --install-all


### How to install it?

1) Update the sources list /etc/apt/sources.list uncommenting last line.

2) `sudo apt update && sudo apt upgrade"

3) Install linux headers. `sudo apt install linux-headers-$(uname -r)`

4) Download the .bundle from VMWare

5) `chmod +x ./VMWare.bundle` 

6) Execute it `sudo ./VMWare.bundle`


### License Key

After install or upgrade just insert the key and enjoy.

ZF3R0-FHED2-M80TY-8QYGC-NPKYF --->> This key is 100% worked for me up to VM 16.1.1 build-17801498
YF390-0HF8P-M81RQ-2DXQE-M2UT6
ZF71R-DMX85-08DQY-8YMNC-PPHV8

Updated on Nov 4, 2021: 
ZF3R0-FHED2-M80TY-8QYGC-NPKYF --->> This key is 100% worked for me in VM 16.2.0 build-18760230

Enjoy to make virtual machine!



