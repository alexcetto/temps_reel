obj-m = sensor.o 

all :
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	gcc -o LireCapteur LireCapteur.c 
	gcc -o SimulCapteur -lrt -pthread SimulCapteur.c

clean :
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	rm -f LireCapteur SimulCapteur

