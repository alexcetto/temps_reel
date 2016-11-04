#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>
#include <fcntl.h>


#define DEVICENAME "/dev/sensor"

int main(void)
{

	int r;

	int readBytes;
	int devID = open(DEVICENAME,O_RDONLY);

	printf("test Driver sur fd = %i\n", devID);

	if (devID>0)
	{
		
		readBytes= read(devID,&r,sizeof(int));

		printf("lecture valeur capteur : %i (%d bytes)\n",r,readBytes);

		close(devID);
	}
	else
	{
		printf("erreur sur l'ouverture du device\n");
	}
	
	return 0;
}

