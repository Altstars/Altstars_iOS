//
//  PaulClient.m
//  Altstars
//
//  Created by Kouki Saito on 2014/06/11.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "PaulClient.h"
//#define API_BASE_URL @"http://altstars.koukilab.com/"
#define API_BASE_URL @"http://localhost:8888/"


@implementation PaulClient

+ (PaulClient *)sharedClient
{
    static PaulClient *sharedClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[PaulClient alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];

        sharedClient.requestSerializer = [PaulRequestSerializer serializer];
    });
    
    return sharedClient;
}

- (void)authorizationWithFacebook:(NSString*)facebook_id
                     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    __weak PaulClient *weakSelf = self;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSString *path = [NSString stringWithFormat:@"auth/login"];
        [weakSelf POST:path
            parameters:@{@"access_token": facebook_id, @"host":@"facebook"}
               success:success
               failure:failure
         ];
    });
}



- (void)magazineWithId:(NSString*)id
    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    
    __weak PaulClient *weakSelf = self;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        NSString *path = [NSString stringWithFormat:@"magazine/%@", @"latest"];
        [weakSelf GET:path
           parameters:nil
              success:success
              failure:failure
         ];
    });

}

- (void)relatedContentWithId:(NSString*)content_id
success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    __weak PaulClient *weakSelf = self;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSString *path = [NSString stringWithFormat:@"content/%@/related", content_id];
        [weakSelf GET:path
           parameters:nil
              success:success
              failure:failure
         ];
    });
}

@end
