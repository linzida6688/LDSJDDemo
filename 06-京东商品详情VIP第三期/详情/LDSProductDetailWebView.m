

#import "LDSProductDetailWebView.h"

@implementation LDSProductDetailWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    self.backgroundColor = [UIColor redColor];
    if (self = [super initWithFrame:frame]) {
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.eoc_width, self.eoc_height)];
        _webView.scrollView.backgroundColor = [UIColor clearColor];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
        [self addSubview:_webView];
        
    }
    return self;
}

- (void)setShowTextLabel:(BOOL)showTextLabel
{
    _showTextLabel = showTextLabel;
    if (_showTextLabel) {  //显示下拉回到商品主页／释放回到商品主页 文字
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 30.f, self.eoc_width, 44.f)];
        _textLabel.text = @"下拉回到商品主页";
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.textColor = [UIColor whiteColor];
        [_webView insertSubview:_textLabel atIndex:0];
        
    }
}

@end
