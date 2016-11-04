#include <linux/module.h> // needed for modules
#include <linux/kernel.h> // needed for KERN_ALERT
#include <linux/init.h>   // needed for macros
#include <linux/device.h> // needed for udev
#include <linux/fs.h>     // needed for driver management
#include <asm/uaccess.h>  // needed for copy_to/from_user
#include <linux/types.h>
#include <linux/cdev.h>
#include <linux/errno.h>
#include <linux/fcntl.h>
#include <linux/slab.h>

#define MAXDEVICES 1

static dev_t sensor_dev;
static struct cdev sensor_cdev;
static struct class * sensor_class = NULL;

static struct file_operations fops =
{
        .owner =        THIS_MODULE,
	.open =		sensorOpen,
	.read = 	sensorRead,
	.write =	sensorWrite,
	.release = 	sensorClose
};

static void __exit desinstall(void)
{
        cdev_del(&sensor_cdev);
        device_destroy(sensor_class, sensor_dev);
        class_destroy(sensor_class);
        unregister_chrdev_region(sensor_dev, MAXDEVICES);
	printk(KERN_ALERT "from %s : desinstallation OK\n", 
               THIS_MODULE->name);
}
static int __init install(void)
{
	int result;
	result = alloc_chrdev_region(&sensor_dev, 0, 
                                    MAXDEVICES, THIS_MODULE->name);

	if (result<0) {
	  printk(KERN_ALERT "from %s : install driver : can't get major number\n", THIS_MODULE->name);
          unregister_chrdev_region(sensor_dev, MAXDEVICES);
	  return result;
	}
	
	sensor_class = class_create( THIS_MODULE, "sensor_exemple");
        if (IS_ERR(sensor_class)) {
            printk(KERN_ALERT "from %s : error while creating class\n",
                   THIS_MODULE->name);
            unregister_chrdev_region(sensor_dev, MAXDEVICES);
            return -EINVAL;
        }
	
	device_create(sensor_class, NULL, sensor_dev, NULL, 
                      THIS_MODULE->name);
        
        cdev_init(&sensor_cdev, &fops);
        result = cdev_add(&sensor_cdev, sensor_dev, MAXDEVICES);
        if (result != 0) {
            printk(KERN_ALERT "error while creating device\n");
            device_destroy(sensor_class, sensor_dev);
            class_destroy(sensor_class);
            return result;
        }
	
	printk(KERN_ALERT "from %s : installation OK\n", 
               THIS_MODULE-> name);
	return 0;
}


module_init(install);
module_exit(desinstall);
