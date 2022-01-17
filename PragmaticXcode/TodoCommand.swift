//
//  Created by Brian Ganninger on 1/16/22.
//  Copyright © 2022 Brian Ganninger. All rights reserved.
//

import XcodeKit

class TodoCommand: NSObject, XCSourceEditorCommand {
	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) {
		insertEditableLine(invocation: invocation, contents: "#pragma TODO: ", editPosition: 14)

		completionHandler(nil)
	}
}
