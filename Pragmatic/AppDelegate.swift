//
//  Created by Brian Ganninger on 2/4/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Cocoa

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {
	@IBOutlet weak var window: NSWindow!

	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		true
	}

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		window.titleVisibility = .hidden
	}

	@IBAction func openGH(_ sender: Any) {
		guard let projectURL = URL(string: "https://github.com/bgannin/Pragmatic") else {
			return
		}
		NSWorkspace.shared.open(projectURL)
	}

	@IBAction func openWiki(_ sender: Any) {
		guard let wikiURL = URL(string: "https://github.com/bgannin/Pragmatic/wiki") else {
			return
		}
		NSWorkspace.shared.open(wikiURL)
	}
}
