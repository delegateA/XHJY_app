//
//  Tools.h
//  
//
//  Created by LiangXiaobin on 16/2/29.
//
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject
+ (UIColor *) colorWithHexString: (NSString *)color withAlpha:(double)alpha;
+(CGFloat) heightForString:(NSString *)value andWidth:(float)width;
+(CGFloat) widthForString:(NSString *)value andHei:(float)hei;
@end
