//
//  ImageCell.m
//  自定义流水布局
//
//  Created by kouliang on 15/3/20.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation ImageCell

- (void)awakeFromNib {
    // Initialization code
    self.imageView.layer.borderWidth = 5;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;
}
- (void)setImage:(NSString *)image
{
    _image = [image copy];
    
    self.imageView.image = [UIImage imageNamed:image];
}
@end
