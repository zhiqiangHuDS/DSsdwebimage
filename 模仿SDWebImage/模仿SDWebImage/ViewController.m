//
//  ViewController.m
//  模仿SDWebImage
//
//  Created by 胡志强 on 16/8/20.
//  Copyright © 2016年 胡志强. All rights reserved.
//

#import "ViewController.h"
#import "DownLoadOperation.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSOperationQueue *_queue ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化队列
    _queue = [[NSOperationQueue alloc]init];
    self.view.backgroundColor = UIColor.blackColor;
    [self loadData];
    [self loadData2];
}

-(void)loadData2{
    
    NSString *url = @"http://img03.tooopen.com/images/20160706/tooopen_sy_169305625518.jpg";
    DownLoadOperation *op = [DownLoadOperation downLoadOperationWithNsstring:url finishedBlock:^(UIImage *image) {
             UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
        [self.view addSubview:imageV];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(400);
            make.left.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(425, 350));
        }];

    }];
    [_queue addOperation:op];
    
}


-(void)loadData{
    
    //创建操作
    DownLoadOperation *op = [[DownLoadOperation alloc]init];
    
    op.url = @"http://img03.tooopen.com/images/20160706/tooopen_sy_169305625518.jpg";
    
    void(^block)(UIImage *) = ^(UIImage *image){
        UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
        
        
        [self.view addSubview:imageV];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(425, 350));
        }];
    
    };
    
    op.finishedBlock = block;
    
    
    //把自定义操作加到队列
    [_queue addOperation:op];
}



@end
