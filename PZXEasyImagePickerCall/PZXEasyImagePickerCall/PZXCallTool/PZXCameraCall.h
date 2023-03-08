//
//  PZXCameraCall.h
//  XY_PetHelper
//
//  Created by pzx on 2023/3/7.
//  Copyright © 2023 ornn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define CameraCall_IMAGE [CameraCall shareUploadImage]

@protocol CameraCallDelegate <NSObject>
@optional

- (void)uploadImageToServerWithImage:(UIImage *)image;

@end

@interface PZXCameraCall : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIViewController *_fatherViewController;

}

+ (PZXCameraCall *)shareUploadImage;


@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, weak) id <CameraCallDelegate> CameraCallDelegate;

- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC
                                     delegate:(id<CameraCallDelegate>)aDelegate ;


@end

NS_ASSUME_NONNULL_END
