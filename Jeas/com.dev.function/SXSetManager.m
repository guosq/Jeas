//
//  SXSetManager.m
//  Jeas
//
//  Created by 邸超 on 2017/11/28.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SXSetManager.h"

@implementation SXSetManager
+ (instancetype)sharedInstance{
    
    static SXSetManager *setManager = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        setManager = [[SXSetManager alloc] init];
    });
    return setManager;
}
@end
