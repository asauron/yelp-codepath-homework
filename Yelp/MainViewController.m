//
//  MainViewController.m
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "YelpClient.h"
#import "ResultListViewCell.h"
#import "Business.h"
#import "BusinessCell.h"

NSString * const kYelpConsumerKey = @"vxKwwcR_NMQ7WaEiQBK_CA";
NSString * const kYelpConsumerSecret = @"33QCvh5bIF5jIHR5klQr7RtBDhQ";
NSString * const kYelpToken = @"uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV";
NSString * const kYelpTokenSecret = @"mqtKIxMIR4iBtBPZCmCLEb-Dz3Y";

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *resultsListView;

@property (retain, nonatomic) UIBarButtonItem *filterButton;
@property (retain, nonatomic) UISearchBar *searchBar;

@property (nonatomic, strong) YelpClient *client;
@property (nonatomic, retain) NSArray *businesses;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    
    if (self) {
        // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
        self.client = [[YelpClient alloc] initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
        
        [self.client searchWithTerm:@"Thai" success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"response: %@", response);
            NSArray *businessDictionaies = response[@"businesses"];
            self.businesses = [Business businessesWithDictionaries:businessDictionaies];
            [self.resultsListView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error: %@", [error description]);
        }];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"YelpSearch";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(onFilterButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.searchBar = [[UISearchBar alloc] init];
    
    
    self.searchBar.delegate = self;
    [self.searchBar showsCancelButton];
    
    self.resultsListView.dataSource = self;
    self.resultsListView.delegate = self;
    [self.resultsListView registerNib:[UINib nibWithNibName:@"BusinessCell" bundle:nil]
               forCellReuseIdentifier:@"BusinessCell"];
    self.resultsListView.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationItem.leftBarButtonItem = self.filterButton;
    self.navigationItem.titleView = self.searchBar;
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businesses.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BusinessCell"];
    cell.business = self.businesses[indexPath.row];
 
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.searchBar resignFirstResponder];
}

@end
