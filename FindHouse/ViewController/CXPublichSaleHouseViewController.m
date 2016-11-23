//
//  CXPublichSaleHouseViewController.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/23.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXPublichSaleHouseViewController.h"
#import "CXAddImageView.h"
#import "GWLPhotoLibrayController.h"
#import "UIPlaceHolderTextView.h"
#import "CXHouseSalePointView.h"
#import "CXSaleHouseNormalInputCellView.h"
#import "CXSaleHouseChooseCellView.h"
#import "CXSaleHouseFloorCellView.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface CXPublichSaleHouseViewController ()<UITableViewDelegate,UITableViewDataSource,CXAddImageViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

@property(nonatomic,retain)TPKeyboardAvoidingTableView *myTableView;

@property(nonatomic,retain)CXBaseView *publishView;

@property(nonatomic,retain)CXAddImageView *uploadImageView;

@property(nonatomic,retain)CXInsetsField *houseMessageTitleField;
@property(nonatomic,retain)CXInsetsField *houseSalePointTitleField;
@property(nonatomic,retain)CXInsetsField *leaveMessageTitleField;

@property(nonatomic,retain)UIPlaceHolderTextView *leaveMessageView;
@property(nonatomic,retain)CXHouseSalePointView *houseSalePointView;

@property(nonatomic,retain)CXSaleHouseNormalInputCellView *blockCellView;
@property(nonatomic,retain)CXSaleHouseNormalInputCellView *areaCellView;
@property(nonatomic,retain)CXSaleHouseNormalInputCellView *priceCellView;
@property(nonatomic,retain)CXSaleHouseChooseCellView *houseTypeCellView;
@property(nonatomic,retain)CXSaleHouseFloorCellView *houseFloorCellView;

@end

@implementation CXPublichSaleHouseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我要卖房";
    
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (TPKeyboardAvoidingTableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-StatusNavigationBarHeight) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        [_myTableView registerClass:[CXBaseTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    
    return _myTableView;
}

- (CXBaseView *)publishView
{
    if (!_publishView)
    {
        _publishView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45+ViewMargin_10*4)];
        _publishView.backgroundColor = [UIColor clearColor];
        
        UIButton *publishButton = [[UIButton alloc] initWithFrame:CGRectMake(ViewMargin_10*3, ViewMargin_10*2, Screen_Width-ViewMargin_10*6, 45)];
        publishButton.backgroundColor = CX_ThemeGreenColor;
        publishButton.titleLabel.font = FontSize(15);
        [publishButton setTitle:@"发布" forState:UIControlStateNormal];
        [publishButton setTitleColor:CX_WhiteColor forState:UIControlStateNormal];
        [_publishView addSubview:publishButton];
    }
    
    return _publishView;
}

- (CXAddImageView *)uploadImageView
{
    if (!_uploadImageView)
    {
        _uploadImageView = [[CXAddImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 0) maxImageCount:8 rowImageCount:4];
        _uploadImageView.delegate = self;
    }
    
    return _uploadImageView;
}

- (CXInsetsField *)houseMessageTitleField
{
    if (!_houseMessageTitleField)
    {
        _houseMessageTitleField = [[CXInsetsField alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 30) margin:ViewMargin_10];
        _houseMessageTitleField.enabled = NO;
        _houseMessageTitleField.textColor = CX_GrayColor;
        _houseMessageTitleField.font = FontSize(12);
        _houseMessageTitleField.text = @"房源信息";
    }
    
    return _houseMessageTitleField;
}

- (CXInsetsField *)houseSalePointTitleField
{
    if (!_houseSalePointTitleField)
    {
        _houseSalePointTitleField = [[CXInsetsField alloc] initWithFrame:self.houseMessageTitleField.frame margin:ViewMargin_10];
        _houseSalePointTitleField.enabled = NO;
        _houseSalePointTitleField.textColor = CX_GrayColor;
        _houseSalePointTitleField.font = FontSize(12);
        _houseSalePointTitleField.text = @"房源卖点";
    }
    
    return _houseSalePointTitleField;
}

