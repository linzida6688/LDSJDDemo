

#import "LDSProductDetailViewController.h"
#import "LDSProductDetailWebView.h"


@interface LDSProductDetailViewController ()

@end

@implementation LDSProductDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    LDSProductDetailWebView *detailView = [[LDSProductDetailWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:detailView];
    
}


@end
