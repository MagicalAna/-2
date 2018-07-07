//
//  Count.m
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "Count.h"

@implementation Count
@synthesize address = _address;
- (id) initWithCoder: (NSCoder *)coder{
    if (self = [super init])
    {
        self.address = [coder decodeObjectForKey:@"address"];
        self->sum = [coder decodeIntegerForKey:@"sum"];
    }
    return self;
}
- (void) encodeWithCoder: (NSCoder *)coder{
    [coder encodeObject:_address forKey:@"address"];
    [coder encodeInteger:sum forKey:@"sum"];
}
-(void)setsum:(int)a{
    sum=a;
}
-(void)showsum{
    NSLog(@"%ld",sum);
}
@end
