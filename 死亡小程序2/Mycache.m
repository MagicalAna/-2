//
//  Mycache.m
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "Mycache.h"

@implementation Mycache
-(id)init{
    self=[super init];
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"count"];
    NSData *result = [NSData dataWithContentsOfFile:fileName];
    count = [NSKeyedUnarchiver unarchiveObjectWithData:result] ;
    return self;
}
-(void)upcount{
    NSData *wang2 = [NSKeyedArchiver archivedDataWithRootObject:count];
    NSString *path2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName2 = [path2 stringByAppendingPathComponent:@"count"];
    [wang2 writeToFile:fileName2 atomically:YES];
}
-(void)addObject:(id)dog forKey:(NSString *)key{
    if(count->sum<5)
    {
        [count.address addObject:key];
        NSString *s = [NSString stringWithFormat:@"%ld",count->sum];
        NSData *wang = [NSKeyedArchiver archivedDataWithRootObject:dog];
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *fileName = [path stringByAppendingPathComponent:s];
        [wang writeToFile:fileName atomically:YES];
        count->sum++;
    }
    else
    {
        NSInteger i;
        NSInteger j=5;
        NSInteger min=999;
        for(i=0;i<5;i++)
        {
            NSString *s = [NSString stringWithFormat:@"%ld",i];
            NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
            NSString *fileName = [path stringByAppendingPathComponent:s];
            NSData *result = [NSData dataWithContentsOfFile:fileName];
            Dog *dog=nil;
            dog = [NSKeyedUnarchiver unarchiveObjectWithData:result] ;
            if(min>dog->time)
            {
                min=dog->time;
                j=i;
            }
        }
        [count.address replaceObjectAtIndex:j withObject:key];
        NSString *s = [NSString stringWithFormat:@"%ld",j];
        NSData *wang = [NSKeyedArchiver archivedDataWithRootObject:dog];
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *fileName = [path stringByAppendingPathComponent:s];
        [wang writeToFile:fileName atomically:YES];
    }
    NSData *wang2 = [NSKeyedArchiver archivedDataWithRootObject:count];
    NSString *path2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName2 = [path2 stringByAppendingPathComponent:@"count"];
    [wang2 writeToFile:fileName2 atomically:YES];
}
-(id)objectForKey:(NSString *)key{
    NSArray *myArray = [count.address copy];
    
    NSUInteger index = [myArray indexOfObject:key];
    NSString *s = [NSString stringWithFormat:@"%ld",index];
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:s];
    NSData *result = [NSData dataWithContentsOfFile:fileName];
    Dog *dog=nil;
    dog = [NSKeyedUnarchiver unarchiveObjectWithData:result] ;
    dog->time=dog->time+1;
    NSData *wang = [NSKeyedArchiver archivedDataWithRootObject:dog];
    [wang writeToFile:fileName atomically:YES];
    return dog;
}
-(void)showcount{
    NSLog(@"%@",count.address);
}
-(void)showsum{
    NSLog(@"%ld",count->sum);
}
@end
