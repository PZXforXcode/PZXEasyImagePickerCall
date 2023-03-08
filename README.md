# PZXEasyImagePickerCall
一款简单的呼出相机相册选择器的工具类，不用每次都去单独创建imagePickerController 一行代码即可解决

使用方法

导入'PZXCallTool'文件夹

```
#import "PZXCameraCall.h"
//导入
CameraCallDelegate

//OC 用法

    [[PZXCameraCall  shareUploadImage]showActionSheetInFatherViewController:self delegate:self];
    
    //代理
    - (void)uploadImageToServerWithImage:(UIImage *)image{
 
    
    self.headImage.image = image;
    
}

//Swift 用法

   PZXCameraCall.shareUploadImage().showActionSheet(inFatherViewController: self, delegate: self)

//代理
func uploadImageToServer(with image: UIImage) {
        
        self.headImageView.image = image;
        
    }


```
