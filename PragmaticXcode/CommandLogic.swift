//
//  Created by Brian Ganninger on 2/5/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

func insertIgnore(invocation: XCSourceEditorCommandInvocation, comment: String, suppressedWarning: String) {
	// swiftlint:disable:next empty_count
	if invocation.buffer.selections.count > 0 && invocation.buffer.lines.count > 0 {
		guard let selection = invocation.buffer.selections.firstObject as? XCSourceTextRange else {
			return
		}

		let index = selection.start.line
		let end = selection.end.line

		invocation.buffer.lines.insert(comment, at: index)
		invocation.buffer.lines.insert("#pragma GCC diagnostic push", at: index + 1)
		invocation.buffer.lines.insert("#pragma GCC diagnostic ignored \"" + suppressedWarning + "\"", at: index + 2)
		invocation.buffer.lines.insert("#pragma GCC diagnostic pop", at: end + 3)

		let updatedSelection = XCSourceTextRange(start: XCSourceTextPosition(line: index + 3, column: 0),
												 end: XCSourceTextPosition(line: index + 3, column: 0))
		invocation.buffer.selections.removeAllObjects()
		invocation.buffer.selections.add(updatedSelection)
	}
}

func insertEditableLine(invocation: XCSourceEditorCommandInvocation, contents: String, editPosition: Int) {
	// swiftlint:disable:next empty_count
	if invocation.buffer.selections.count > 0 && invocation.buffer.lines.count > 0 {
		guard let selection = invocation.buffer.selections.firstObject as? XCSourceTextRange else {
			return
		}
		let index = selection.start.line
		let updatedSelection = XCSourceTextRange(start: XCSourceTextPosition(line: index, column: editPosition),
												 end: XCSourceTextPosition(line: index, column: editPosition))

		invocation.buffer.lines.insert(contents, at: index)
		invocation.buffer.selections.removeAllObjects()
		invocation.buffer.selections.add(updatedSelection)
	}
}
