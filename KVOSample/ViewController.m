//
//  ViewController.m
//  KVOSample
//
//  Created by Miyamoto, Shohei on 4/11/15.
//  Copyright (c) 2015 Miyamoto Shohei. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic, strong) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    self.player = [[AVPlayer alloc] initWithPlayerItem:nil];

    [self.player addObserver:self forKeyPath:@"currentItem" options:0 context:nil];
    
    NSURL *trackURL = [NSURL URLWithString:@""];
    AVURLAsset *newAsset = [AVURLAsset URLAssetWithURL:trackURL options:nil];
    AVPlayerItem *avitem = [[AVPlayerItem alloc] initWithAsset:newAsset];
    [self.player replaceCurrentItemWithPlayerItem:avitem];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self.player removeObserver:self forKeyPath:@"currentItem"];
    [self.player replaceCurrentItemWithPlayerItem:nil];
}

@end
