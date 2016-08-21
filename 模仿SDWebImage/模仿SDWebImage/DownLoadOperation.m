//
//  DownLoadOperation.m
//  模仿SDWebImage
//
//  Created by 胡志强 on 16/8/20.
//  Copyright © 2016年 胡志强. All rights reserved.
//

#import "DownLoadOperation.h"

@implementation DownLoadOperation

-(void)main{
    
    NSURL *url = [NSURL URLWithString:_url];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    NSAssert(_finishedBlock != nil, @"下载完成的回调不能为空");
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _finishedBlock(image);
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
}

+(instancetype)downLoadOperationWithNsstring:(NSString *)url finishedBlock:(void (^)(UIImage *))finishedBlock{
    DownLoadOperation *op = [[self alloc]init];
    
    
    op.url = url;
    op.finishedBlock = finishedBlock;
    
    return op;
}

@end
