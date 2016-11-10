//
//  YYDropDownMenu.m
//  TSYY-Client
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 TORRES9. All rights reserved.
//

#import "YYDropDownMenu.h"

#define RowHeight 45

@interface YYDropDownMenu ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)NSMutableArray *categoryArray;

@property(nonatomic,retain)UIControl *bgControl;

@property(nonatomic,retain)CXBaseTableView *myTableView0;
@property(nonatomic,retain)CXBaseTableView *myTableView1;
@property(nonatomic,retain)CXBaseTableView *myTableView2;


@property(nonatomic,assign)NSInteger currentSelectedIndex;

@property(nonatomic,assign)CGFloat categoryHeight;

@end

@implementation YYDropDownMenu

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.currentSelectedIndex = -1;
        self.backgroundColor = [UIColor clearColor];
        self.categoryHeight = frame.size.height;
    }
    
    return self;
}

- (void)setDataSource:(id<YYDropDownMenuDataSource>)dataSource
{
    _dataSource = dataSource;
    
    [self createCategoryView];
    
    [self addSubview:self.bgControl];
    [self addSubview:self.myTableView0];
    [self addSubview:self.myTableView1];
    [self addSubview:self.myTableView2];
}

- (void)createCategoryView
{
    NSInteger categoryCount = [self.dataSource yy_dropDownMenuNumberOfCategoryInMenu:self];
    
    CGFloat categoryWidth = self.viewSizeWidth/categoryCount;
    
    for (int i = 0; i < categoryCount; i++)
    {
        UIButton *category = [[UIButton alloc] initWithFrame:CGRectMake(i*categoryWidth, 0, categoryWidth, self.viewSizeHeight)];
        category.titleLabel.font = FontSize(14);
        category.tag = ButtonTag+i;
        category.titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        [category setAttributedTitle:[CXGlobalTool cx_emotionStrWithString:[NSString stringWithFormat:@"%@ [箭头下]",[self.dataSource yy_dropDownMenu:self titleForCategory:i]] textColor:CX_BlackColor offset:2] forState:UIControlStateNormal];
        [category setAttributedTitle:[CXGlobalTool cx_emotionStrWithString:[NSString stringWithFormat:@"%@ [箭头上]",[self.dataSource yy_dropDownMenu:self titleForCategory:i]] textColor:CX_BlackColor offset:2] forState:UIControlStateSelected];
        [category addTarget:self action:@selector(categoryAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.categoryArray addObject:category];
        [self addSubview:category];
    }
    
    for (int i = 0; i < categoryCount-1; i++)
    {
        [self.layer addSublayer:[CXGlobalTool cx_drawSeparatorLineWithColor:CX_LightGrayColor andStartPosition:CGPointMake(categoryWidth+i*categoryWidth, self.viewSizeHeight/4) endPosition:CGPointMake(categoryWidth+i*categoryWidth, self.viewSizeHeight*3/4) LineWidth:1]];
    }
}

#pragma mark - Getter

- (UIControl *)bgControl
{
    if (!_bgControl)
    {
        _bgControl = [[UIControl alloc] initWithFrame:CGRectZero];
        _bgControl.backgroundColor = [UIColor blackColor];
        _bgControl.alpha = 0;
        [_bgControl addTarget:self action:@selector(bgAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _bgControl;
}

- (NSMutableArray *)categoryArray
{
    if (!_categoryArray)
    {
        _categoryArray = [[NSMutableArray alloc] init];
    }
    
    return _categoryArray;
}

- (CXBaseTableView *)myTableView0
{
    if (!_myTableView0)
    {
        _myTableView0 = [[CXBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _myTableView0.tag = ButtonTag+0;
        _myTableView0.showsVerticalScrollIndicator = YES;
        _myTableView0.dataSource = self;
        _myTableView0.delegate = self;
        _myTableView0.hidden = YES;
    }
    
    return _myTableView0;
}

- (CXBaseTableView *)myTableView1
{
    if (!_myTableView1)
    {
        _myTableView1 = [[CXBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _myTableView1.tag = ButtonTag+1;
        _myTableView1.showsVerticalScrollIndicator = YES;
        _myTableView1.backgroundColor = CX_WhiteColor;
        _myTableView1.dataSource = self;
        _myTableView1.delegate = self;
        _myTableView1.hidden = YES;
    }
    
    return _myTableView1;
}

- (CXBaseTableView *)myTableView2
{
    if (!_myTableView2)
    {
        _myTableView2 = [[CXBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _myTableView2.tag = ButtonTag+2;
        _myTableView2.showsVerticalScrollIndicator = YES;
        _myTableView2.backgroundColor = CX_WhiteColor;
        _myTableView2.dataSource = self;
        _myTableView2.delegate = self;
        _myTableView2.hidden = YES;
    }
    
    return _myTableView2;
}

#pragma mark - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource yy_dropDownMenu:self numberOfRowInCategory:self.currentSelectedIndex section:tableView.tag - ButtonTag];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = @"";
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = FontSize(14);
    cell.textLabel.textColor = CX_BlackColor;
    
    cell.textLabel.text = [self.dataSource yy_dropDownMenu:self contentOfRowInCategory:self.currentSelectedIndex indexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:tableView.tag - ButtonTag]];
    
    NSInteger selectedIndex = [self.dataSource yy_dropDownMenu:self selectedIndexInCategory:self.currentSelectedIndex section:tableView.tag - ButtonTag];
    
    if (selectedIndex == indexPath.row)
    {
        cell.textLabel.textColor = CX_ThemeGreenColor;
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    NSInteger tableTag = tableView.tag - ButtonTag;
    
    NSInteger colunm = [self.dataSource yy_dropDownMenu:self numberOfColumnsInCategory:self.currentSelectedIndex];
    
    if (tableTag == colunm - 1)
    {
        [self hideMenuAndShowAgain:NO];
    }
    
    if ([self.delegate respondsToSelector:@selector(yy_dropDownMenu:didSelectRowAtCategory:indexPath:)])
    {
        [self.delegate yy_dropDownMenu:self didSelectRowAtCategory:self.currentSelectedIndex indexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:tableView.tag - ButtonTag]];
    }
}


#pragma mark - Action

- (void)reloadData
{
    [self.myTableView0 reloadData];
    [self.myTableView1 reloadData];
    [self.myTableView2 reloadData];
}

- (void)categoryAction:(UIButton *)sender
{
    NSInteger index = sender.tag - ButtonTag;
    
    if (self.currentSelectedIndex == -1)
    {
        self.currentSelectedIndex = index;
        
        sender.selected = YES;
        
        [self showMenu];
    }else
    {
        if (self.currentSelectedIndex == index)
        {
            sender.selected = !sender.selected;
            
            if (sender.selected)
            {
                [self showMenu];
            }else
            {
                self.currentSelectedIndex = -1;
                
                [self hideMenuAndShowAgain:NO];
            }
        }else
        {
            self.currentSelectedIndex = index;
            
            for (UIButton *button in self.categoryArray)
            {
                button.selected = NO;
            }
            
            sender.selected = YES;
            
            [self hideMenuAndShowAgain:YES];
        }
    }
}

- (void)showMenu
{
    if ([self.delegate respondsToSelector:@selector(yy_dropDownMenu:didSelectCategory:)])
    {
        [self.delegate yy_dropDownMenu:self didSelectCategory:self.currentSelectedIndex];
    }
    
    [self reloadData];
    
    NSInteger colunm = [self.dataSource yy_dropDownMenu:self numberOfColumnsInCategory:self.currentSelectedIndex];
    
    self.frame = CGRectMake(self.viewOriginX, self.viewOriginY, self.viewSizeWidth, Screen_Height-StatusNavigationBarHeight);
    self.bgControl.frame = CGRectMake(0, self.categoryHeight, self.viewSizeWidth, Screen_Height-self.categoryHeight-StatusNavigationBarHeight);
    
    WS(weakSelf);
    
    switch (colunm)
    {
        case 1:
        {
            NSInteger row = [self.dataSource yy_dropDownMenu:self numberOfRowInCategory:self.currentSelectedIndex section:0];
            
            CGFloat tableviewHeight = row*RowHeight > (Screen_Height-self.categoryHeight-StatusNavigationBarHeight) ? (Screen_Height-self.categoryHeight-StatusNavigationBarHeight) : row*RowHeight;
            
            self.myTableView0.hidden = NO;
            self.myTableView1.hidden = YES;
            self.myTableView2.hidden = YES;
            
            self.myTableView0.backgroundColor = CX_WhiteColor;
            
            self.myTableView0.frame = CGRectMake(0, self.categoryHeight, self.viewSizeWidth/colunm, 0);
            self.myTableView1.frame = CGRectZero;
            self.myTableView2.frame = CGRectZero;
            
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.myTableView0.frame = CGRectMake(0, weakSelf.categoryHeight, weakSelf.viewSizeWidth/colunm, tableviewHeight);
                weakSelf.myTableView1.frame = CGRectZero;
                weakSelf.myTableView2.frame = CGRectZero;
                
                weakSelf.bgControl.alpha = 0.3;
            }];
        }
            break;
            
        case 2:
        {
            self.myTableView0.hidden = NO;
            self.myTableView1.hidden = NO;
            self.myTableView2.hidden = YES;
            
            self.myTableView0.backgroundColor = CX_BackgroundColor;
            self.myTableView1.backgroundColor = CX_WhiteColor;
            
            self.myTableView0.frame = CGRectMake(0, self.categoryHeight, self.viewSizeWidth/colunm, 0);
            self.myTableView1.frame = CGRectMake(self.myTableView0.viewDistanceX, self.myTableView0.viewOriginY, self.myTableView0.viewSizeWidth, self.myTableView0.viewSizeHeight);
            self.myTableView2.frame = CGRectZero;
            
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.myTableView0.frame = CGRectMake(0, weakSelf.categoryHeight, weakSelf.viewSizeWidth/colunm, Screen_Height-weakSelf.categoryHeight-StatusNavigationBarHeight);
                weakSelf.myTableView1.frame = CGRectMake(weakSelf.myTableView0.viewDistanceX, weakSelf.myTableView0.viewOriginY, weakSelf.myTableView0.viewSizeWidth, self.myTableView0.viewSizeHeight);
                weakSelf.myTableView2.frame = CGRectZero;
                
                weakSelf.bgControl.alpha = 0.3;
            }];
        }
            break;
            
        case 3:
        {
            self.myTableView0.hidden = NO;
            self.myTableView1.hidden = NO;
            self.myTableView2.hidden = NO;
            
            self.myTableView0.backgroundColor = CX_BackgroundColor;
            self.myTableView1.backgroundColor = CX_WhiteColor;
            self.myTableView2.backgroundColor = CX_WhiteColor;
            
            
            self.myTableView0.frame = CGRectMake(0, self.categoryHeight, self.viewSizeWidth/colunm, 0);
            self.myTableView1.frame = CGRectMake(self.myTableView0.viewDistanceX, self.myTableView0.viewOriginY, self.myTableView0.viewSizeWidth, self.myTableView0.viewSizeHeight);
            self.myTableView2.frame = CGRectMake(self.myTableView1.viewDistanceX, self.myTableView0.viewOriginY, self.myTableView0.viewSizeWidth, self.myTableView0.viewSizeHeight);
            
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.myTableView0.frame = CGRectMake(0, weakSelf.categoryHeight, weakSelf.viewSizeWidth/colunm, Screen_Height-weakSelf.categoryHeight-StatusNavigationBarHeight);
                weakSelf.myTableView1.frame = CGRectMake(weakSelf.myTableView0.viewDistanceX, weakSelf.myTableView0.viewOriginY, weakSelf.myTableView0.viewSizeWidth, weakSelf.myTableView0.viewSizeHeight);
                weakSelf.myTableView2.frame = CGRectMake(weakSelf.myTableView1.viewDistanceX, weakSelf.myTableView0.viewOriginY, weakSelf.myTableView0.viewSizeWidth, weakSelf.myTableView0.viewSizeHeight);
                
                weakSelf.bgControl.alpha = 0.3;
            }];
        }
            break;
            
        default:
            break;
    }
}

- (void)hideMenuAndShowAgain:(BOOL)again
{
    WS(weakSelf);
    
    self.frame = CGRectMake(self.viewOriginX, self.viewOriginY, self.viewSizeWidth, self.categoryHeight);
    
    if (!again)
    {
        for (UIButton *button in weakSelf.categoryArray)
        {
            button.selected = NO;
        }
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.myTableView0.frame = CGRectMake(weakSelf.myTableView0.viewOriginX, weakSelf.myTableView0.viewOriginY, weakSelf.myTableView0.viewSizeWidth, 0);
        weakSelf.myTableView1.frame = CGRectMake(weakSelf.myTableView1.viewOriginX, weakSelf.myTableView1.viewOriginY, weakSelf.myTableView1.viewSizeWidth, 0);
        weakSelf.myTableView2.frame = CGRectMake(weakSelf.myTableView2.viewOriginX, weakSelf.myTableView2.viewOriginY, weakSelf.myTableView2.viewSizeWidth, 0);
        
        weakSelf.bgControl.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished)
        {
            if (again)
            {
                [weakSelf showMenu];
            }else
            {
                weakSelf.bgControl.frame = CGRectMake(weakSelf.bgControl.viewOriginX, weakSelf.bgControl.viewOriginY, weakSelf.bgControl.viewSizeWidth, 0);
                
                if (weakSelf.hideMenuBlock)
                {
                    weakSelf.hideMenuBlock();
                }
            }
        }
    }];
}

- (void)bgAction
{
    for (UIButton *button in self.categoryArray)
    {
        button.selected = NO;
    }
    
    [self hideMenuAndShowAgain:NO];
}

- (void)setCategoryString:(NSString *)catogoryString categoryIndex:(NSInteger)index
{
    UIButton *category = [self.categoryArray objectAtIndex:index];
    
    [category setAttributedTitle:[CXGlobalTool cx_emotionStrWithString:[NSString stringWithFormat:@"%@ [箭头下]",catogoryString] textColor:CX_BlackColor offset:2] forState:UIControlStateNormal];
    [category setAttributedTitle:[CXGlobalTool cx_emotionStrWithString:[NSString stringWithFormat:@"%@ [箭头上]",catogoryString] textColor:CX_ThemeGreenColor offset:2] forState:UIControlStateSelected];
}

@end
