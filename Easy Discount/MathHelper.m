//
//  MathHelper.m
//  Easy Discount
//
//  Created by Salvador Guerrero on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MathHelper.h"

@implementation MathHelper
+(BOOL)isDecimal:(double)number{
    return floor(number) != number;
}
@end
