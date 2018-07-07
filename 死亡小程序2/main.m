//
//  main.m
//  死亡小程序2
//
//  Created by Yuan Ana on 2018/7/4.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Mycache.h"

int main(int argc, const char * argv[]) {
    Mycache *cache=Mycache.new;
    /*Dog *dog=[[Dog alloc]init];
    dog.name=@"Genji";
    [cache addObject:dog forKey:dog.name];
    [cache showcount];*/
    Dog *Ana  =  [cache objectForKey:@"Ana"];
    if ([Ana isKindOfClass:Dog.class]){
        NSLog(@"The dog's name is %@",Ana.name);
        [Ana showtime];
    }
    else
        NSLog(@"ERROR");
    return 0;
}
