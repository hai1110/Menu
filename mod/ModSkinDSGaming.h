
#ifndef ModSkinDSGaming_h
#define ModSkinDSGaming_h

#import "Logo.h"
#import "LoadView/FTNotificationIndicator.h"
#import "SSZipArchive/SSZipArchive.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
@interface ModSkinDSGM : UIViewController <UIDocumentPickerDelegate>


+ (void)ActiveModDSGM; // mod skin ở đây


@end

#endif
