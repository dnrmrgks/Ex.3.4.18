//
//  Product.m
//  Ex.3.4.18
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "Product.h"

@implementation Product

+(id)product:(NSString *)name price:(NSString *)price image:(NSString *)image{
    
    Product *  item = [[Product alloc]init];
    item.name = name;
    item.price = price;
    item.imageName = image;
    return item;
}

@end
