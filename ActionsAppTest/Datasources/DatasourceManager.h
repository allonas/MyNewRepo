//
//  DatasourceManager.h
//  ActionsAppTest
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@class NotNullableDS;
@class NullableDS;

@interface DatasourceManager : NSObject

@property (nonatomic, strong) NotNullableDS *notNullableDS;

@property (nonatomic, strong) NullableDS *nullableDS;

/**
 Singleton
 @return Class instance
 */
+ (instancetype)sharedInstance;

/**
 Synchronize all datasource
 */
- (void)sync;

@end

