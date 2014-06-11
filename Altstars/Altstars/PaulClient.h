//
//  PaulClient.h
//  Altstars
//
//  Created by Kouki Saito on 2014/06/11.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "PaulRequestSerializer.h"

@interface PaulClient : AFHTTPSessionManager

+ (PaulClient *)sharedClient;
- (void)magazineWithId:(NSString*)id
    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void)relatedContentWithId:(NSString*)content_id
                     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
