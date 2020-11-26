
#import <UIKit/UIKit.h>

@interface LDSNavTitleView : UIScrollView
typedef void (^btnBlock) (int index);

@property(nonatomic, strong)NSArray *titleArr;
@property(nonatomic, strong)btnBlock btnActionBlock;
@property(nonatomic, strong)UILabel *indicatorLabel;

@end
