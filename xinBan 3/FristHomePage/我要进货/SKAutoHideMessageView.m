
#import "SKAutoHideMessageView.h"
#import <objc/runtime.h>

const NSString * msgLabelKey = @"skMsgLabelKey";

@implementation SKAutoHideMessageView

+ (void)showMessage:(NSString *)msg inView:(UIView *)view
{
    [SKAutoHideMessageView showMessage:msg inView:view duration:3.0f];
}

+ (void)showMessage:(NSString *)msg inView:(UIView *)view duration:(NSTimeInterval)duration
{
    if(view && msg && duration > 0)
    {
        UILabel *lb = (UILabel *)objc_getAssociatedObject(view, (__bridge const void *)(msgLabelKey));
        if(!lb)
        {
            lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260.0f, 2000.0f)];
            lb.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75f];
            lb.textColor = [UIColor whiteColor];
            lb.textAlignment = NSTextAlignmentCenter;
            lb.layer.cornerRadius = 4.0f;
            lb.font = [UIFont boldSystemFontOfSize:14];
            lb.numberOfLines = 0;
            
            [view addSubview:lb];
            objc_setAssociatedObject(view, (__bridge const void *)(msgLabelKey), lb, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
           
            
            __block UILabel *blockLabel = lb;
            double delayInSeconds = duration;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [blockLabel removeFromSuperview];
                objc_setAssociatedObject(view, (__bridge const void *)(msgLabelKey), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            });
        }
        
        [view bringSubviewToFront:lb];
        
        CGSize vwSize = view.bounds.size;
        CGSize lbSize = [msg sizeWithFont:[UIFont boldSystemFontOfSize:14.0f] constrainedToSize:CGSizeMake(260.0f, 2000.0f) lineBreakMode:NSLineBreakByCharWrapping];
        lbSize.width = MIN(260.0f, MAX(60.0f, lbSize.width + 20.0f));
        lbSize.height = MIN(120.0f, MAX(30.0f, lbSize.height + 20.0f));
        lb.frame = CGRectMake(0, 0, lbSize.width, lbSize.height);
        lb.center = CGPointMake(vwSize.width / 2.0f, vwSize.height * 0.65);
        lb.text = msg;
    }
}

@end
