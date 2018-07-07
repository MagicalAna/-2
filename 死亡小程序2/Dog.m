//
//  Dog.m
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "Dog.h"

@implementation Dog
@synthesize name = _name;
-(id)init{
    self = [super init];
    time = 0;
    return self;
}
- (id) initWithCoder: (NSCoder *)coder{
    if (self = [super init])
    {
        self.name = [coder decodeObjectForKey:@"name"];
        self->time = [coder decodeIntegerForKey:@"time"];
    }
    return self;
}
- (void) encodeWithCoder: (NSCoder *)coder{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeInteger:time forKey:@"time"];
}
-(void)showtime{
    NSLog(@"%ld",time);
}
@end
