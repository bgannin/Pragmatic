//
//  Created by Brian Ganninger on 2/4/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

class SectionHeaderCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) {
		insertEditableLine(invocation: invocation, contents: "#pragma mark -  -", editPosition: 15)

		completionHandler(nil)
    }
}
