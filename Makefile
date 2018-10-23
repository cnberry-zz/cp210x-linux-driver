obj-m = cp210x.o
KDIR = /lib/modules/`uname -r`/build
SRCDIR = $(PWD)
# try this instead if you don't have PWD defined
# SRCDIR = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

cp210x.ko: 
	$(MAKE) -C $(KDIR) M=$(SRCDIR) modules

install: cp210x.ko 
	sudo cp cp210x.ko /lib/modules/`uname -r`/kernel/drivers/usb/serial

load:
	sudo insmod /lib/modules/`uname -r`/kernel/drivers/usb/serial/usbserial.ko
	sudo insmod cp210x.ko
	
clean:
	$(MAKE) -C $(KDIR) M=$(SRCDIR) clean
