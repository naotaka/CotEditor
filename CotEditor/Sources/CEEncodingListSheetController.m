/*
 ==============================================================================
 CEEncodingListSheetController
 
 CotEditor
 http://coteditor.github.io
 
 Created on 2014-03-26 by 1024jp
 encoding="UTF-8"
 ------------------------------------------------------------------------------
 
 © 2014 CotEditor Project
 
 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free Software
 Foundation; either version 2 of the License, or (at your option) any later
 version.
 
 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License along with
 this program; if not, write to the Free Software Foundation, Inc., 59 Temple
 Place - Suite 330, Boston, MA  02111-1307, USA.
 
 ==============================================================================
 */

#import "CEEncodingListSheetController.h"
#import "CEPrefEncodingDataSource.h"
#import "CEAppDelegate.h"


@interface CEEncodingListSheetController ()

@property (nonatomic, weak) IBOutlet CEPrefEncodingDataSource *dataSource;

@end



#pragma mark -

@implementation CEEncodingListSheetController

#pragma mark NSWindowController Methods

// ------------------------------------------------------
/// 初期化
- (instancetype)init
// ------------------------------------------------------
{
    return [super initWithWindowNibName:@"EncodingListSheet"];
}


// ------------------------------------------------------
/// ウインドウをロードした直後
- (void)windowDidLoad
// ------------------------------------------------------
{
    [super windowDidLoad];
    
    [[self dataSource] setupEncodingsToEdit];
}



#pragma mark Action Messages

// ------------------------------------------------------
/// OK ボタンが押された
- (IBAction)save:(id)sender
// ------------------------------------------------------
{
    [[self dataSource] writeEncodingsToUserDefaults]; // エンコーディングを保存
    [(CEAppDelegate *)[NSApp delegate] buildEncodingMenuItems];
    
    [NSApp stopModal];
    [NSApp endSheet:[self window] returnCode:NSOKButton];
    [self close];
}


// ------------------------------------------------------
/// Cancel ボタンが押された
- (IBAction)cancel:(id)sender
// ------------------------------------------------------
{
    [NSApp stopModal];
    [NSApp endSheet:[self window] returnCode:NSCancelButton];
    [self close];
}

@end
