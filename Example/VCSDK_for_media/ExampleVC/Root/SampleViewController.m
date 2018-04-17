//
//  SampleViewController.m
//  ADLink
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/12/19.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import "SampleViewController.h"

static NSString *kCellIdentifier = @"MyCellIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerClassNameKey = @"viewControllerClassName";

@interface SampleViewController()

@property (nonatomic, strong) NSArray *menuList;

@end

@implementation SampleViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"VCSDK_for_media Sample";
    
    self.menuList = @[@{kTitleKey: NSLocalizedString(@"LinkSwitch", @"LinkSwitch"),
                        kViewControllerClassNameKey: @"LSLinkSwitchViewController"},
                      @{kTitleKey: NSLocalizedString(@"UITextView_LinkSwitch", @"UITextView_LinkSwitch"),
                        kViewControllerClassNameKey: @"LSUITextViewController"},
                      @{kTitleKey: NSLocalizedString(@"UIWebView_LinkSwitch ", @"UIWebView_LinkSwitch "),
                        kViewControllerClassNameKey: @"LSUIWebViewController"},
                      @{kTitleKey: NSLocalizedString(@"WKWebView_LinkSwitch", @"WKWebView_LinkSwitch"),
                        kViewControllerClassNameKey: @"LSWKWebViewController"},
                      ];
    
    // create a custom navigation bar button and set it to always say "Back"
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // this UIViewController is about to re-appear, make sure we remove the current selection in our table view
    NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - Table view data source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menuList count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = (self.menuList)[indexPath.row][kTitleKey];
    
    return cell;
}

#pragma mark - Table view delegate

- (UIViewController *)viewControllerWithDict:(NSDictionary*)dict
{
    NSString *controllerClassName = dict[kViewControllerClassNameKey];
    Class controllerClass = NSClassFromString(controllerClassName);
    UIViewController *viewController = nil;
    
    viewController = [[controllerClass alloc] initWithNibName:controllerClassName bundle:nil];
    
    if (!viewController.title) {
        viewController.title = dict[kTitleKey];
    }
    
    return viewController;
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *targetViewControllerDict = (self.menuList)[indexPath.row];
    
    UIViewController *viewController = [self viewControllerWithDict:targetViewControllerDict];
    
    [[self navigationController] pushViewController:viewController animated:YES];
}

@end


