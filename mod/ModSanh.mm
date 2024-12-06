#import "ModSanh.h"
#import <UIKit/UIKit.h>

@implementation ModSanh

+ (instancetype)sharedInstance {
    static ModSanh *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)ActiveModSanh {
    NSLog(@"ActiveModSanh called");
}

@end