- (CXInsetsField *)leaveMessageTitleField
{
    if (!_leaveMessageTitleField)
    {
        _leaveMessageTitleField = [[CXInsetsField alloc] initWithFrame:self.houseMessageTitleField.frame margin:ViewMargin_10];
        _leaveMessageTitleField.enabled = NO;
        _leaveMessageTitleField.textColor = CX_GrayColor;
        _leaveMessageTitleField.font = FontSize(12);
        _leaveMessageTitleField.text = @"业主留言";
    }
    
    return _leaveMessageTitleField;
}

- (UIPlaceHolderTextView *)leaveMessageView
{
    if (!_leaveMessageView)
    {
        _leaveMessageView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(ViewMargin_10, ViewMargin_10, Screen_Width-ViewMargin_Double_10, 100)];
        _leaveMessageView.placeholder = @"例：房子宽敞精装修";
        _leaveMessageView.backgroundColor = CX_WhiteColor;
        _leaveMessageView.textColor = CX_BlackColor;
        _leaveMessageView.font = FontSize(14);
    }
    
    return _leaveMessageView;
}

- (CXHouseSalePointView *)houseSalePointView
{
    if (!_houseSalePointView)
    {
        _houseSalePointView = [[CXHouseSalePointView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 0) objectsArray:@[@"学位",@"地铁",@"电梯",@"满二",@"免个税",@"精装"]];
    }
    
    return _houseSalePointView;
}

- (CXSaleHouseNormalInputCellView *)blockCellView
{
    if (!_blockCellView)
    {
        _blockCellView = [[CXSaleHouseNormalInputCellView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 45) title:@"小区" placeholder:@"输入小区名称" haveUnit:NO unit:@""];
    }
    
    return _blockCellView;
}

- (CXSaleHouseNormalInputCellView *)areaCellView
{
    if (!_areaCellView)
    {
        _areaCellView = [[CXSaleHouseNormalInputCellView alloc] initWithFrame:self.blockCellView.frame title:@"面积" placeholder:@"输入面积" haveUnit:YES unit:@"㎡"];
    }
    
    return _areaCellView;
}

- (CXSaleHouseNormalInputCellView *)priceCellView
{
    if (!_priceCellView)
    {
        _priceCellView = [[CXSaleHouseNormalInputCellView alloc] initWithFrame:self.blockCellView.frame title:@"售价" placeholder:@"输入售价" haveUnit:YES unit:@"万元"];
    }
    
    return _priceCellView;
}

- (CXSaleHouseChooseCellView *)houseTypeCellView
{
    if (!_houseTypeCellView)
    {
        _houseTypeCellView = [[CXSaleHouseChooseCellView alloc] initWithFrame:self.blockCellView.frame title:@"户型" detail:@"选择户型"];
    }
    
    return _houseTypeCellView;
}

