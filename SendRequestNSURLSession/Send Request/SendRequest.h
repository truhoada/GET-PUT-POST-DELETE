//
//  SendRequest.h
//  SendRequestNSURLSession
//
//  Created by hoangdangtrung on 1/16/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestCompletionHandler)(NSString *data, NSError *error);

@interface SendRequest : NSObject

+ (void)requestWithPath:(NSString *)path
         withHTTPMethod:(NSString*)method
         withPostString:(NSString*)post
           onCompletion:(RequestCompletionHandler)complete;

@end
