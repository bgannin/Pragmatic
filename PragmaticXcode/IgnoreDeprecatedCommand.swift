//
//  Created by Brian Ganninger on 2/4/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import XcodeKit

class IgnoreDeprecatedCommand: NSObject, XCSourceEditorCommand {
	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) {
		insertIgnore(invocation: invocation,
					 comment: "// FIXME: temporarily ignoring deprecated API usage; revisit ASAP!",
					 suppressedWarning: "-Wdeprecated-declarations")

		completionHandler(nil)
	}
}
