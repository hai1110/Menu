//
// ModSkinDSGaming.h
// ModSkinDSGM
//
// Created by DS Gaming on 08/02/2021
// Long live Vietnam
//
// djt me bon an cap khong ghi nguon

#import "ModSkinDSGaming.h"

@implementation ModSkinDSGM

NSString *lqicon1 = lqmbconfig;
NSData *datalq1 = [[NSData alloc] initWithBase64EncodedString:lqicon1 options:0];
UIImage *img2 = [UIImage imageWithData:datalq1];

UIAlertController *alertCtrl3;

NSFileManager *fileManager3;
NSString *documentDir3;

+ (instancetype)sharedInstance {

}

+ (void)ActiveModDSGM {

}

- (void)load {

}

- (void)suce {

}

- (void)presentDocumentPicker {

}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {

}

- (void)handleSelectedZip:(NSURL *)url {

}


@end