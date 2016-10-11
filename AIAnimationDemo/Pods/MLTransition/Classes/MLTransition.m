//
//  MLTransition.m
//  MLTransition
//
//  Created by molon on 7/8/14.
//  Copyright (c) 2014 molon. All rights reserved.
//

#import "MLTransition.h"
#import <objc/runtime.h>
#import <dlfcn.h>

//设置一个默认的全局使用的type，默认是普通拖返模式
static MLTransitionGestureRecognizerType __MLTransitionGestureRecognizerType = MLTransitionGestureRecognizerTypePan;
static BOOL __MLTransitionEnabled = NO;

@interface NSString (__MLTransition_Encrypt)

- (NSString *)__mlEncryptString;
- (NSString *)__mlDecryptString;

@end

@implementation NSString (__MLTransition_Encrypt)

- (NSString *)__mlRot13
{
    const char *source = [self cStringUsingEncoding:NSASCIIStringEncoding];
    char *dest = (char *)malloc((self.length + 1) * sizeof(char));
    if (!dest) {
        return nil;
    }
    
    NSUInteger i = 0;
    for ( ; i < self.length; i++) {
        char c = source[i];
        if (c >= 'A' && c <= 'Z') {
            c = (c - 'A' + 13) % 26 + 'A';
        }
        else if (c >= 'a' && c <= 'z') {
            c = (c - 'a' + 13) % 26 + 'a';
        }
        dest[i] = c;
    }
    dest[i] = '\0';
    
    NSString *result = [[NSString alloc] initWithCString:dest encoding:NSASCIIStringEncoding];
    free(dest);
    
    return result;
}

- (NSString *)__mlEncryptString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64 = [data base64EncodedStringWithOptions:0];
    return [base64 __mlRot13];
}

- (NSString *)__mlDecryptString
{
    NSString *rot13 = [self __mlRot13];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:rot13 options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end

#pragma mark - UIView category implementation
NSString * const kMLTransition_UIView_DisableMLTransition = @"__MLTransition_UIView_DisableMLTransition";
@implementation UIView(__MLTransition)

- (BOOL)disableMLTransition
{
	return [objc_getAssociatedObject(self, &kMLTransition_UIView_DisableMLTransition) boolValue];
}

- (void)setDisableMLTransition:(BOOL)disableMLTransition
{
    [self willChangeValueForKey:kMLTransition_UIView_DisableMLTransition];
	objc_setAssociatedObject(self, &kMLTransition_UIView_DisableMLTransition, @(disableMLTransition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:kMLTransition_UIView_DisableMLTransition];
}

@end

#pragma mark - UIGestureRecognizer category interface
@interface UIGestureRecognizer(__MLTransition)

@property (nonatomic, assign) UINavigationController *__MLTransition_NavController;

@end

#pragma mark - UIGestureRecognizer category implementation
NSString * const kMLTransition_NavController_OfPan = @"__MLTransition_NavController_OfPan";

@implementation UIGestureRecognizer(__MLTransition)

- (void)set__MLTransition_NavController:(UINavigationController *)__MLTransition_NavController
{
    [self willChangeValueForKey:kMLTransition_NavController_OfPan];
	objc_setAssociatedObject(self, &kMLTransition_NavController_OfPan, __MLTransition_NavController, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:kMLTransition_NavController_OfPan];
}

- (UIViewController *)__MLTransition_NavController
{
	return objc_getAssociatedObject(self, &kMLTransition_NavController_OfPan);
}

@end

#pragma mark - UIPercentDrivenInteractiveTransition category
@interface UIPercentDrivenInteractiveTransition(__MLTransition)

@end

@implementation UIPercentDrivenInteractiveTransition(__MLTransition)

- (void)handleNavigationTransition:(UIPanGestureRecognizer*)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        //做个样子,也用来防止如果这个api系统改了名字，我们这边还是可用的。
        [recognizer.__MLTransition_NavController popViewControllerAnimated:YES];
    }
}

@end

#pragma mark - UINavigationController category interface
@interface UINavigationController(__MLTransition)<UIGestureRecognizerDelegate>

/**
 *  每个导航器都添加一个拖动手势
 */
@property (nonatomic, strong) UIPanGestureRecognizer *__MLTransition_panGestureRecognizer;

@end

#pragma mark - UINavigationController category implementation
NSString * const k__MLTransition_GestureRecognizer = @"__MLTransition_GestureRecognizer";

@implementation UINavigationController(__MLTransition)

#pragma mark getter and setter
- (void)set__MLTransition_panGestureRecognizer:(UIPanGestureRecognizer *)__MLTransition_panGestureRecognizer
{
    [self willChangeValueForKey:k__MLTransition_GestureRecognizer];
	objc_setAssociatedObject(self, &k__MLTransition_GestureRecognizer, __MLTransition_panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:k__MLTransition_GestureRecognizer];
}

- (UIPanGestureRecognizer *)__MLTransition_panGestureRecognizer
{
	return objc_getAssociatedObject(self, &k__MLTransition_GestureRecognizer);
}

