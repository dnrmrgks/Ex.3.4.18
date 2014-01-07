//
//  ViewController.m
//  Ex.3.4.18
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "CartDelegate.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource,CartDelegate>{
    
    NSArray *data;
    NSMutableArray *cart;
    
}

@property (weak, nonatomic) IBOutlet UITableView *table;



@end

@implementation ViewController


-(void)addItem:(id)sender{
    
    UITableViewCell*cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    Product *item = data[indexPath.row];
    
    [cart addObject:item];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if( 0 == section)
        return [data count];
    else
        
        return [cart count];
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return (0 == section)? @"상품목록": @"카트";
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(0 == indexPath.section){
        
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];

        Product *item = data[indexPath.row];
        [cell setProductInfo:item];
        cell.delegate = self;
        return cell;
    }
    
    else{
        
        UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        Product *item = cart[indexPath.row];
        cell.textLabel.text = item.name;
        return cell;
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    data = @[[Product product:@"SoccerBall" price:@"100" image:@"ball1.png"],
             [Product product:@"PocketBall" price:@"200" image:@"ball2.png" ],
             [Product product:@"TennisBall" price:@"250" image:@"ball3.png"],
             [Product product:@"GolfBall" price:@"300" image:@"Golf Ball.png"],
             [Product product:@"BeachBall" price:@"999" image:@"car1.png"]];
    
    cart = [[NSMutableArray alloc]init];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
