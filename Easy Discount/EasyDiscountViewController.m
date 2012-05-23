//
//  EasyDiscountViewController.m
//  Easy Discount
//
//  Created by Salvador Guerrero on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EasyDiscountViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "UIColor+Extension.h"

@interface EasyDiscountViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *discountTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;
-(void)calculate;
@end

@implementation EasyDiscountViewController
@synthesize priceTextField;
@synthesize discountTextField;
@synthesize totalTextField;
//@synthesize discount = _discount;


//-(void)setDiscount:(double)discount{
//    _discount = discount;
//    discountLabel.text = [NSString stringWithFormat:@"Discount (%.2f)",_discount];
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithHexString:@"0xE50000"] CGColor], (id)[[UIColor colorWithHexString:@"0x2C0000"] CGColor], nil];
    
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    self.discountTextField.delegate = self;
    self.priceTextField.delegate = self;
}

- (void)viewDidUnload
{
    [self setPriceTextField:nil];
    [self setDiscountTextField:nil];
    [self setTotalTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
    return NO;
}

//-(double)getNumberFromString:(NSString*)number{
////    NSString *regex = @"";
//    
//    NSError *error = NULL;
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\b[0-9]+(\\.[0-9]+)?\\b"
//                                                                           options:NSRegularExpressionCaseInsensitive
//                                                                             error:&error];
//    NSTextCheckingResult *match = [regex firstMatchInString:number
//                                                    options:0
//                                                      range:NSMakeRange(0, number.length)];
//    
//    if (match) {
//        NSRange matchRange = [match range];
//        NSLog(@"Range location: %d lenght: %d",matchRange.location, matchRange.length);
//    }
//    
//    
//    
//    
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
//    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
//    
//    NSNumber *nsnumber = [numberFormatter numberFromString:number];
//    
//    NSLog(@"number: %@",nsnumber.description);
//    
//    return [numberFormatter numberFromString:number].doubleValue;
//}

- (IBAction)buttonAction:(id)sender {
    if([sender isKindOfClass:UIButton.class]){
        UIButton *button = (UIButton*)sender;
        NSString *title = button.titleLabel.text;
        double discount = discountTextField.text.doubleValue;
        if([title isEqualToString:@"+"]){
            discount++;
        } else if([title isEqualToString:@"-"]){
            discount--;
        } else {
            double predefinedPercent = [title substringToIndex:title.length-1].doubleValue;
            discount = predefinedPercent;
        }
        self.discountTextField.text = [NSString stringWithFormat:@"%.2f", discount];
        [self calculate];
    }
}

-(void)calculate{
    double price = self.priceTextField.text.doubleValue;
    double discount = self.discountTextField.text.doubleValue;
    double decimalDiscount = discount/100.0;
    double toSubstract = price * decimalDiscount;
    double total = price - toSubstract;
    self.totalTextField.text = [NSString stringWithFormat:@"%.2f",total];
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return textField.resignFirstResponder;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self calculate];
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
//    NSLog(@"Old String: %@",textField.text);
//    NSLog(@"New String: %@",string);
//    
//    return YES;
//}


@end
