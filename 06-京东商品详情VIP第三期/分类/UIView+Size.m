

#import "UIView+Size.h"

@implementation UIView (Size)

- (void)setEoc_x:(CGFloat)eoc_x
{
    CGRect frame = self.frame;
    frame.origin.x = eoc_x;
    self.frame = frame;
}

- (CGFloat)eoc_x
{
    return self.frame.origin.x;
}

- (void)setEoc_y:(CGFloat)eoc_y
{
    CGRect frame = self.frame;
    frame.origin.y = eoc_y;
    self.frame = frame;
}

- (CGFloat)eoc_y
{
    return self.frame.origin.y;
}

- (void)setEoc_width:(CGFloat)eoc_width
{
    CGRect frame = self.frame;
    frame.size.width = eoc_width;
    self.frame = frame;
}

- (CGFloat)eoc_width
{
    return self.frame.size.width;
}

- (void)setEoc_height:(CGFloat)eoc_height
{
    CGRect frame = self.frame;
    frame.size.height = eoc_height;
    self.frame = frame;
}

- (CGFloat)eoc_height
{
    return self.frame.size.height;
}

- (void)setEoc_origin:(CGPoint)eoc_origin
{
    CGRect frame = self.frame;
    frame.origin = eoc_origin;
    self.frame = frame;
}

- (CGPoint)eoc_origin
{
    return self.frame.origin;
}

- (void)setEoc_size:(CGSize)eoc_size
{
    CGRect frame = self.frame;
    frame.size = eoc_size;
    self.frame = frame;
}

- (CGSize)eoc_size
{
    return self.frame.size;
}

- (CGFloat)eoc_bottomY
{
    return self.eoc_y+self.eoc_height;
}

-(void)setEoc_bottomY:(CGFloat)eoc_bottomY {
    
}
@end
