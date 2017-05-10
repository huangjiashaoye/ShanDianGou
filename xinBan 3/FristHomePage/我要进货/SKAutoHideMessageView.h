
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SKAutoHideMessageView : NSObject

+ (void)showMessage:(NSString *)msg inView:(UIView *)view;
+ (void)showMessage:(NSString *)msg inView:(UIView *)view duration:(NSTimeInterval)duration;

@end
