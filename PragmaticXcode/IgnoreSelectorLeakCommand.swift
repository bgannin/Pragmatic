//
//  Created by Brian Ganninger on 2/4/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import XcodeKit

class IgnoreSelectorLeakCommand: NSObject, XCSourceEditorCommand {
	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) {
		insertIgnore(invocation: invocation,
					 comment: "// TODO: temporarily ignoring performSelector leaks; revisit ASAP!",
					 suppressedWarning: "-Warc-performSelector-leaks")

		completionHandler(nil)
	}
}
