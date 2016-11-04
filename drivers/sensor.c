#include <linux/interrupt.h>
#include <linux/version.h>
#include <linux/device.h>
#include <linux/module.h>
#include <linux/sched.h>
#include <linux/cdev.h>
#include <linux/fs.h>

#include <asm/uaccess.h>

static int irq_nbr = 1;
module_param(irq_nbr, int, 0444);

static dev_t sensor_dev;
static struct cdev sensor_cdev;
static struct class * sensor_class = NULL;

static int read_sensor(struct file * filep, char * buffer, size_t length, loff_t * offset);

static irqreturn_t sensor_handler(int irq, void * ident);

static struct file_operations fops_sensor = {
	.owner = THIS_MODULE,
	.read = read_sensor
};

#define SIZE_DATA_SENSOR 4096

static long int data_sensor [SIZE_DATA_SENSOR];
static int lg_data_sensor = 0;
static spinlock_t spl_data_sensor;
static DECLARE_WAIT_QUEUE_HEAD(wq_data_sensor);

#define MINOR_NB 1

static int __init sensor_init(void){
	int error;
	error = alloc_chrdev_region(&sensor_dev, 0, MINOR_NB, THIS_MODULE->name);

	if(error < 0)
		return error;

	sensor_class = class_create(THIS_MODULE, "sensor");
	if(IS_ERR(sensor_class)){
		unregister_chrdev_region(sensor_dev, MINOR_NB);
		return EINVAL;
	}
	device_create(sensor_class, NULL, sensor_dev, NULL, THIS_MODULE->name);
	spin_lock_init(&spl_data_sensor);
	cdev_init(&sensor_cdev, &fops_sensor);
	
	error = cdev_add(&sensor_cdev, sensor_dev, MINOR_NB);
	if(error != 0){
		device_destroy(sensor_class, sensor_dev);
		class_destroy(sensor_class);
		unregister_chrdev_region(sensor_dev, MINOR_NB);
		return error;
	}

	error = request_irq(irq_nbr, sensor_handler, IRQF_SHARED, THIS_MODULE->name, THIS_MODULE->name);
	if (error != 0){
		cdev_del(&sensor_cdev);
		device_destroy(sensor_class, sensor_dev);
		class_destroy(sensor_class);
		unregister_chrdev_region(sensor_dev, MINOR_NB);
		return error;
	}
	return 0;
}


static void __exit sensor_exit(void) {
	free_irq(irq_nbr, THIS_MODULE->name);
	cdev_del(&sensor_cdev);
	device_destroy(sensor_class, sensor_dev);
	class_destroy(sensor_class);
	unregister_chrdev_region(sensor_dev, MINOR_NB);
}
