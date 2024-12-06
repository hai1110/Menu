#import "AppDelegate.h" 
 
@implementation AppDelegate 
 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { 
    // Yêu cầu quyền gửi thông báo 
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter]; 
    center.delegate = self; 
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) 
                          completionHandler:^(BOOL granted, NSError * _Nullable error) { 
        if (!granted) { 
            NSLog(@"Permission not granted"); 
        } 
    }]; 
 
    // Các cài đặt khác... 
 
    return YES; 
} 
 
// Xử lý thông báo khi ứng dụng đang chạy ở nền hoặc phía trước 
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler { 
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge); 
} 
 
// Xử lý hành động khi người dùng nhấn vào thông báo 
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler { 
    completionHandler(); 
} 
 
@end