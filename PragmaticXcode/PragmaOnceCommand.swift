//
//  Created by Brian Ganninger on 2/25/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

class PragmaOnceCommand: NSObject, XCSourceEditorCommand
{
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void
	{
		if (invocation.buffer.selections.count > 0 && invocation.buffer.lines.count > 0)
		{
			let selection: XCSourceTextRange = invocation.buffer.selections.firstObject as! XCSourceTextRange
			var index = selection.start.line
			let entryLine = invocation.buffer.lines[index - 1] as! NSString
			let exitLine = invocation.buffer.lines[index] as! NSString
			var needsEntryNewline = (entryLine.rangeOfCharacter(from: CharacterSet.alphanumerics).location != NSNotFound)
			var needsExitNewline = (exitLine.rangeOfCharacter(from: CharacterSet.alphanumerics).location != NSNotFound)
			
			if (!needsEntryNewline)
			{
				needsEntryNewline = (entryLine.range(of: "/").location != NSNotFound)
			}
			
			if (!needsExitNewline)
			{
				needsExitNewline = (exitLine.range(of: "/").location != NSNotFound)
			}

			invocation.buffer.selections.removeAllObjects()
			
			if (needsEntryNewline)
			{
				invocation.buffer.lines.insert("\n", at: index)
				index += 1
			}
			
			let headerString = "#pragma once"
			invocation.buffer.lines.insert(headerString, at: index)
			index += 1
			
			if (needsExitNewline)
			{
				invocation.buffer.lines.insert("\n", at: index)
				index += 1
			}
			
			let updatedSelection = XCSourceTextRange.init(start: XCSourceTextPosition.init(line: index, column: 0),
			                                              end: XCSourceTextPosition.init(line: index, column: 0))
			invocation.buffer.selections.add(updatedSelection)
		}
		
		completionHandler(nil)
    }
}
