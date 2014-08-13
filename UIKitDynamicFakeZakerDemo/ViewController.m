//
//  ViewController.m
//  UIKitDynamicFakeZakerDemo
//
//  Created by pigpigdaddy on 14-8-13.
//  Copyright (c) 2014年 pigpigdaddy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollisionBehaviorDelegate>

@property (nonatomic, strong)UIDynamicAnimator *animator;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
//    aView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:aView];
//    
//    UIDynamicAnimator* animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[aView]];
//    [animator addBehavior:gravityBeahvior];
//    
//    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[aView]];
//    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//    [animator addBehavior:collisionBehavior];
//    collisionBehavior.collisionDelegate = self;
//    
//    self.animator = animator;
    
    [self initFakeZakerView];
}

- (void)initFakeZakerView
{
    UIView *zakerFaceView = [[UIView alloc] initWithFrame:CGRectMake(0, -self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
    zakerFaceView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:zakerFaceView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[zakerFaceView]];
    gravityBeahvior.magnitude = 6.0;
    [self.animator addBehavior:gravityBeahvior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[zakerFaceView]];
    [collisionBehavior addBoundaryWithIdentifier:@"collisionBoundary" fromPoint:CGPointMake(0, self.view.bounds.size.height+1) toPoint:CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height+1)];
    collisionBehavior.collisionDelegate = self;
    [self.animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[zakerFaceView]];
    itemBehaviour.elasticity = 0.4;
    [self.animator addBehavior:itemBehaviour];
}

@end
