//
//  CXChooseHouseTypePickerView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/24.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXChooseHouseTypePickerView.h"

#define PickerViewHeight 200

@interface CXChooseHouseTypePickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,retain)UIControl *bgControl;

@property(nonatomic,retain)CXBaseView *pickerBGView;
@property(nonatomic,retain)CXBaseLabel *titleLabel;
@property(nonatomic,retain)UIButton *cancelButton;
@property(nonatomic,retain)UIButton *commitButton;
@property(nonatomic,retain)UIPickerView *pickerView;

@property(nonatomic,retain)NSArray *roomArray;
@property(nonatomic,retain)NSArray *sittingRoomArray;
@property(nonatomic,retain)NSArray *toiletArray;

@property(nonatomic,assign)NSInteger selectedRow0;
@property(nonatomic,assign)NSInteger selectedRow1;
@property(nonatomic,assign)NSInteger selectedRow2;

@end

@implementation CXChooseHouseTypePickerView

- (id)init
{
    if (self = [super init])
    {
        UIWindow *keyWindow = [[UIApplication sharedApplication].windows lastObject];
        self.frame = keyWindow.bounds;
        [keyWindow addSubview:self];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.hidden = YES;
        
        self.roomArray = @[@"1",@"2",@"3",@"4",@"5"];
        self.sittingRoomArray = @[@"1",@"2",@"3"];
        self.toiletArray = @[@"1",@"2",@"3"];
        
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews
{
    [self addSubview:self.bgControl];
    [self addSubview:self.pickerBGView];
    [self.pickerBGView addSubview:self.cancelButton];
    [self.pickerBGView addSubview:self.commitButton];
    [self.pickerBGView addSubview:self.titleLabel];
    [self.pickerBGView addSubview:self.pickerView];
    
    [self.pickerBGView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_BackgroundColor andStartPosition:CGPointMake(0, self.cancelButton.height) endPosition:CGPointMake(self.pickerBGView.width, self.cancelButton.height) LineWidth:1]];
}

- (void)show
{
    WS(weakSelf);
    
    self.hidden = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.bgControl.alpha = 0.4;
        weakSelf.pickerBGView.y = weakSelf.height - PickerViewHeight;
    }];
}

- (void)hide
{
    WS(weakSelf);
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.bgControl.alpha = 0;
        weakSelf.pickerBGView.y = weakSelf.height;
    }completion:^(BOOL finished) {
        if (finished)
        {
            weakSelf.hidden = YES;
//            [weakSelf removeFromSuperview];
        }
    }];
}

#pragma mark - Getter

- (UIControl *)bgControl
{
    if (!_bgControl)
    {
        _bgControl = [[UIControl alloc] initWithFrame:self.bounds];
        _bgControl.backgroundColor = [UIColor blackColor];
        _bgControl.alpha = 0;
        [_bgControl addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _bgControl;
}

- (CXBaseView *)pickerBGView
{
    if (!_pickerBGView)
    {
        _pickerBGView = [[CXBaseView alloc] initWithFrame:CGRectMake(0, self.height, self.width, PickerViewHeight)];
    }
    
    return _pickerBGView;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton)
    {
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
        _cancelButton.titleLabel.font = FontSize(14);
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:CX_BlackColor forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancelButton;
}

- (UIButton *)commitButton
{
    if (!_commitButton)
    {
        _commitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.pickerBGView.width-self.cancelButton.width, self.cancelButton.y, self.cancelButton.width, self.cancelButton.height)];
        _commitButton.titleLabel.font = FontSize(14);
        [_commitButton setTitle:@"确定" forState:UIControlStateNormal];
        [_commitButton setTitleColor:CX_ThemeGreenColor forState:UIControlStateNormal];
        [_commitButton addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _commitButton;
}

- (CXBaseLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(self.cancelButton.viewDistanceX+ViewMargin_10, 0, self.commitButton.x-self.cancelButton.viewDistanceX-ViewMargin_Double_10, self.cancelButton.height)];
        _titleLabel.font = FontSize(15);
        _titleLabel.textAlignment = 1;
        _titleLabel.text = @"选择户型";
    }
    
    return _titleLabel;
}

