//
//  Created by Brian Ganninger on 2/5/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

class IgnoreFormatCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) {
		insertIgnore(invocation: invocation,
					 comment: "// TODO: temporarily ignoring format issues; revisit ASAP!",
					 suppressedWarning: "-Wformat")

		completionHandler(nil)
	}
}
