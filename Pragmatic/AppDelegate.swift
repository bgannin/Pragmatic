//
//  Created by Brian Ganninger on 2/4/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Cocoa

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate
{
	@IBOutlet weak var window: NSWindow!
	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool
	{
		return true
	}

	func applicationDidFinishLaunching(_ aNotification: Notification)
	{
		window.titleVisibility = .hidden
	}
	
	@IBAction func openGH(_ sender: Any)
	{
		NSWorkspace.shared().open(URL.init(string: "https://github.com/bgannin/Pragmatic")!)
	}
	
	@IBAction func openWiki(_ sender: Any)
	{
		NSWorkspace.shared().open(URL.init(string: "https://github.com/bgannin/Pragmatic/wiki")!)
	}
}

