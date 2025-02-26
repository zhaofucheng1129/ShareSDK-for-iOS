//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBSinaWeiboViewController.h"
#import <Photos/Photos.h>

@interface MOBSinaWeiboViewController ()

@end

@implementation MOBSinaWeiboViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeSinaWeibo;
    self.title = @"新浪微博";
    shareIconArray = @[@"textIcon",@"textAndImageIcon",@"webURLIcon",@"videoIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字 SDK",@"文字+图片 SDK",@"链接 SDK",@"视频 SDK",@"分享LinkCard"];
    selectorNameArray = @[@"shareText",@"shareImages",@"shareLink",@"shareVideos",@"shareLinkCard"];
}

- (void)shareText
{
    //v4.0.1 不在区分网页与客户端 有客户端则有限调用客户端进行分享 无客户端则调用SDK自带分享页面
    //此页面不需要设置 安全域名 并可以分享话题 如果希望使用api进行分享则参考 shareTextByAPI shareImageByAPI
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                              title:nil
//                                             images:nil
//                                              video:nil
//                                                url:nil
//                                           latitude:0
//                                          longitude:0
//                                           objectID:0
//                                     isShareToStory:false
//                                               type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

- (void)shareImages
{
    //v4.0.1 不在区分网页与客户端 有客户端则有限调用客户端进行分享 无客户端则调用SDK自带分享页面
    //此页面不需要设置 安全域名 并可以分享话题 如果希望使用api进行分享则参考 shareTextByAPI shareImageByAPI
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:@[[UIImage imageNamed:@"COD13.jpg"],[UIImage imageNamed:@"D45.jpg"]]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                              title:nil
//                                             images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"],
//                                                      [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]]
//                                              video:nil
//                                                url:nil
//                                           latitude:0 longitude:0
//                                           objectID:nil
//                                     isShareToStory:NO
//                                               type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    //v4.0.1 不在区分网页与客户端 有客户端则有限调用客户端进行分享 无客户端则调用SDK自带分享页面
    //此页面不需要设置 安全域名 并可以分享话题 如果希望使用api进行分享则参考 shareTextByAPI shareImageByAPI
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"我是Text"
                                    images:[UIImage imageNamed:@"COD13.jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"我是title"
                                      type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (void)shareLinkCard
{
    //v4.0.1 不在区分网页与客户端 有客户端则有限调用客户端进行分享 无客户端则调用SDK自带分享页面
    //此页面不需要设置 安全域名 并可以分享话题 如果希望使用api进行分享则参考 shareTextByAPI shareImageByAPI
    //图片必须为网络地址图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupSinaWeiboLinkCardShareParamsByText:@"我是Text"
                                                  cardTitle:@"cardTitle"
                                                cardSummary:@"summary"
                                                     images:@"http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png"
                                                        url:[NSURL URLWithString:@"http://www.mob.com"]];
    
    [self shareWithParameters:parameters];
}


//- (void)shareTextByAPI
//{
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    //text需要附 安全域
//    [parameters SSDKSetupShareParamsByText:@"Share SDK http://www.mob.com"
//                                    images:nil
//                                       url:nil
//                                     title:nil
//                                      type:SSDKContentTypeText];
//    [parameters SSDKEnableSinaWeiboAPIShare];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK http://www.mob.com/"
//                                              title:nil
//                                              image:nil
//                                                url:nil
//                                           latitude:nil
//                                          longitude:nil
//                                           objectID:nil
//                                               type:SSDKContentTypeText];
//    [self shareWithParameters:parameters];
//}

//- (void)shareImageByAPI
//{
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    //text需要附 安全域
//    [parameters SSDKSetupShareParamsByText:@"Share SDK http://www.mob.com"
//                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       url:nil
//                                     title:nil
//                                      type:SSDKContentTypeImage];
//    [parameters SSDKEnableSinaWeiboAPIShare];
    //平台定制
    //    [parameters SSDKSetupSinaWeiboShareParamsByText:nil
    //                                              title:nil
    //                                              image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                                url:nil
    //                                           latitude:nil
    //                                          longitude:nil
    //                                           objectID:nil
    //                                               type:SSDKContentTypeImage];
//    [self shareWithParameters:parameters];
//}

- (void)shareVideos
{
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupSinaWeiboShareParamsByText:@"ShareSDK"
                                              title:nil
                                             images:nil
                                              video:videoPath
                                                url:nil
                                           latitude:0
                                          longitude:0
                                           objectID:nil
                                     isShareToStory:NO
                                               type:SSDKContentTypeVideo];

    [self shareWithParameters:parameters];
}

@end
