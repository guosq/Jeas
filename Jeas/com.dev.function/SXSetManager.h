//
//  SXSetManager.h
//  Jeas
//
//  Created by 邸超 on 2017/11/28.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXSetManager : NSObject

@property(nonatomic,assign) BOOL mbIsRotation;

+ (instancetype)sharedInstance;
@end
