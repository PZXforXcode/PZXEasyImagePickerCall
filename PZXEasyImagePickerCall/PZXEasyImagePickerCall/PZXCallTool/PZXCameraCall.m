//
//  PZXCameraCall.m
//  XY_PetHelper
//
//  Created by pzx on 2023/3/7.
//  Copyright © 2023 ornn. All rights reserved.
//

#import "PZXCameraCall.h"


static PZXCameraCall *cameraCall = nil;


@implementation PZXCameraCall

+ (PZXCameraCall *)shareUploadImage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cameraCall = [[PZXCameraCall alloc] init];
    });
    return cameraCall;
}


- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC
                                     delegate:(id<CameraCallDelegate>)aDelegate {
    
    cameraCall.CameraCallDelegate = aDelegate;
    _fatherViewController = fatherVC;

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择照片方式" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction  *button1 =[UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self createPhotoView];
                    
        
    }];
    [alert addAction:button1];
    
    UIAlertAction  *button2 =[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
        [self fromPhotos];
        
    }];
    [alert addAction:button2];
    
    UIAlertAction  *button3 =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
        
    }];
    [alert addAction:button3];

    [fatherVC presentViewController:alert animated:YES completion:nil];

    
    

}


#pragma mark - 头像(相机和从相册中选择)
- (void)createPhotoView {
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
        imagePC.sourceType                = UIImagePickerControllerSourceTypeCamera;
        imagePC.delegate                  = self;
        imagePC.allowsEditing             = NO;
        [_fatherViewController presentViewController:imagePC
                                            animated:YES
                                          completion:^{
                                          }];
    }else {
        
        
//        [UtilTool ShowAlertView:@"提示" setMsg:@"该设备没有照相机"];
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                         message:@"该设备没有照相机"
//                                                        delegate:nil
//                                               cancelButtonTitle:@"确定"
//                                               otherButtonTitles:nil];
//        [alert show];
    }
}


//图片库方法(从手机的图片库中查找图片)
- (void)fromPhotos {
    
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    imagePC.sourceType                = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePC.delegate                  = self;
    imagePC.allowsEditing             = NO;
    imagePC.modalPresentationStyle = UIModalPresentationFullScreen;
    [_fatherViewController presentViewController:imagePC
                                        animated:YES
                                      completion:^{
                                      }];
}


///UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info{
    
    UIImage * image = [[UIImage alloc]init];
    image = [info valueForKey:UIImagePickerControllerOriginalImage];

    
    if ([_CameraCallDelegate respondsToSelector:@selector(uploadImageToServerWithImage:)]) { // 如果协议响应了sendValue:方法
        [self.CameraCallDelegate uploadImageToServerWithImage:image];
    }

    [_fatherViewController dismissViewControllerAnimated:true completion:^{

    }];
    
    
}



@end
