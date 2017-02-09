//
//  Created by Brian Ganninger on 2/4/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

class SectionHeaderCommand: NSObject, XCSourceEditorCommand
{
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void
	{
		if (invocation.buffer.selections.count > 0 && invocation.buffer.lines.count > 0)
		{
			let selection: XCSourceTextRange = invocation.buffer.selections.firstObject as! XCSourceTextRange
			let index = selection.start.line
			let headerString = "#pragma mark -  -"
			let updatedSelection = XCSourceTextRange.init(start: XCSourceTextPosition.init(line: index, column: 15),
			                                              end: XCSourceTextPosition.init(line: index, column: 15))
			
			invocation.buffer.lines.insert(headerString, at: index)
			invocation.buffer.selections.removeAllObjects()
			invocation.buffer.selections.add(updatedSelection)
		}
		
		completionHandler(nil)
    }
}
