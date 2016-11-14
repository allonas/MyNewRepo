//
//  ROUpdateItemBehavior.h
//  ActionsAppTest
//
//  This App has been generated using IBM Mobile UI Builder
//

#import <Foundation/Foundation.h>

@protocol RODataDelegate;
@protocol ROItemDelegate;

@interface ROUpdateItemBehavior : NSObject

@property (nonatomic, strong) Class crudControllerClass;

@property (nonatomic, strong) UIViewController<RODataDelegate, ROItemDelegate> *viewController;

- (instancetype)initWithViewController:(UIViewController<RODataDelegate, ROItemDelegate> *)viewController crudControllerClass:(__unsafe_unretained Class)crudControllerClass;

+ (instancetype)behaviorViewController:(UIViewController<RODataDelegate, ROItemDelegate> *)viewController crudControllerClass:(__unsafe_unretained Class)crudControllerClass;

@end
