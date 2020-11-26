
#import "LDSNavTitleView.h"

@interface LDSNavTitleView () {
    
    CGAffineTransform originalTransform;
    
}

@end

@implementation LDSNavTitleView
static const CGFloat btnWidth = 40.f;
static const CGFloat btnSpace = 20.f;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.scrollEnabled = NO;
        self.contentSize = CGSizeMake(frame.size.width, 2*frame.size.height);
        
    }
    
    return self;
}

- (void)setTitleArr:(NSArray *)titleArr {
    
    _titleArr = titleArr;
    
    //创建titleView
    for (int i=0; i<3; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*(btnWidth+btnSpace), 0.f, btnWidth, 44.f);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.accessibilityValue = [NSString stringWithFormat:@"%d", i];
        btn.titleLabel.font = [UIFont systemFontOfSize:17.f];
        [self addSubview:btn];
        
        //添加黑色指示label
        if (i == 0) {
            
            [self addSubview:self.indicatorLabel];
            _indicatorLabel.frame = ({
                CGRect frame = btn.frame;
                frame.origin.y = btn.frame.size.height-2;
                frame.size.height = 2.f;
                frame;
            });
            originalTransform = _indicatorLabel.transform;
            
        }
        
    }
    
    //添加图文详情nextTitleView和文字的titleLabel
    UIView *nextTitleView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 44.f, btnWidth*3+2*btnSpace, 44.f)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, nextTitleView.eoc_width, nextTitleView.eoc_height)];
    titleLabel.text = @"图文详情";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [nextTitleView addSubview:titleLabel];
    [self addSubview:nextTitleView];
    
}


#pragma mark - event response 
- (void)btnAction:(UIButton *)btn {
    
    int index = btn.accessibilityValue.intValue;
    
    if (_btnActionBlock) {
        
        _btnActionBlock(index);
    }
    
}

#pragma mark - getter method
- (UILabel *)indicatorLabel {
    
    if (!_indicatorLabel) {
        
        _indicatorLabel = [[UILabel alloc] init];
        _indicatorLabel.backgroundColor = [UIColor blackColor];
        
    }
    return _indicatorLabel;
}

@end
