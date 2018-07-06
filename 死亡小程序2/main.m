//
//  main.m
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/4.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject <NSCoding>
{
    @public
    NSString *name;
    NSInteger time;
}
@property (nonatomic, retain) NSString *name;

-(void)showtime;

@end

@implementation Dog
@synthesize name = _name;
-(id)init{
    self=[super init];
    time=0;
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

@interface Mycache : NSObject
{
    Count *count;
}
-(void)upcount;

-(void)addObject:(Dog *)dog forKey:(NSString *)key;

-(Dog *)objectForKey:(NSString *)key;

-(void)showcount;

-(void)showsum;

@end

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
-(void)addObject:(Dog *)dog forKey:(NSString *)key{
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
-(Dog *)objectForKey:(NSString *)key{
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

int main(int argc, const char * argv[]) {
    Mycache *cache=Mycache.new;
    Dog *dog=[[Dog alloc]init];
    dog.name=@"PZ";
    [cache addObject:dog forKey:dog.name];
    //Dog *Ana =  [cache objectForKey:@"Ana"];
    //NSLog(@"The dog's name is %@",Ana.name);
    //[zfd showtime];
    [cache showcount];
    //[Ana showtime];
    return 0;
}
