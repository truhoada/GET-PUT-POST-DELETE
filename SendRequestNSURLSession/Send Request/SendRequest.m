//
//  SendRequest.m
//  SendRequestNSURLSession
//
//  Created by hoangdangtrung on 1/16/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "SendRequest.h"

@implementation SendRequest

+ (void)requestWithPath:(NSString *)path
         withHTTPMethod:(NSString*)method
         withPostString:(NSString*)post
           onCompletion:(RequestCompletionHandler)complete {
    
//    NSString *postExample = [NSString stringWithFormat:@"&name=%@&age=%d&address=%@",@"Trung",23 ,@"Bac Ninh"]; //1. set post string for POST method, = @"" if other//

    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]; //2. Encode the post string using NSASCIIStringEncoding and also the post string you need to send in NSData format.//
    
     NSString *postLength = [NSString stringWithFormat:@"%d",(int)[postData length]]; //You need to send the actual length of your data. Calculate the length of the post string.//
    
    /* 3. Create a URLRequest with all the properties like HTTPMethod, HTTPHeaderField with length of the post string. */
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];//Create URLRequest object and initialize it.//
    
    [request setURL:[NSURL URLWithString:path]]; //Set the URL for which your going to send the data to that request.//
    
    request.HTTPMethod = method; // set HTTP method (POST, GET, PUT, DELETE)//
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"]; //Set HTTPHeaderField with length of the post data//
    
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"]; //Set the Encoded value for HTTPHeaderField//
    //For application/x-www-form-urlencoded, the body of the HTTP message sent to the server is essentially one giant query string -- name/value pairs are separated by the ampersand (&), and names are separated from values by the equals symbol (=) //
    
    request.HTTPBody = postData; //Set the HTTPBody of the URLRequest with postData.//
    
    NSURLSession *session = [NSURLSession sharedSession]; //Create URLSession object.//
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    if (complete) complete(result,error);
//                    NSLog(@"%@", response);
                    
                }] resume];
    
}

//-----------------------------HTTPHeaderField ----------------------------------
/* https://en.wikipedia.org/wiki/List_of_HTTP_header_fields */
/*
 HTTP header fields are components of the header section of request and response messages in the Hypertext Transfer Protocol (HTTP). They define the operating parameters of an HTTP transaction.
 */


@end































