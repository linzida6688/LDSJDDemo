

#import "LDSProductViewController.h"
#import "LDSProductScrollView.h"
#import "LDSProductDetailWebView.h"
#import "LDSNavTitleView.h"

@interface LDSProductViewController ()<UIScrollViewDelegate>
{
    LDSNavTitleView *titleView;
}

@property(nonatomic, strong)UIView *contentView;
@property(nonatomic, strong)UIView *sonView;
@property(nonatomic, strong)UIScrollView *productUpDownScrollView;
@property(nonatomic, strong)LDSProductScrollView *productLeftRightScrollView;
@property(nonatomic, strong)UILabel *displayProductLabel;
@property(nonatomic, strong)LDSProductDetailWebView *productDetailWebView;

@end

@implementation LDSProductViewController
CGFloat const detailWebViewOffsetY = 70.f;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //添加contentView
    [self.view addSubview:self.contentView];
    
    //添加上下的scrollView
    [self.contentView addSubview:self.productUpDownScrollView];
    
    //添加商品详情webView
    [self.contentView addSubview:self.productDetailWebView];
}

- (void)viewDidAppear:(BOOL)animated {
    titleView = (LDSNavTitleView *)self.parentViewController.navigationItem.titleView;
}

#pragma mark - UIScrollView delegate method

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {//productUpDownScrollView 遮住 productLeftRightScrollView
    if (scrollView == self.productUpDownScrollView) {
        CGFloat yOffset = scrollView.contentOffset.y;//self.productUpDownScrollView 的偏移量
        self.productLeftRightScrollView.eoc_y = yOffset/3;// 3 随机
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate) {//是松手
        if (scrollView == self.productUpDownScrollView) {  //上下的scrollView
            CGFloat yOffset = scrollView.contentOffset.y;
            if (yOffset > self.view.eoc_height + 80.f) {  //滑动到scrollView底部的时候+80的距离
                [UIView animateWithDuration:0.4f animations:^{
                    self.contentView.eoc_y = -self.view.eoc_height;
                    titleView.contentOffset = CGPointMake(0.f, 44.f);
                }];
            }
        } else {  //webView的scrollView
            CGFloat yOffset = scrollView.contentOffset.y;
            if (yOffset < detailWebViewOffsetY) {
                [UIView animateWithDuration:0.4f animations:^{
                    self.contentView.eoc_y = 0.f;
                    titleView.contentOffset = CGPointMake(0.f, 0.f);
                }];
            }
        }
    }
}

#pragma mark - getter方法
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, SCREENSIZE.width, 2*self.view.eoc_height)];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}

- (UIScrollView *)productUpDownScrollView {
    if (!_productUpDownScrollView) {
        _productUpDownScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, SCREENSIZE.width, self.view.eoc_height)];
        _productUpDownScrollView.showsVerticalScrollIndicator = YES;
        _productUpDownScrollView.backgroundColor = [UIColor clearColor];
        _productUpDownScrollView.delegate = self;
        _productUpDownScrollView.contentSize = CGSizeMake(SCREENSIZE.width, 2*self.view.eoc_height);
        
        //添加左右的scrollView
        [_productUpDownScrollView addSubview:self.productLeftRightScrollView];
        
        //添加子view
        CGFloat displayProductLabelHeight = 40.f;
        
        _sonView = [[UIView alloc] initWithFrame:CGRectMake(0.f, _productLeftRightScrollView.eoc_bottomY, SCREENSIZE.width, 2*self.view.eoc_height-_productLeftRightScrollView.eoc_bottomY-displayProductLabelHeight)];
        _sonView.layer.shadowOffset = CGSizeMake(0.f, -1.f);
        _sonView.layer.shadowOpacity = 0.8f;
        _sonView.layer.shadowColor = [[UIColor grayColor] CGColor];
        _sonView.backgroundColor = [UIColor lightGrayColor];
        [_productUpDownScrollView addSubview:_sonView];
        
        //添加上拉显示商品详情label
        _displayProductLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, _sonView.eoc_bottomY, SCREENSIZE.width, displayProductLabelHeight)];
        _displayProductLabel.textAlignment = NSTextAlignmentCenter;
        _displayProductLabel.text = @"上拉显示商品详情";
        [_productUpDownScrollView addSubview:_displayProductLabel];
        
    }
    
    return _productUpDownScrollView;
}

- (LDSProductScrollView *)productLeftRightScrollView {
    
    if (!_productLeftRightScrollView) {
    
        //添加轮播图片数组
        NSArray *imageArr = @[@"product_1", @"product_0", @"product_1", @"product_0", @"product_1", @"product_0"];
        
        _productLeftRightScrollView = [[LDSProductScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.eoc_width, self.view.eoc_width)];
        _productLeftRightScrollView.backgroundColor = [UIColor clearColor];
        _productLeftRightScrollView.imageArr = imageArr;
        
    }
    
    return _productLeftRightScrollView;
}

- (LDSProductDetailWebView *)productDetailWebView {
    if (!_productDetailWebView) {
        _productDetailWebView = [[LDSProductDetailWebView alloc] initWithFrame:CGRectMake(0.f, self.view.eoc_height, SCREENSIZE.width, self.view.eoc_height)];
        _productDetailWebView.showTextLabel = YES;
        _productDetailWebView.webView.scrollView.delegate = self;
    }
    return _productDetailWebView;
}

@end
