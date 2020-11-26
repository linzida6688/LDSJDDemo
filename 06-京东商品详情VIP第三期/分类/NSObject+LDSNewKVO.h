

#import <Foundation/Foundation.h>

typedef void(^kvoBlock)();
@interface NSObject (LDSNewKVO)

- (void)eocObserver:(NSObject *)object keyPath:(NSString *)keyPath block:(kvoBlock)block;

@end
