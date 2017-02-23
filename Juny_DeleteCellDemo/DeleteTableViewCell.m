//
//  DeleteTableViewCell.m
//  Juny_DeleteCellDemo
//
//  Created by 宋俊红 on 17/2/23.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "DeleteTableViewCell.h"

@implementation DeleteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *subView in self.subviews)
    {
        if([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")])
        {
            UIView *confirmView=(UIView *)[subView.subviews firstObject];
            //改背景颜色
            confirmView.backgroundColor=[UIColor clearColor];
            for(UIView *sub in confirmView.subviews)
            {
                if([sub isKindOfClass:NSClassFromString(@"UIButtonLabel")])
                {
                    UILabel *deleteLabel=(UILabel *)sub;
                    //改删除按钮的字体大小
                    deleteLabel.font=[UIFont boldSystemFontOfSize:20];
                    deleteLabel.textColor = [UIColor blackColor];
                    deleteLabel.clipsToBounds = YES;
                    deleteLabel.layer.cornerRadius = 10;
                    deleteLabel.backgroundColor = [UIColor yellowColor];
                    //改删除按钮的文字
                    deleteLabel.text=@"删除";
                    deleteLabel.frame = CGRectMake(50, 0, 50, 30);
    
                }
                
                
            }
            break;
        }
    }
}

@end
