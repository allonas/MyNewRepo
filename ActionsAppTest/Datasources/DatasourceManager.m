//
//  DatasourceManager.m
//  ActionsAppTest
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "DatasourceManager.h"
#import "NotNullableDS.h"
#import "NullableDS.h"

@implementation DatasourceManager

+ (instancetype)sharedInstance {

    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Properties init

- (NotNullableDS *)notNullableDS {

    if (!_notNullableDS) {

        _notNullableDS = [NotNullableDS new];
    }
    return _notNullableDS;
}

- (NullableDS *)nullableDS {

    if (!_nullableDS) {

        _nullableDS = [NullableDS new];
    }
    return _nullableDS;
}

#pragma mark - Public methods

- (void)sync {

    
}

@end

