//
//  ArticleListViewController.m
//  HorizontalTables
//
//  Created by Felipe Laso on 8/6/11.
//  Copyright 2011 Felipe Laso. All rights reserved.
//

#import "ArticleListViewController.h"
#import "HorizontalTableCell.h"
#import "ControlVariables.h"

#define kHeadlineSectionHeight  20
#define kRegularSectionHeight   20

@implementation ArticleListViewController

@synthesize articleDictionary = _articleDictionary;
@synthesize reusableCells = _reusableCells;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.articleDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Articles" ofType:@"plist"]];

    
    if (!self.reusableCells)
    {
        NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(localizedCompare:)];
        NSArray* sortedCategories = [self.articleDictionary.allKeys sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        
        NSString *categoryName;
        NSArray *currentCategory;
        
        self.reusableCells = [NSMutableArray array];
        
        for (int i = 0; i < [self.articleDictionary.allKeys count]; i++)
        {
            HorizontalTableCell *cell = [[HorizontalTableCell alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
            
            categoryName = [sortedCategories objectAtIndex:i];
            currentCategory = [self.articleDictionary objectForKey:categoryName];
            cell.articles = [NSArray arrayWithArray:currentCategory];
            
            [self.reusableCells addObject:cell];
        }
    }
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.articleDictionary.allKeys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? kHeadlineSectionHeight : kRegularSectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *customSectionHeaderView;
    UILabel *titleLabel;
    UIFont *labelFont;
    
    
    customSectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, kRegularSectionHeight)] ;
        
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, kRegularSectionHeight)];
        
    labelFont = [UIFont boldSystemFontOfSize:13];
    
    customSectionHeaderView.backgroundColor = [UIColor colorWithRed:0 green:0.40784314 blue:0.21568627 alpha:0.95];
    
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    titleLabel.font = labelFont;
    
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(localizedCompare:)];
    NSArray* sortedCategories = [self.articleDictionary.allKeys sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    NSString *categoryName = [sortedCategories objectAtIndex:section];
    
    titleLabel.text = [categoryName substringFromIndex:1];
    
    [customSectionHeaderView addSubview:titleLabel];
    
    return customSectionHeaderView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HorizontalTableCell *cell = [self.reusableCells objectAtIndex:indexPath.section];

    cell.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    return cell;
}

#pragma mark - Memory Management

- (void)awakeFromNib
{
    [self.tableView setBackgroundColor:kVerticalTableBackgroundColor];
    self.tableView.rowHeight = kCellHeight + (kRowVerticalPadding * 0.5) + ((kRowVerticalPadding * 0.5) * 0.5);
}

@end