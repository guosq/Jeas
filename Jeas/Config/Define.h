//
//  Define.h
//  Jeas
//
//  Created by 邸超 on 2017/3/13.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#ifndef Define_h
#define Define_h


// 主页
#define ROOTURL @"http://edu.cnshipping.com/zhy/app"


#define BGCOLOR [UIColor colorWithHexString:@"#EEEEEE" alpha:1.0]
#define DCWeakSelf(type)  __weak typeof(type) weak##type = type




// 单例类相关
#define DCUserDefault [NSUserDefaults standardUserDefaults]
#define DCAppdelegate [AppDelegate getStances]

// 常用api
#define DCImageName(name) [UIImage imageNamed:name]// 图片
#define DCfont(f) [UIFont systemFontOfSize:f];// 字体
#define DCcolorRGB(r,g,b) DCcolorRGBAlpa(r,g,b,1.0f)// 颜色
#define DCcolorRGBAlpa(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define CUSTOMBGCOR [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1.0]






// 打印日志----
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) nil
#endif

#if DEBUG
#define GLog(fmt, ...) do { \
NSString *file = [[NSString alloc] initWithFormat:@"%s", __FILE__]; \
NSLog((@"%@(%d) " fmt), [file lastPathComponent], __LINE__, ##__VA_ARGS__); \
} while(0)
#define GTRACE() ZDLog(@"[%s][%d]", __func__, __LINE__)
#else
#define GLog(x, ...)
#define GTRACE()
#endif


// 单例模式----
#define singletonInterface(className)      + (instancetype)shared##className;

#define singletonImplementation(className) \
static className *_instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}


#endif
