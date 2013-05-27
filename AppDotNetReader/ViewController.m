//
//  ViewController.m
//  AppDotNetReader
//
//  Created by Jesse Tello on 5/17/13.
//  Copyright (c) 2013 Tello. All rights reserved.
//

#import "ViewController.h"
#import "RecentPostsViewController.h"

@interface ViewController ()

{
    
    NSMutableArray* titleArray;
    NSMutableArray* authorArray;
    
    NSMutableArray* userIDArray;
    
    NSMutableArray* dataDictionary;
    
    NSMutableDictionary* userDict;
    NSMutableArray* imageArray;
    
  
}

-(void)loadAppDotNet;


@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAppDotNet];
      self.activityIndicator.hidesWhenStopped = YES;
    
}

-(void)loadAppDotNet
{
    [self.activityIndicator startAnimating];
    
    NSString* appDotNet = [NSString stringWithFormat:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    
    
    NSURL *url = [NSURL URLWithString:appDotNet];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *urlResponse, NSData *data, NSError *error) {
                               
                               NSMutableDictionary* appNetDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               
                               
                               
                               dataDictionary = [appNetDictionary objectForKey:@"data"];
                               
                               
                               
                               titleArray = [NSMutableArray array];
                               authorArray = [NSMutableArray array];
                               userIDArray = [NSMutableArray array];
                               imageArray = [NSMutableArray array];
                               
                               for (NSMutableDictionary* dict in dataDictionary) {
                                   
                                   NSString* title = [dict objectForKey:@"text"];
                                   
                                   userDict = [dict objectForKey:@"user"];
                                   
                                   
                                   NSString* name = [userDict objectForKey:@"username"];
                                   
                                   NSString* userID = [userDict objectForKey:@"id"];
                                   
                                   NSMutableDictionary* imageDictionary = [userDict objectForKey:@"avatar_image"];
                                   
                                   NSString* picURL= [imageDictionary objectForKey:@"url"];
                                   
                                   UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString:picURL]]];
                                                                    
                                   [titleArray addObject:title];
                                   [authorArray addObject:name];
                                   [userIDArray addObject:userID];
                                   [imageArray addObject:image];
                                   
                                  
                                   
                                   
                               }
                               
                               
                               [self.tableView reloadData];
                               [self.activityIndicator stopAnimating];
                               
                           }];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return titleArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
   cell.detailTextLabel.text = [authorArray objectAtIndex:indexPath.row];
    cell.imageView.image = [imageArray objectAtIndex:indexPath.row];
    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    RecentPostsViewController* rvc = [segue destinationViewController];
    NSIndexPath* path = [self.tableView indexPathForSelectedRow];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:path];
    
    NSString* username = selectedCell.detailTextLabel.text;
    
    NSInteger IDNumber = [authorArray indexOfObject:username];
    NSLog(@"%ld",(long)IDNumber);
    
    NSString* usersID = [userIDArray objectAtIndex:IDNumber];
    
    [rvc setPassedDictionary:userDict];
    [rvc setPassedID:usersID];
    

    
    
    
    
}

-(void)storeUserID
{
    
    
    
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}



- (IBAction)refreshFeed:(id)sender {
    
    [self loadAppDotNet];
 
    
}
@end
