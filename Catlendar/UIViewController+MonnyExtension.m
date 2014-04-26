#import "UIViewController+MonnyExtension.h"

@implementation UIViewController (MonnyExtension)

+ (UIViewController *) mn_controllerFromName:(NSString *)name {
    @try {
        return [[UIStoryboard storyboardWithName: @"MainStoryboard" bundle: nil] instantiateViewControllerWithIdentifier: name];
    } @catch (NSException *exception) {
        Class theClass = NSClassFromString(name);
        return [theClass new];
    }
}

@end
