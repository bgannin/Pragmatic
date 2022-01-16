//
//  Created by Brian Ganninger on 4/1/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

class CustomWarningCommand: NSObject, XCSourceEditorCommand {
	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) {
		insertEditableLine(invocation: invocation, contents: "#pragma GCC warning \"\"", editPosition: 21)
		completionHandler(nil)
	}
}
