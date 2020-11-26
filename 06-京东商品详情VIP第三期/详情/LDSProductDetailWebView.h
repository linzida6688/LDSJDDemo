

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface LDSProductDetailWebView : UIView

@property(nonatomic, strong)WKWebView *webView;
@property(nonatomic, strong)UILabel *textLabel;
@property(nonatomic, assign)BOOL showTextLabel;

@end