#pragma mark hook
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!__MLTransitionEnabled) {
        return;
    }
    
    //初始化拖返手势
    if (!self.__MLTransition_panGestureRecognizer&&[self.interactivePopGestureRecognizer.delegate isKindOfClass:[UIPercentDrivenInteractiveTransition class]]) {
        UIPanGestureRecognizer *gestureRecognizer = nil;
        
#define kHandleNavigationTransitionKey [@"nTShMTkyGzS2nJquqTyioyElLJ5mnKEco246" __mlDecryptString]
        if (__MLTransitionGestureRecognizerType == MLTransitionGestureRecognizerTypeScreenEdgePan) {
            gestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(kHandleNavigationTransitionKey)];
            ((UIScreenEdgePanGestureRecognizer*)gestureRecognizer).edges = UIRectEdgeLeft;
        }else{
            gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(kHandleNavigationTransitionKey)];
        }
        
        gestureRecognizer.delegate = self;
        gestureRecognizer.__MLTransition_NavController = self;
        
        self.__MLTransition_panGestureRecognizer = gestureRecognizer;
        
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [self.view addGestureRecognizer:self.__MLTransition_panGestureRecognizer];
}

#pragma mark GestureRecognizer delegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)recognizer
{
    if (!__MLTransitionEnabled) {
        return NO;
    }
    
    UINavigationController *navVC = self;
    if ([navVC.transitionCoordinator isAnimated]||
        navVC.viewControllers.count < 2) {
        return NO;
    }
    
    UIView* view = recognizer.view;
    if (view.disableMLTransition) {
        return NO;
    }
    CGPoint loc = [recognizer locationInView:view];
    UIView* subview = [view hitTest:loc withEvent:nil];
    UIView *superView = subview;
    while (superView!=view) {
        if (superView.disableMLTransition) { //这个view忽略了拖返
            return NO;
        }
        superView = superView.superview;
    }
    
    //普通拖曳模式，如果开始方向不对即不启用
    if (__MLTransitionGestureRecognizerType==MLTransitionGestureRecognizerTypePan){
        CGPoint velocity = [recognizer velocityInView:navVC.view];
        if(velocity.x<=0) {
            //NSLog(@"不是右滑的");
            return NO;
        }
        
        CGPoint translation = [recognizer translationInView:navVC.view];
        translation.x = translation.x==0?0.00001f:translation.x;
        CGFloat ratio = (fabs(translation.y)/fabs(translation.x));
        //因为上滑的操作相对会比较频繁，所以角度限制少点
        if ((translation.y>0&&ratio>0.618f)||(translation.y<0&&ratio>0.2f)) {
            //NSLog(@"右滑角度不在范围内");
            return NO;
        }
    }
    
    return YES;
}
@end

@implementation UINavigationController(DisableMLTransition)

#pragma mark - outcall
- (void)enabledMLTransition:(BOOL)enabled
{
    self.__MLTransition_panGestureRecognizer.enabled = enabled;
}

@end

@implementation MLTransition

+ (void)validatePanBackWithMLTransitionGestureRecognizerType:(MLTransitionGestureRecognizerType)type
{
    //IOS7以下不可用
    if ([[[UIDevice currentDevice] systemVersion]floatValue]<7.0) {
        __MLTransitionEnabled = NO;
        return;
    }
    
    //设置记录type
    __MLTransitionGestureRecognizerType = type;
        
    //打开开关
    __MLTransitionEnabled = YES;
}

+ (void)invalidate {
    //关闭开关
    __MLTransitionEnabled = NO;
}

@end


#pragma mark - UIScrollView category ，可让scrollView在一个良好的关系下并存
@interface UIScrollView(__MLTransistion)

@end

@implementation UIScrollView(__MLTransistion)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isEqual:self.panGestureRecognizer]) {
        if (otherGestureRecognizer.__MLTransition_NavController) {
            if ([otherGestureRecognizer isMemberOfClass:[UIPanGestureRecognizer class]]) {
                CGPoint location = [otherGestureRecognizer locationInView:otherGestureRecognizer.view];
                if (location.x<=10.0f) { //中间拖返模式 时拖返手势的左边界10.0f内的位置需要无条件支持拖返（无论scrollView是横向还是竖向）
                    return YES;
                }
                
                //判断scrollView是否横向
                BOOL(^isHorizontalBlock)(UIScrollView *) = ^(UIScrollView *scrollView){
                    if (CGAffineTransformEqualToTransform(CGAffineTransformMakeRotation(-M_PI*0.5),scrollView.transform)||CGAffineTransformEqualToTransform(CGAffineTransformMakeRotation(M_PI*0.5),scrollView.transform)) {
                        return YES;
                    }else{
                        if (scrollView.contentSize.width>scrollView.frame.size.width) {
                            return YES;
                        }
                    }
                    return NO;
                };
                
                //如果此scrollView或者其某个上级view也是scrollView的时候，有一个是横向的，那就需要暂时禁用中间拖返手势，防止冲突
                UIView *superview = self;
//                while (superview&&![superview isKindOfClass:NSClassFromString(@"UINavigationTransitionView")]) {
                while (superview&&![superview isEqual:otherGestureRecognizer.__MLTransition_NavController.view]) {
                    if ([superview isKindOfClass:[UIScrollView class]]) {
                        if (isHorizontalBlock((UIScrollView*)superview)) {
                            return NO;
                        }
                    }
                    superview = superview.superview;
                }
            }
            //说明这玩意是我们的手势
            return YES;
        }
    }
    return NO;
}

@end


