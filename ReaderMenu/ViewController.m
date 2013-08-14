//
//  ViewController.m
//  ReaderMenu
//
//  Created by Satheeshwaran on 8/14/13.
//  Copyright (c) 2013 Cognizant. All rights reserved.
//

#import "ViewController.h"

#import "ArticleListViewController.h"

@interface ViewController ()

@property (nonatomic,retain)NSMutableArray *newsItemsArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 44.0)];
    //headerView.contentMode = UIViewContentModeScaleToFill;
    
    // Add the label
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, -5.0, 300.0, 44)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    
    headerLabel.text = NSLocalizedString(@"SELECT_CRM", @"Select CRM");
    
    headerLabel.textColor = [UIColor grayColor];
    headerLabel.highlightedTextColor = [UIColor blackColor];
    
    headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:18];
    
    headerLabel.shadowColor = [UIColor clearColor];
    headerLabel.shadowOffset = CGSizeMake(0.0, 1.0);
    headerLabel.numberOfLines = 0;
    [headerView addSubview: headerLabel];
    
    // Return the headerView
    return headerView;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *CellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    else
    {
        for (UIView *subview in cell.contentView.subviews)
            [subview removeFromSuperview];
    }
    

}

#pragma mark Table View Delegate Methods

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
   }
- (IBAction)clickMeClicked:(id)sender {
    
    ArticleListViewController *article = [[ArticleListViewController alloc] initWithNibName:@"ArticleListViewController" bundle:nil];

    [UIView beginAnimations:@"suck" context:NULL];
    [UIView setAnimationDuration:20];
    [UIView setAnimationTransition:111 forView:self.navigationController.view cache:YES];
    [self.navigationController pushViewController:article animated:NO];
    [UIView commitAnimations];
}
@end
