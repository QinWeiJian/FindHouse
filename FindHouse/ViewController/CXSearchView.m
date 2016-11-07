//
//  CXSearchView.m
//  FindHouse
//
//  Created by chengxikeji on 16/11/7.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXSearchView.h"

@implementation CXSearchView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.searchImageView];
        [self addSubview:self.searchField];
        
        self.layer.cornerRadius = 5;
    }
    
    return self;
}

#pragma mark - Getter

- (CXBaseImageView *)searchImageView
{
    if (!_searchImageView)
    {
        _searchImageView = [[CXBaseImageView alloc] initWithFrame:CGRectMake(ViewMargin_10, 0, ImageWithNamed(@"home_search").size.width, self.viewSizeHeight)];
        _searchImageView.image = ImageWithNamed(@"home_search");
    }
    
    return _searchImageView;
}

- (CXInsetsField *)searchField
{
    if (!_searchField)
    {
        _searchField = [[CXInsetsField alloc] initWithFrame:CGRectMake(self.searchImageView.viewDistanceX+ViewMargin_10, 0, self.viewSizeWidth-self.searchImageView.viewDistanceX-ViewMargin_Double_10, self.viewSizeHeight) margin:0];
        _searchField.placeholder = @"搜索小区、地段";
    }
    
    return _searchField;
}

@end
