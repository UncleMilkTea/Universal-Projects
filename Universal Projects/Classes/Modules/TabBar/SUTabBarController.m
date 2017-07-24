//
//  SUTabBarController.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUTabBarController.h"
#import "SUNavigationController.h"
#import "SUHomeViewController.h"

@interface SUTabBarController () <UITabBarControllerDelegate>

@property (nonatomic, strong) SUHomeViewController *homePage;
@property (nonatomic, strong) UIViewController *timely;
@property (nonatomic, strong) UIViewController *shoppingCar;
@property (nonatomic, strong) UIViewController *mine;

@end

@implementation SUTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabbarStyle];
    [self setupAllChildViewControllers];
}

- (void)setupTabbarStyle {

    //    self.tabBar.tintColor = UIColorFromRGB(164,0,8);
    self.tabBar.tintColor = UIColorFromRGB(164,0,8);

    // 统一设置 tabBarItem 未选中时的文字颜色
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromSameRGB(128), NSForegroundColorAttributeName, [UIFont systemFontOfSize:12], NSFontAttributeName,nil] forState:UIControlStateNormal];

    // 统一设置 tabBarItem 选中时的文字颜色
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12], NSFontAttributeName,nil] forState:UIControlStateSelected];

    //    MC_SPLITLINE_COLOR_GRAY
    //    UIImage *image = [UIImage imageWithColor:[UIColor redColor] fromSize:CGSizeMake(1, 1)];
    ////    MC_BACKGRUOND_COLOR_WHITE
    //    UIImage *backImage = [UIImage imageWithColor:[UIColor blueColor] fromSize:CGSizeMake(1, 1)];
    //    self.tabBar.shadowImage = image;
    //    self.tabBar.backgroundImage = backImage;
}

- (void)setupAllChildViewControllers {

    _homePage = [[SUHomeViewController alloc] init];
    _timely = [[UIViewController alloc] init];
    _shoppingCar = [[UIViewController alloc] init];
    _mine = [[UIViewController alloc] init];

    NSArray *viewControllers = @[_homePage, _timely, _shoppingCar, _mine];
    [[SUConfigurationManager sharedInstance].tabBarItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dic = (NSDictionary *)obj;

        [self tabBarItem:viewControllers[idx] title:dic[@"Title"] imageName:dic[@"ImageName"] selectedImageName:dic[@"SelectedImageName"]];
         SUNavigationController *nav = [[SUNavigationController alloc] initWithRootViewController:viewControllers[idx]];
        [self addChildViewController:nav];
    }];
}

- (void)tabBarItem:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {

    controller.tabBarItem.title = title;
    // 不需动态更换 tabBarItem 的图片
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    // controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];

    // 需要动态更换 tabBarItem 的图片
    // 如果有节日活动专用图片 则获取 服务器返回的活动图片进行显示
    // controller.tabBarItem.image = [self loadImageWithName:imageName];
    // controller.tabBarItem.selectedImage = [self loadImageWithName:selectedImageName];
}
- (UIImage *)loadImageWithName:(NSString *)name {
    // 如果有活动 (比如新年活动...将所有图片显示为红包或者灯笼之类的)
    //    NSInteger flag = [[CSUserDefaults objectForKey:THEME_OPEN] integerValue];
    //    if (1 == flag) {
    //        NSString *fileName = [NSString stringWithFormat:@"%@/%@/%@@%@x.png",[MCFileManager libraryFoler],THEME_DIR,name,(iPhone6Plus)?@"3":@"2"];

    //        UIImage *temp = [[UIImage imageWithContentsOfFile:fileName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //        if (temp) {
    //            return temp;
    //        }

    //        return  [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    }
    // 服务器没有新的主题或者是主题加载是吧的情况使用原版的主题
    return  [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
#pragma mark 定期检查未读的消息数量
- (void)checkUnreadCount {
    //    self.mine.tabBarItem.badgeValue = @"9";
    //    [self.tabBar showBadgeOnItemIndex:3];
}

#pragma mark 是否显示未读消息的提醒
- (void)tabBarUnreadTip {
    //    NSInteger isUnread = [MCManager sharedInstance].currentUser.existedUnreadedMessage;
    //    if (isUnread) {
    //        [self.tabBar showBadgeOnItemIndex:3];
    //    }else {
    //        [self.tabBar hideBadgeOnItemIndex:3];
    //    }
}

#pragma mark - UITabBarControllerDelegate
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//
//}




@end
