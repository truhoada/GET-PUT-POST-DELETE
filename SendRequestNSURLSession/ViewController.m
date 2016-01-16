//
//  ViewController.m
//  SendRequestNSURLSession
//
//  Created by hoangdangtrung on 1/16/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewController.h"
#import "SendRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/* GET /student/<id> Return: a single object */
//   [SendRequest requestWithPath:@"http://localhost:2403/student/b8b3c367572f689b" withHTTPMethod:@"GET" withPostString:nil onCompletion:^(NSString *data, NSError *error) {
//       NSLog(@"%@", data);
//   }];
//---------------------------------------------------------------------------------------------
    /* GET  /student  Return: an array of objects */
//    [SendRequest requestWithPath:@"http://localhost:2403/student" withHTTPMethod:@"GET" withPostString:nil onCompletion:^(NSString *data, NSError *error) {
//        NSLog(@"%@", data);
//    }];
    
//---------------------------------------------------------------------------------------------
    
    /* PUT /student/<id> Return: The saved objects */
//    NSString *postString = [NSString stringWithFormat:@"&name=%@&age=%d&address=%@",@"Trung",23 ,@"Bac Ninh"];
//    NSString *postString = [NSString stringWithFormat:@"&address=%@",@"Gia Binh"];
    
//    [SendRequest requestWithPath:@"http://localhost:2403/student/b8b3c367572f689b" withHTTPMethod:@"PUT" withPostString:postString onCompletion:^(NSString *data, NSError *error) {
//                NSLog(@"%@", data);
//            }];
//---------------------------------------------------------------------------------------------
    /* DELETE /student/<id> Return: Nothing */
    [SendRequest requestWithPath:@"http://localhost:2403/student/c2f114d5067e0867" withHTTPMethod:@"DELETE" withPostString:nil onCompletion:^(NSString *data, NSError *error) {
        NSLog(@"%@", data);
    }];


    
}

@end
