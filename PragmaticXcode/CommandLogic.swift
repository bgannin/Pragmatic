//
//  Created by Brian Ganninger on 2/5/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

func insertIgnore(invocation: XCSourceEditorCommandInvocation, comment: String, suppressedWarning: String)
{
	if (invocation.buffer.selections.count > 0 && invocation.buffer.lines.count > 0)
	{
		let selection: XCSourceTextRange = invocation.buffer.selections.firstObject as! XCSourceTextRange
		let index = selection.start.line
		let end = selection.end.line
		
		// TODO: handle Swift vs Obj-C conventions!
		
		invocation.buffer.lines.insert(comment, at: index)
		invocation.buffer.lines.insert("#pragma GCC diagnostic push", at: index + 1)
		invocation.buffer.lines.insert("#pragma GCC diagnostic ignored \"" + suppressedWarning + "\"", at: index + 2)
		invocation.buffer.lines.insert("#pragma GCC diagnostic pop", at: end + 3)
		
		let updatedSelection = XCSourceTextRange.init(start: XCSourceTextPosition.init(line: index + 3, column: 0),
		                                              end: XCSourceTextPosition.init(line: index + 3, column: 0))
		invocation.buffer.selections.removeAllObjects()
		invocation.buffer.selections.add(updatedSelection)
	}
}

func insertEditableLine(invocation: XCSourceEditorCommandInvocation, contents: String, editPosition: Int)
{
	if (invocation.buffer.selections.count > 0 && invocation.buffer.lines.count > 0)
	{
		let selection: XCSourceTextRange = invocation.buffer.selections.firstObject as! XCSourceTextRange
		let index = selection.start.line
		let updatedSelection = XCSourceTextRange.init(start: XCSourceTextPosition.init(line: index, column: editPosition),
		                                              end: XCSourceTextPosition.init(line: index, column: editPosition))
		
		invocation.buffer.lines.insert(contents, at: index)
		invocation.buffer.selections.removeAllObjects()
		invocation.buffer.selections.add(updatedSelection)
	}
}
