//
//  NullableDSItem.h
//  ActionsAppTest
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>
#import "ROModel.h"
#import "NullableDSItemKeys.h"
#import "RORestGeoPoint.h"

@interface NullableDSItem : NSObject <ROModelDelegate>

@property (nonatomic, strong) NSString *phone;

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) RORestGeoPoint *location;

@property (nonatomic, strong) NSString *email;

@property (nonatomic, strong) NSString *idProp;

@end
