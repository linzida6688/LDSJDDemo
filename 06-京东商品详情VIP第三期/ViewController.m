

#import "ViewController.h"
#import "LDSMainViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.btn];
    
}

#pragma mark - event response
- (void)btnAction:(UIButton *)btn {
    
    LDSMainViewController *productDetailViewCtrl = [[LDSMainViewController alloc] init];
    [self.navigationController pushViewController:productDetailViewCtrl animated:YES];
    
}

#pragma mark - getter方法
- (UIButton *)btn {
    
    if (!_btn) {
        
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100.f, 100.f, 200.f, 100.f)];
        _btn.backgroundColor = [UIColor lightGrayColor];
        
        [_btn setTitle:@"进入商品详情" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
        
    }
    
    return _btn;
    
}


@end
