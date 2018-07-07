//
//  Count.h
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Count : NSObject <NSCoding>
{
@public
    NSInteger sum;
    NSMutableArray *address;
}
@property (nonatomic, retain) NSMutableArray *address;

-(void)setsum:(int)a;

-(void)showsum;

@end

NS_ASSUME_NONNULL_END
