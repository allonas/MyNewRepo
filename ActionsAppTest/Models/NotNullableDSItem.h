//
//  NotNullableDSItem.h
//  ActionsAppTest
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROModel.h"
#import "NotNullableDSItemKeys.h"
#import "RORestGeoPoint.h"

@interface NotNullableDSItem : NSObject <ROModelDelegate>

@property (nonatomic, strong) NSString *phone;

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) RORestGeoPoint *location;

@property (nonatomic, strong) NSString *email;

@property (nonatomic, strong) NSString *idProp;

@end
