//
//  NotNullableDSItem.m
//  ActionsAppTest
//
//  This App has been generated using IBM Mobile UI Builder
//

#import "NotNullableDSItem.h"
#import "NSDictionary+RO.h"

@implementation NotNullableDSItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

	self = [super init];
	if (self) {
		[self updateWithDictionary:dictionary];
	}
	return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
    self.phone = [dictionary ro_stringForKey:kNotNullableDSItemPhone];
    
    self.url = [dictionary ro_stringForKey:kNotNullableDSItemUrl];
    
    id location = [dictionary objectForKey:kNotNullableDSItemLocation];
    if ([location isKindOfClass:[NSDictionary class]]) {
    	self.location = [[RORestGeoPoint alloc] initWithDictionary:location];
    }
    
    self.email = [dictionary ro_stringForKey:kNotNullableDSItemEmail];
    
    self.idProp = [dictionary ro_stringForKey:kNotNullableDSItemId];
}

- (id)identifier {
	
	return self.idProp;
}

@end

