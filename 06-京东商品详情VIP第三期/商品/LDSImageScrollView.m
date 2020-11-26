

#import "LDSImageScrollView.h"

@implementation LDSImageScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    self.panGestureRecognizer.delegate = self;
    _isOpen = YES;
    
    return self;
    
}

//根据返回值，判断是否识别或响应手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        
        UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)gestureRecognizer;
        CGFloat transitionX = [gesture translationInView:self].x;
        
        if (transitionX < 0 && !_isOpen) {  //往左滑动 !_isOpen最后一页 transitionX < 0往左滑动
            return NO;
        }
        
    }
    
    return YES;
}

@end
