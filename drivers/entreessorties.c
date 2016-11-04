#define SIZE_SENSOR_MAX 1024

static char sensor_buff[SIZE_SENSOR_MAX];
static int lg_sensor_buff=0;

static ssize_t sensorRead(struct file *filp, char * buf, size_t count, loff_t *ppos)
{
  
  if (count > lg_sensor_buff)
      count = lg_sensor_buff;
  
  if (count > 0) {
      if (copy_to_user(buf, sensor_buff, sizeof(int)) != 0) {
          printk (KERN_ALERT "from %s : error copy_to_user\n", 
                  THIS_MODULE->name);
          return -EFAULT;
      }
      lg_sensor_buff -= count;
      if (lg_sensor_buff > 0)
          memmove(sensor_buff, &sensor_buff[count], lg_sensor_buff);
      
  }
#ifdef DEBUG
  printk(KERN_ALERT "from %s : Read operation OK\n", THIS_MODULE->name);
#endif
  return count;
}

static ssize_t sensorWrite(struct file *filp, const char * buf, size_t count, loff_t *ppos)
{
  if (count > (SIZE_SENSOR_MAX - lg_sensor_buff)) 
      count = SIZE_SENSOR_MAX - lg_sensor_buff;
  
  if (count > 0) {
    if (copy_from_user(sensor_buff, buf, sizeof(int)) !=0 ) {
        printk (KERN_ALERT "from %s : error copy_from_user\n", 
                THIS_MODULE->name);
        return -EFAULT;
    }
    lg_sensor_buff += count;
#ifdef DEBUG
    printk(KERN_ALERT "from %s : Write operation OK\n", 
           THIS_MODULE->name);
#endif
  }
  return count;
}
