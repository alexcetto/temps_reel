#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>
#include <fcntl.h>
#include <pthread.h>

#define DEVICENAME "/dev/sensor"
#define initVal 1
#define pseudoPeriod 2

static int devID;
static int *pWrite;


void * sendData(void * null)
{	
	int i = 0;

	while (1)
	{
		sleep(pseudoPeriod);		

		*pWrite += 3; 
		write(devID,(char*)pWrite,sizeof(int));
		
		printf("ecriture de %i(%i)\n",*pWrite,i);
		i++;
	
	}
	close(devID);
	pthread_exit(NULL);
}

int main(void)
{

	pthread_t sendDataID;
	int rptc;

	pWrite= (int*) malloc(sizeof(int));

	devID = open(DEVICENAME,O_RDWR);
	*pWrite = initVal;

	if (devID>0)
	{	printf("test Driver sur fd = %i\n", devID);

		rptc = pthread_create(&sendDataID,NULL,sendData,NULL);

		if (rptc==0)
		{
			printf("creation thread ecriture ok\n");
		}
		else
		{
			printf("pb creation thread\n");
		}
	}
	else
	{
		printf("erreur sur l'ouverture du device %i \n", devID);
	}
	
	pthread_exit(NULL);
}

