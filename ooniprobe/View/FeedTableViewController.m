#import "FeedTableViewController.h"

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"feed", nil);
    self.client = [[CDAClient alloc] initWithSpaceKey:@"brg7eld9zwg1"
        accessToken:@"d2372f3d4caa2a58ec165bcf8e0c8fec1ae2aa49ab54e8fb14ae910ed8be90c5"];
    [self.client registerClass:[Article class] forContentTypeWithIdentifier:@"6yvmL10FkAIkOaqgiuI4Oy"];

    [self.client fetchEntriesWithSuccess:^(CDAResponse *response, CDAArray *array) {
        NSArray *entries = array.items;
        for (Article *c in entries){
            //NSLog(@"%@", c.title);
        }
        //NSLog(@"%@", entries[0]);
        //NSLog(@"%@", entries[1]);
    } failure:^(CDAResponse *response, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    

    [self.client fetchSpaceWithSuccess:^(CDAResponse *response, CDASpace *space) {
        NSLog(@"space %@", space);
    }
                          failure:^(CDAResponse *response, NSError *error) {
                              NSLog(@"%@", error);
                          }];
 
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = NSLocalizedString(@"feed", nil);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", indexPath.row];
    return cell;
}

@end
