//
//  Created by Brian Ganninger on 2/5/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import XcodeKit

class IgnoreFormatCommand: NSObject, XCSourceEditorCommand {
	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) {
		insertIgnore(invocation: invocation,
					 comment: "// FIXME: temporarily ignoring format issues; revisit ASAP!",
					 suppressedWarning: "-Wformat")

		completionHandler(nil)
	}
}
