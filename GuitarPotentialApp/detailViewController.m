//
//  detailViewController.m
//  GuitarPotentialApp
//
//  Created by 岡 慎一郎 on 2015/02/23.
//  Copyright (c) 2015年 oka.shinichiro. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController () {
    NSString *_title, *_artist, *_key;
    NSInteger *_capo;
    NSMutableArray *_songHistoryArray;
}
@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /***********************************************/
    /**********テキストファイル読み込みフェーズ***********/
    /***********************************************/
    NSMutableArray *_songHistoryArray = [NSMutableArray array];
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"J-Total Music－涙のキッス（サザンオールスターズ）" ofType:@"txt"];
    _title = @"涙のキッス";
    _artist = @"サザンオールスターズ";
    _key = @"+-0";_capo = 3;
    self.SongWordStr.text = [NSString stringWithContentsOfFile:filePath encoding:NSShiftJISStringEncoding error:&error];
    NSLog(@"%@", self.SongWordStr.text);
    /***********************************************/
    /**********テキストファイル読み込みフェーズ***********/
    /***********************************************/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapSaveButton:(id)sender {
    UITabBarController *tab = (UITabBarController *)[self presentingViewController];
    [tab setSelectedIndex:2];
    
    /***********************************************/
    /**********楽曲情報保存フェーズ***********/
    /***********************************************/
    //-- ディクショナリに保存
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:_title forKey:@"TITLE"];
    [dictionary setObject:_artist forKey:@"ARTIST"];
    [dictionary setObject:_key forKey:@"KEY"];
//    [dictionary setObject:(NSString *)_capo forKey:@"CAPO"];

    //-- NSMutableArrayにディクショナリを追加
    [_songHistoryArray setObject:dictionary atIndexedSubscript:0];
//    [_songHistoryArray addObject:dictionary];

    //-- ユーザデフォルトにNSMutableArrayを追加
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_songHistoryArray forKey:@"ALLSONGS"];
    [defaults synchronize];
    /***********************************************/
    /**********楽曲情報保存フェーズ***********/
    /***********************************************/
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
