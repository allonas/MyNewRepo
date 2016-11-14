//
//  NullableDSItem.m
//  ActionsAppTest
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "NullableDSItem.h"
#import "NSDictionary+RO.h"

@implementation NullableDSItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

	self = [super init];
	if (self) {
		[self updateWithDictionary:dictionary];
	}
	return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
    self.phone = [dictionary ro_stringForKey:kNullableDSItemPhone];
    
    self.url = [dictionary ro_stringForKey:kNullableDSItemUrl];
    
    id location = [dictionary objectForKey:kNullableDSItemLocation];
    if ([location isKindOfClass:[NSDictionary class]]) {
    	self.location = [[RORestGeoPoint alloc] initWithDictionary:location];
    }
    
    self.email = [dictionary ro_stringForKey:kNullableDSItemEmail];
    
    self.idProp = [dictionary ro_stringForKey:kNullableDSItemId];
}

- (id)identifier {
	
	return self.idProp;
}

@end

