//
//  ViewController.m
//  kvc
//
//  Created by Abhilash on 10/08/15.
//  Copyright (c) 2015 Abhilash. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    self.child1 = [[children alloc] init];
//    self.child1.name = @"George";
//    self.child1.age = 15;

//    [self.child1 setValue:@"George" forKey:@"namee"];
//    [self.child1 setValue:[NSNumber numberWithInt:15] forKey:@"age"];
//    NSLog(@"%@, %@", [self.child1 valueForKey:@"name"], [self.child1 valueForKey:@"age"]);
//    self.child2 = [[children alloc] init];
//    
//    [self.child2 setValue:@"Mary" forKey:@"name"];
//    [self.child2 setValue:[NSNumber numberWithInteger:35] forKey:@"age"];
//    self.child2.child = [[children alloc]init];
//    [self.child2 setValue:@"andrew" forKeyPath:@"child.name"];
//    NSLog(@"%@",self.child2.child.name);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.child1 = [[children alloc]init];
    self.child2 = [[children alloc]init];

    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    [self.child1 setValue:@"Michael" forKey:@"name"];
    [self.child1 setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    [self.child2 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.child2 setValue:[NSNumber numberWithInteger:45] forKey:@"age"];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"name of the child has changed %@",change);
    }
    
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"age of the child has changed %@",change);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
