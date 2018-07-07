//
//  Dog.h
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject <NSCoding>
{
@public
    NSString *name;
    NSInteger time;
}
@property (nonatomic, retain) NSString *name;

-(void)showtime;

@end

NS_ASSUME_NONNULL_END
