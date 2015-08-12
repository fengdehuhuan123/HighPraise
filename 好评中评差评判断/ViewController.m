//
//  ViewController.m
//  好评中评差评判断
//
//  Created by jin on 15/5/22.
//  Copyright (c) 2015年 jin. All rights reserved.
//

#import "ViewController.h"
#import "myButton.h"

@interface ViewController ()

// 按钮数组
@property (nonatomic,strong) NSArray *totalBtnArr;

// 三个按钮选中状态互斥
@property (nonatomic,weak) UIButton *selectedBtn;

// 形象礼仪的值
@property (nonatomic,assign) int ty;
// 专业能力的值
@property (nonatomic,assign) int zy;
// 服务态度的值
@property (nonatomic,assign) int td;

// 形象礼仪的label
@property (nonatomic,strong) UILabel *valueLabel1;
// 专业能力label
@property (nonatomic,strong) UILabel *valueLabel2;
// 服务态度label
@property (nonatomic,strong) UILabel *valueLabel3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 进去时默认为是好评 其他三项都是5颗星
    self.ty = 5;
    self.zy = 5;
    self.td = 5;
    
    // 好评
    UIButton *goodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goodBtn.frame = CGRectMake(50, 100, 50, 30);
    goodBtn.selected = YES;
    self.selectedBtn = goodBtn;
    [goodBtn setTitle:@"好评" forState:UIControlStateNormal];
    // 字体颜色
    [goodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [goodBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 背景颜色
    [goodBtn setBackgroundImage:[UIImage imageNamed:@"middlePingBtn"] forState:UIControlStateNormal];
    [goodBtn setBackgroundImage:[UIImage imageNamed:@"jihuoBtnBack"] forState:UIControlStateSelected];
    [goodBtn addTarget:self action:@selector(goodClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goodBtn];
    
    // 中评
    UIButton *middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    middleBtn.frame = CGRectMake(120, 100, 50, 30);
    [middleBtn setTitle:@"中评" forState:UIControlStateNormal];
    // 字体颜色
    [middleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [middleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [middleBtn setBackgroundImage:[UIImage imageNamed:@"middlePingBtn"] forState:UIControlStateNormal];
    [middleBtn setBackgroundImage:[UIImage imageNamed:@"jihuoBtnBack"] forState:UIControlStateSelected];;    [middleBtn addTarget:self action:@selector(middleClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:middleBtn];
    
    // 差评
    UIButton *badBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    badBtn.frame = CGRectMake(190, 100, 50, 30);
    [badBtn setTitle:@"差评" forState:UIControlStateNormal];
    // 字体颜色
    [badBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [badBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [badBtn setBackgroundImage:[UIImage imageNamed:@"middlePingBtn"] forState:UIControlStateNormal];
    [badBtn setBackgroundImage:[UIImage imageNamed:@"jihuoBtnBack"] forState:UIControlStateSelected];
    [badBtn addTarget:self action:@selector(badClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:badBtn];
    
    NSMutableArray *arr1 = [NSMutableArray array];
    // 添加15个按钮
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 5; j++) {
            myButton *btn = [myButton buttonWithType:UIButtonTypeCustom];
            // 给按钮行号和列号
            btn.col = j;
            btn.row = i;
            btn.frame = CGRectMake(80+ 40*j, 160+ 50*i, 30, 25);
            [btn setBackgroundImage:[UIImage imageNamed:@"yellowStar60X50"] forState:UIControlStateNormal];
            [arr1 addObject:btn];
            [btn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
        }
    }
    self.totalBtnArr = arr1;
    
    // 形象礼仪
    UILabel *appearLabel = [[UILabel alloc]init];
    appearLabel.frame = CGRectMake(10, 160, 56, 24);
    [self labelDemo:appearLabel WithText:@"形象礼仪"];
    [self.view addSubview:appearLabel];
    
    // 专业能力
    UILabel *professLabe = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(appearLabel.frame)+ 27, 56, 24)];
    [self labelDemo:professLabe WithText:@"专业能力"];
    [self.view addSubview:professLabe];
    
    // 服务态度
    UILabel *attitudeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(professLabe.frame)+ 27, 56, 24)];
    [self labelDemo:attitudeLabel WithText:@"服务态度"];
    [self.view addSubview:attitudeLabel];
    
    
    
    // 形象礼仪
    UILabel *appearLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 320, 56, 24)];
    [self labelDemo:appearLabel1 WithText:@"形象礼仪"];
    [self.view addSubview:appearLabel1];
    UILabel *valueLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(appearLabel1.frame)+ 15, 320, 56, 24)];
    valueLabel1.text = @"5";
    self.valueLabel1 = valueLabel1;
    [self.view addSubview:valueLabel1];
    
    // 专业能力
    UILabel *professLabe1 = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(appearLabel1.frame)+ 27, 56, 24)];
    [self labelDemo:professLabe1 WithText:@"专业能力"];
    [self.view addSubview:professLabe1];
    UILabel *valueLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(professLabe1.frame)+ 15, CGRectGetMaxY(appearLabel1.frame)+ 27, 56, 24)];
    valueLabel2.text = @"5";
    self.valueLabel2 = valueLabel2;
    [self.view addSubview:valueLabel2];
    
    // 服务态度
    UILabel *attitudeLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(professLabe1.frame)+ 27, 56, 24)];
    [self labelDemo:attitudeLabel1 WithText:@"服务态度"];
    [self.view addSubview:attitudeLabel1];
    UILabel *valueLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(attitudeLabel1.frame)+ 15,  CGRectGetMaxY(professLabe1.frame)+ 27, 56, 24)];
    valueLabel3.text = @"5";
    self.valueLabel3 = valueLabel3;
    [self.view addSubview:valueLabel3];
}

