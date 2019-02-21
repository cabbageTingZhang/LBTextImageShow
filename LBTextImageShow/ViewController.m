//
//  ViewController.m
//  LBTextImageShow
//
//  Created by SuperCabbage on 2019/2/19.
//  Copyright © 2019 SuperCabbage. All rights reserved.
//

#import "ViewController.h"
#import <TesseractOCR/TesseractOCR.h>
#import <TZImageManager.h>
#import <TZImagePickerController.h>
#import "UIColor+K1Util.h"

@interface ViewController ()<TZImagePickerControllerDelegate>
    @property (weak, nonatomic) IBOutlet UIImageView *imageToRecognize;
    @property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *textLab = [[UILabel alloc] init];
    textLab.frame = CGRectMake(16, 100, 100, 100);
    textLab.backgroundColor = [UIColor redColor];
    textLab.text = @"hello world";
    textLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLab];
}
    
- (IBAction)openCamera:(id)sender {//打开照相机
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    imagePickerVc.navigationBar.barTintColor = [UIColor whiteColor];
    imagePickerVc.barItemTextColor = [UIColor colorWithHexString:@"#333333"];
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.oKButtonTitleColorNormal = [UIColor colorWithHexString:@"#52d68d"];
    imagePickerVc.oKButtonTitleColorDisabled = [UIColor colorWithHexString:@"#baefd1"];
    
    [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton){
        [leftButton setImage:[UIImage imageNamed:@"icon_new_back"] forState:UIControlStateNormal];
        [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
    }];
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
    
- (IBAction)recognizeSampleImage:(id)sender {//识别一些简单的图片
    
}

- (IBAction)clearCache:(id)sender {//清楚缓存
    
}
    
- (void)recognizeImageWithTesseract:(UIImage *)image{
        
}

- (void)tesseractRecogniceWithImage:(UIImage *)image compleate:(void(^)(NSString *text))compleate {//图片转文字识别
    G8Tesseract *tesseract = [[G8Tesseract alloc]initWithLanguage:@"eng"];
    //模式
    tesseract.engineMode = G8OCREngineModeTesseractOnly;
    tesseract.maximumRecognitionTime = 10;
    tesseract.pageSegmentationMode = G8PageSegmentationModeAuto;
    tesseract.image = [image g8_blackAndWhite];
    
    [tesseract recognize];
    compleate(tesseract.recognizedText);
}


@end