- (UIPickerView *)pickerView
{
    if (!_pickerView)
    {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.cancelButton.viewDistanceY, self.pickerBGView.width, PickerViewHeight-self.cancelButton.viewDistanceY)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        
        CXBaseLabel *roomUnitLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(_pickerView.width/6+ViewMargin_10, _pickerView.height/2-45/2, 45, 45)];
        roomUnitLabel.font = FontSize(15);
        roomUnitLabel.text = @"房";
        [_pickerView addSubview:roomUnitLabel];
        
        CXBaseLabel *sittingRoomUnitLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(roomUnitLabel.x+_pickerView.width/3+ViewMargin_5, roomUnitLabel.viewOriginY, roomUnitLabel.width, roomUnitLabel.height)];
        sittingRoomUnitLabel.font = FontSize(15);
        sittingRoomUnitLabel.text = @"厅";
        [_pickerView addSubview:sittingRoomUnitLabel];
        
        CXBaseLabel *toiletUnitLabel = [[CXBaseLabel alloc] initWithFrame:CGRectMake(sittingRoomUnitLabel.x+_pickerView.width/3+ViewMargin_5, roomUnitLabel.viewOriginY, roomUnitLabel.width, roomUnitLabel.height)];
        toiletUnitLabel.font = FontSize(15);
        toiletUnitLabel.text = @"卫";
        [_pickerView addSubview:toiletUnitLabel];
        
        [_pickerView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_BackgroundColor andStartPosition:CGPointMake(0, roomUnitLabel.y) endPosition:CGPointMake(_pickerView.width, roomUnitLabel.y) LineWidth:1]];
        
        [_pickerView.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_BackgroundColor andStartPosition:CGPointMake(0, roomUnitLabel.viewDistanceY) endPosition:CGPointMake(_pickerView.width, roomUnitLabel.viewDistanceY) LineWidth:1]];
    }
    
    return _pickerView;
}

#pragma mark - UIPickerViewDataSource && Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.roomArray.count;
    }else if (component == 1)
    {
        return self.sittingRoomArray.count;
    }
    
    return self.toiletArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 45;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return self.pickerBGView.width/3;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [self.roomArray objectAtIndex:row];
    }else if (component == 1)
    {
        return [self.sittingRoomArray objectAtIndex:row];
    }
    
    return [self.toiletArray objectAtIndex:row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    if (!view)
    {
        view = [[UIView alloc] init];
    }
    
    for (UIView *subView in view.subviews)
    {
        [subView removeFromSuperview];
    }
    
    CXBaseLabel *label = [[CXBaseLabel alloc] initWithFrame:CGRectMake(0, 0, self.pickerBGView.width/3, 45)];
    label.textAlignment = 1;
    label.font = BoldFontSize(15);
    [view addSubview:label];
    
    if (component == 0)
    {
        label.text = [self.roomArray objectAtIndex:row];
        
        if (row == self.selectedRow0)
        {
            label.textColor = CX_ThemeGreenColor;
        }else
        {
            label.textColor = CX_BlackColor;
        }
        
    }else if (component == 1)
    {
        label.text = [self.sittingRoomArray objectAtIndex:row];
        
        if (row == self.selectedRow1)
        {
            label.textColor = CX_ThemeGreenColor;
        }else
        {
            label.textColor = CX_BlackColor;
        }
    }else
    {
        label.text = [self.toiletArray objectAtIndex:row];
        
        if (row == self.selectedRow2)
        {
            label.textColor = CX_ThemeGreenColor;
        }else
        {
            label.textColor = CX_BlackColor;
        }
    }
    
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        self.selectedRow0 = row;
    }else if (component == 1)
    {
        self.selectedRow1 = row;
    }else
    {
        self.selectedRow2 = row;
    }
    
    [pickerView reloadComponent:component];
}

#pragma mark - Action

- (void)commitAction
{
    NSString *string0 = [self.roomArray objectAtIndex:[self.pickerView selectedRowInComponent:0]];
    NSString *string1 = [self.sittingRoomArray objectAtIndex:[self.pickerView selectedRowInComponent:1]];
    NSString *string2 = [self.toiletArray objectAtIndex:[self.pickerView selectedRowInComponent:2]];
    
    if (self.commitBlock)
    {
        self.commitBlock([NSString stringWithFormat:@"%@房%@厅%@卫",string0,string1,string2]);
    }
    
    [self hide];
}

@end