// 点击好评
- (void)goodClickBtn:(UIButton *)button
{
    // 使三个按钮的状态互斥 只有一个按钮是选中状态
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    
    // 好评的参数  全5星
    self.ty = 5;
    self.zy = 5;
    self.td = 5;
    
    // 好评则所有是绿色星星
    for (int k = 0; k < 15; k++) {
        myButton *btntemp = self.totalBtnArr[k];
        [btntemp setBackgroundImage:[UIImage imageNamed:@"yellowStar60X50"] forState:UIControlStateNormal];
    }
    
    // 显示形象礼仪,专业能力,服务态度 等三个值
    self.valueLabel1.text = [NSString stringWithFormat:@"%d",self.ty];
    self.valueLabel2.text = [NSString stringWithFormat:@"%d",self.zy];
    self.valueLabel3.text = [NSString stringWithFormat:@"%d",self.td];


}

// 点击中评
- (void)middleClickBtn:(UIButton *)button
{
    
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    
    self.ty = 3;
    self.zy = 3;
    self.td = 3;
    
    // 每一行 前三个是绿色星星 后面是白色星星
    for (int k = 0; k < 15; k++) {
        if (k%5 < 3) {
            myButton *btntemp = self.totalBtnArr[k];
            [btntemp setBackgroundImage:[UIImage imageNamed:@"yellowStar60X50"] forState:UIControlStateNormal];
        }else{
            myButton *btntemp = self.totalBtnArr[k];
            [btntemp setBackgroundImage:[UIImage imageNamed:@"writhStar60X50"] forState:UIControlStateNormal];
        }
    }
    self.valueLabel1.text = [NSString stringWithFormat:@"%d",self.ty];
    self.valueLabel2.text = [NSString stringWithFormat:@"%d",self.zy];
    self.valueLabel3.text = [NSString stringWithFormat:@"%d",self.td];
}

// 点击差评
- (void)badClickBtn:(UIButton *)button
{
    
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    
    self.ty = 1;
    self.zy = 1;
    self.td = 1;
    
    // 差评时候 每行前一个是灰色星星 后面4个是白色星星
    for (int k = 0; k < 15; k++) {
        if (k%5 < 1) {
            myButton *btntemp = self.totalBtnArr[k];
            [btntemp setBackgroundImage:[UIImage imageNamed:@"grayStar60X50"] forState:UIControlStateNormal];
        }else{
            myButton *btntemp = self.totalBtnArr[k];
            [btntemp setBackgroundImage:[UIImage imageNamed:@"writhStar60X50"] forState:UIControlStateNormal];
        }
    }
    self.valueLabel1.text = [NSString stringWithFormat:@"%d",self.ty];
    self.valueLabel2.text = [NSString stringWithFormat:@"%d",self.zy];
    self.valueLabel3.text = [NSString stringWithFormat:@"%d",self.td];
}


// 点击15个按钮中的任何一个按钮发生的事件
- (void)ClickBtn:(myButton *)btn
{
    int begin = btn.row * 5; // 选中的那行的第一个
    int end = (btn.row *5 +btn.col);
    
    // 点击的哪行的按钮 改变对应行的参数值
    if (btn.row == 0) {  // 第一行 形象礼仪 ty
        self.ty = end+1;
        
    }else if (btn.row == 1){ // 第二行 专业能力 zy  因为是一维数组 所以减去四
        self.zy = end-4;
        
    }else{                // 第三行 服务态度
        self.td = end-9;
    }
    
    // 变成要的图片
    for (int k = begin; k <= end; k++) {
        myButton *btntemp = self.totalBtnArr[k];
        if ((end - begin)>1) {   //如果大于等于3个 给个绿星星
            [btntemp setBackgroundImage:[UIImage imageNamed:@"yellowStar60X50"] forState:UIControlStateNormal];
        }else{                   // 小于3个 给灰星星
            [btntemp setBackgroundImage:[UIImage imageNamed:@"grayStar60X50"] forState:UIControlStateNormal];
        }
    }
    // 没选的用另一种图片
    for (int k = (btn.row*5 + btn.col)+1; k < (btn.row+1)*5; k++) {
        myButton *btntemp = self.totalBtnArr[k];
        [btntemp setBackgroundImage:[UIImage imageNamed:@"writhStar60X50"] forState:UIControlStateNormal];
    }
    
    self.valueLabel1.text = [NSString stringWithFormat:@"%d",self.ty];
    self.valueLabel2.text = [NSString stringWithFormat:@"%d",self.zy];
    self.valueLabel3.text = [NSString stringWithFormat:@"%d",self.td];
}

// label的样例
- (void)labelDemo:(UILabel *)label WithText:(NSString *)str
{
    //    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:14];
    label.text = str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
