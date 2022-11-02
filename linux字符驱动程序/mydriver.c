#include <linux/ctype.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/io.h>
#include <linux/irq.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/uaccess.h>
#define BUFF_SIZE 1024
static unsigned int major;
static char buff[BUFF_SIZE];

int mydriver_open(struct inode *inode, struct file *file) {
    printk("mydriver_open is called. \n");
    return 0;
}

ssize_t mydriver_read(struct file *file, char __user *buf, size_t size,
                      loff_t *ppos) {
    printk("mydriver_read is called. \n");
    copy_to_user(buf, buff, size);
    return size;
}

ssize_t mydriver_write(struct file *file, const char __user *buf, size_t size,
                       loff_t *ppos) {
    printk("mydriver_write is called. \n");
    copy_from_user(buff, buf, size);
    return size;
}

static const struct file_operations mydriver_ops = {
    .owner = THIS_MODULE,
    .open = mydriver_open,
    .read = mydriver_read,
    .write = mydriver_write,
};

static int __init mydriver_init(void) {
    printk("mydriver_init is called. \n");

    major = register_chrdev(0, "mydriver", &mydriver_ops);
    printk("register_chrdev. major = %d\n", major);
    return 0;
}

static void __exit mydriver_exit(void) {
    printk("mydriver_exit is called. \n");
    unregister_chrdev(major, "mydriver");
}

MODULE_LICENSE("GPL");
module_init(mydriver_init);
module_exit(mydriver_exit);
