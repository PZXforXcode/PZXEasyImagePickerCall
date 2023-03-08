//
//  ViewController.m
//  PZXEasyImagePickerCall
//
//  Created by pzx on 2023/3/8.
//

#import "ViewController.h"
#import "PZXCameraCall.h"

@interface ViewController () <CameraCallDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)tao:(id)sender {
    
    [[PZXCameraCall  shareUploadImage]showActionSheetInFatherViewController:self delegate:self];
    
    
}

- (void)uploadImageToServerWithImage:(UIImage *)image{
 
    
    self.headImage.image = image;
    
}
@end
