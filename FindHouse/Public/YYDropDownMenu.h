//
//  YYDropDownMenu.h
//  TSYY-Client
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 TORRES9. All rights reserved.
//

#import "CXBaseView.h"

@class YYDropDownMenu;

typedef void(^YYDropDownMenuHideMenuBlock)(void);

@protocol YYDropDownMenuDelegte <NSObject>

@optional

- (void)yy_dropDownMenu:(YYDropDownMenu *)menu didSelectRowAtCategory:(NSInteger)category indexPath:(NSIndexPath *)indexPath;

- (void)yy_dropDownMenu:(YYDropDownMenu *)menu didSelectCategory:(NSInteger)category;

@end

@protocol YYDropDownMenuDataSource <NSObject>

@required

- (NSInteger)yy_dropDownMenuNumberOfCategoryInMenu:(YYDropDownMenu *)menu;

- (NSString *)yy_dropDownMenu:(YYDropDownMenu *)menu titleForCategory:(NSInteger)category;

- (NSInteger)yy_dropDownMenu:(YYDropDownMenu *)menu numberOfColumnsInCategory:(NSInteger)category;

- (NSInteger)yy_dropDownMenu:(YYDropDownMenu *)menu numberOfRowInCategory:(NSInteger)category section:(NSInteger)section;

- (NSString *)yy_dropDownMenu:(YYDropDownMenu *)menu contentOfRowInCategory:(NSInteger)category indexPath:(NSIndexPath *)indexPath;

- (NSInteger)yy_dropDownMenu:(YYDropDownMenu *)menu selectedIndexInCategory:(NSInteger)category section:(NSInteger)section;

@end

@interface YYDropDownMenu : CXBaseView

@property(nonatomic,assign)id<YYDropDownMenuDataSource> dataSource;

@property(nonatomic,assign)id<YYDropDownMenuDelegte> delegate;

@property(nonatomic,copy)YYDropDownMenuHideMenuBlock hideMenuBlock;

- (void)reloadData;

- (void)setCategoryString:(NSString *)catogoryString categoryIndex:(NSInteger)index;

@end
