//
//  ProductCell.h
//  Ex.3.4.18
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CartDelegate.h"
@interface ProductCell : UITableViewCell


-(void)setProductInfo:(Product*)item;
@property(weak)id<CartDelegate>delegate;
@end
