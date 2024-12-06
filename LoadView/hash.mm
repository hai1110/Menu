
#import "encrypt.h"
#import <Foundation/Foundation.h>
NSString * const __kHashDefaultValue = NSSENCRYPT("TNSIOS-sdgbHcZ0BXUkPv7LTyiEu2W9F5SqeltCb95be3eaf6f1e7767517a2d9c152dc4e"); //token package
NSString * const __notificationTitle = NSSENCRYPT("Thông báo"); //Têu đề
NSString * const __notificationTitlenoidung = NSSENCRYPT("AOV - Elite VIP"); //Nội dung 
NSString * const __contact = NSSENCRYPT("Liên hệ"); //Nội dung nút liên hệ
NSString * const __Confirm = NSSENCRYPT("Xác nhận"); //Nội dung nút xác nhận
NSString * const __Input = NSSENCRYPT("Nhập Key Ở Đây"); //Nội dung ô nhập
//link liên hệ có thể đổi thành link vượt để gắn link kiếm tiền ở phần package trên server khi tạo package thì trên web có yêu cầu nhập link liên hệ thì đổi từ đó
