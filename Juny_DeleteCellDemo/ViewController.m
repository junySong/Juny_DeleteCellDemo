//
//  ViewController.m
//  Juny_DeleteCellDemo
//
//  Created by 宋俊红 on 17/2/23.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "ViewController.h"
#import "DeleteTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *_tableView;
@property (nonatomic, strong) NSMutableArray *array;//

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _array = [NSMutableArray array];
    for (int i = 0; i<50; i++) {
        [_array addObject:[NSString stringWithFormat:@"I am %d row",i]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid = @"rid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: rid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, 67, 44)];
        view.backgroundColor = [UIColor purpleColor];
        [cell.contentView addSubview:  view];
        
        
        UILabel *label = [[UILabel alloc]init];
        label.frame  = CGRectMake(0, 0, 67, 44);
        label.textColor = [UIColor blackColor];
        label.text = @"爱大红";
        label.font = [UIFont systemFontOfSize:15];
        [view addSubview:label];
    }
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return TRUE;
    
}
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    return UITableViewCellEditingStyleDelete;
//    
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
//        
//        if (indexPath.row<[self.array count]) {
//            
//            [self.array removeObjectAtIndex:indexPath.row];//移除数据源的数据
//            
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
//            
//        }
//        
//    }
//    
//}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        if (indexPath.row<[self.array count]) {
            
            [self.array removeObjectAtIndex:indexPath.row];//移除数据源的数据
            
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
            
        }
    }];
    action.backgroundColor = [UIColor clearColor];
    
    return @[action];
}

@end
