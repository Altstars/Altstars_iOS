//
//  PaulRequestSerializer.m
//  Altstars
//
//  Created by Kouki Saito on 2014/06/11.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "PaulRequestSerializer.h"

@implementation PaulRequestSerializer

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                 URLString:(NSString *)path
                                parameters:(id)parameters
                                     error:(NSError *__autoreleasing *)error
{
 
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *auth = (NSString*)[ud objectForKey:@"auth"];
    
    path = [path stringByAppendingFormat:@"?auth=%@", auth];
    
    for (NSString *key in [parameters keyEnumerator]) {
        
        NSString *value = [NSString stringWithFormat:@"%@",
                           [parameters valueForKey:key]];
        
        NSAssert2([key length] && [value length],
                  @"invalid param! key:%@: value:%@", key, value);
        
        path = [path stringByAppendingFormat:@"&%@=%@", key, value];
    }
    
    NSMutableURLRequest *req = [super requestWithMethod:method
                                              URLString:path
                                             parameters:nil
                                                  error:error];
    
    return req;
}

@end
