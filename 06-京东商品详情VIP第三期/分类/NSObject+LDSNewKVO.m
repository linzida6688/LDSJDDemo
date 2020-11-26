

#import "NSObject+LDSNewKVO.h"
#import <objc/runtime.h>

typedef void(^deallocBlock)();
@interface LDSKVOController : NSObject

@property(nonatomic, strong)NSObject *observedObject;
@property(nonatomic, strong)NSMutableArray <deallocBlock>*blockArr;

@end

@implementation LDSKVOController

-(NSMutableArray<deallocBlock> *)blockArr {
    
    if (!_blockArr) {
        _blockArr = [NSMutableArray array];
    }
    return _blockArr;
    
}


//nextviewController -> kvoController
- (void)dealloc {
    
    ///对observedObject  removeObserver
    NSLog(@"kvoController dealloc");
    [_blockArr enumerateObjectsUsingBlock:^(deallocBlock  _Nonnull block, NSUInteger idx, BOOL * _Nonnull stop) {
       
        block();
        
    }];
    
}

@end

@interface NSObject ()

@property(nonatomic, strong)NSMutableDictionary <NSString *, kvoBlock>*dict;
@property(nonatomic, strong)LDSKVOController *kvoController;

@end

@implementation NSObject (LDSNewKVO)

- (void)eocObserver:(NSObject *)object keyPath:(NSString *)keyPath block:(kvoBlock)block {
    
    self.dict[keyPath] = block;
    
    ///self已经持有了kvoController
    self.kvoController.observedObject = object;
    
    __unsafe_unretained typeof(self)weakSelf = self;
    
    [self.kvoController.blockArr addObject:^{
       
        [object removeObserver:weakSelf forKeyPath:keyPath];
        
    }];
    
    //监听
    [object addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    kvoBlock block = self.dict[keyPath];
    if (block) {
        block();
    }
    
}


////getter 和 setter方法
- (NSMutableDictionary<NSString *,kvoBlock> *)dict {
    
    NSMutableDictionary *tmpDict = objc_getAssociatedObject(self, @selector(dict));
    if (!tmpDict) {
        tmpDict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(dict), tmpDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return tmpDict;
    
}

- (LDSKVOController *)kvoController {
    
    LDSKVOController *tmpKvoController = objc_getAssociatedObject(self, @selector(kvoController));
    if (!tmpKvoController) {
        
        tmpKvoController = [[LDSKVOController alloc] init];
        objc_setAssociatedObject(self, @selector(kvoController), tmpKvoController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    return tmpKvoController;
    
}
@end
