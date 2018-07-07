//
//  Mycache.h
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Count.h"
#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mycache : NSObject
{
    Count *count;
}
-(void)upcount;

-(void)addObject:(id)dog forKey:(NSString *)key;

-(id)objectForKey:(NSString *)key;

-(void)showcount;

-(void)showsum;

@end

NS_ASSUME_NONNULL_END
