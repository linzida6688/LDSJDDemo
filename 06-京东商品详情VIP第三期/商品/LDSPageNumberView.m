

#import "LDSPageNumberView.h"

@interface LDSPageNumberView() {
    
    UILabel *textLabel;
    
}
@end

@implementation LDSPageNumberView

#define LDSColor(r,g,b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:0.6]

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.image = [UIImage imageNamed:@"product_page"];
        
        //这里如果不加背景颜色，会被商品图片遮挡住颜色
        self.backgroundColor = LDSColor(217, 217, 217);
        self.layer.cornerRadius = self.frame.size.height/2;
        self.layer.masksToBounds = YES;
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height)];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        
    }
    return self;
}

- (void)setText:(NSString *)text
{
    _text = text;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12], NSFontAttributeName, nil]];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 1)];
    textLabel.attributedText = attrString;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    textLabel.textColor = _textColor;
}


@end
