#include <linux/init.h>
#include <linux/module.h>

MODULE_LICENSE("GPL");
static int helloworld_init(void){
	printk(KERN_ALERT "Hello world mymod \n");
	return 0;
}

static void helloworld_exit(void){
	printk(KERN_ALERT "Goodbye mymod\n");
}

module_init(helloworld_init);
module_exit(helloworld_exit);