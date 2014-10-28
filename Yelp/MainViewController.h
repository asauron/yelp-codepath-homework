//
//  MainViewController.h
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

- (void) loadSearch:(NSString *)searchTerm;

@end
