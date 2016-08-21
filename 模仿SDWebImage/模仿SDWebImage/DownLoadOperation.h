//
//  DownLoadOperation.h
//  模仿SDWebImage
//
//  Created by 胡志强 on 16/8/20.
//  Copyright © 2016年 胡志强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DownLoadOperation : NSBlockOperation

@property(copy,nonatomic)NSString *url;

@property(copy,nonatomic)void(^finishedBlock)(UIImage *image);

+(instancetype)downLoadOperationWithNsstring:(NSString *)url finishedBlock:(void(^)(UIImage *image))finishedBlock;

@end
