#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MessageUtility : NSObject

+ (void)showToast:(NSString*)msg inView:(UIView*)view;

+ (void)alertVpnWithTitle:(NSString *)title message:(NSString *)msg
                   inView:(UIViewController *)view
             runVPNAction:(void (^)(UIAlertAction *))runVpnAction
         disableVPNAction:(void (^)(UIAlertAction *))disableVpnAction;

+ (void)alertWithTitle:(NSString *)title message:(NSString *)msg inView:(UIViewController *)view;
+ (void)alertWithTitle:(NSString *)title message:(NSString *)msg okButton:(UIAlertAction*)okButton inView:(UIViewController *)view;
+ (void)alertWithTitle:(NSString *)title message:(NSString *)msg buttons:(NSArray*)buttons inView:(UIViewController *)view;
+ (void)alertWithTitle:(NSString *)title message:(NSString *)msg okButton:(UIAlertAction*)okButton cancelButton:(UIAlertAction*)cancelButton inView:(UIViewController *)view;
+ (void)notificationAlertinView:(UIViewController *)view;
+ (void)autotestAlertinView:(UIViewController *)view;
+ (void)sendLocalNotification:(NSString*)text;
@end