- (CXSaleHouseFloorCellView *)houseFloorCellView
{
    if (!_houseFloorCellView)
    {
        _houseFloorCellView = [[CXSaleHouseFloorCellView alloc] initWithFrame:self.blockCellView.frame];
    }
    
    return _houseFloorCellView;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 5;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    if (indexPath.section == 0)
    {
        [cell.contentView addSubview:self.uploadImageView];
    }else if (indexPath.section == 3)
    {
        [cell.contentView addSubview:self.leaveMessageView];
    }else if (indexPath.section == 2)
    {
        [cell.contentView addSubview:self.houseSalePointView];
    }else
    {
        switch (indexPath.row)
        {
            case 0:
            {
                [cell.contentView addSubview:self.blockCellView];
            }
                break;
                
            case 1:
            {
                [cell.contentView addSubview:self.houseFloorCellView];
            }
                break;
                
            case 2:
            {
                [cell.contentView addSubview:self.houseTypeCellView];
            }
                break;
                
            case 3:
            {
                [cell.contentView addSubview:self.areaCellView];
            }
                break;
                
            case 4:
            {
                [cell.contentView addSubview:self.priceCellView];
            }
                break;
                
            default:
                break;
        }
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return self.uploadImageView.height;
    }else if (indexPath.section == 3)
    {
        return self.leaveMessageView.height+ViewMargin_Double_10;
    }else if (indexPath.section == 2)
    {
        return self.houseSalePointView.height;
    }
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.1;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3)
    {
        return self.publishView.height;
    }
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return self.houseMessageTitleField;
    }else if (section == 2)
    {
        return self.houseSalePointTitleField;
    }else if (section == 3)
    {
        return self.leaveMessageTitleField;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 3)
    {
        return self.publishView;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - CXAddImageViewDelegate

- (void)cx_addImageViewAddAction:(CXAddImageView *)addView
{
    [self.view endEditing:YES];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"上传图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从图片库中选取", nil];
    [actionSheet showInView:self.view];
}

- (void)cx_addImageViewDidDeleteImage:(CXAddImageView *)addView
{
    [self.myTableView reloadData];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self photoAction];
    }else if (buttonIndex == 1)
    {
        [self albumAction];
    }
}

- (void)photoAction
{
    
    BOOL isAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    //如果照相机可用
    if (isAvailable)
    {
        //照相功能对象
        UIImagePickerController * imagepickerC = [[UIImagePickerController alloc]init];
        imagepickerC.delegate = self;
        imagepickerC.sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([imagepickerC.navigationBar respondsToSelector:@selector(setBarTintColor:)])
        {
            [imagepickerC.navigationBar setBarTintColor:CX_ThemeGreenColor];
            [imagepickerC.navigationBar setTranslucent:NO];
            [imagepickerC.navigationBar setTintColor:[UIColor whiteColor]];
        }else
        {
            [imagepickerC.navigationBar setBackgroundColor:CX_ThemeGreenColor];
        }
        //        imagepickerC.allowsEditing = YES;
        [self presentViewController:imagepickerC animated:YES completion:nil];
        
    }
    //如果照相机不可用
    else
    {
        UIAlertView * altertview = [[UIAlertView alloc]initWithTitle:@"提示" message:@"照相机功能不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [altertview show];
    }
}

- (void)albumAction
{
    
    //    BOOL isavailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    //    if (isavailable)
    //    {
    //        UIImagePickerController * imagepickerphoto = [[UIImagePickerController alloc]init];
    //        imagepickerphoto.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //        //        imagepickerphoto.allowsEditing = YES;
    //        imagepickerphoto.delegate = self;
    //        [self presentViewController:imagepickerphoto animated:YES completion:nil];
    //    }
    //    else
    //    {
    //        UIAlertView * alertview = [[UIAlertView alloc]initWithTitle:@"提示" message:@"相册功能不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //        [alertview show];
    //    }
    
    WS(weakSelf);
    
    GWLPhotoLibrayController *photoSelector = [GWLPhotoLibrayController photoLibrayControllerWithBlock:^(NSArray *images) {
        [weakSelf.uploadImageView addImages:images];
        [weakSelf.myTableView reloadData];
    }];
    
    NSInteger maxCount = 8 - self.uploadImageView.singleImageViewArray.count;
    photoSelector.maxCount = maxCount;
    photoSelector.multiAlbumSelect = YES;
    [self presentViewController:photoSelector animated:YES completion:nil];
}

#pragma mark - UIImagePicker Delegate

//相机相册功能代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *selectImage = [CXGlobalTool cx_fixImageOrientation:[info valueForKey:UIImagePickerControllerOriginalImage]];
    
    [self.uploadImageView addImage:selectImage];
    [self.myTableView reloadData];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

//取消，不在选取或照照片的代理
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
