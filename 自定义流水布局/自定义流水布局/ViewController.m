//
//  ViewController.m
//  自定义流水布局
//
//  Created by kouliang on 15/3/20.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "ViewController.h"
#import "LineLayout.h"
#import "ImageCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
/** 所有的图片名 */
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation ViewController
static NSString *const ID = @"image";

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        
        for (int i = 1; i<=20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    LineLayout *layout = [[LineLayout alloc] init];
    
    // 创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.item];
    return cell;
}

@end
