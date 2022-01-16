//
//  Created by Brian Ganninger on 2/25/17.
//  Copyright © 2017 Brian Ganninger. All rights reserved.
//

import Foundation
import XcodeKit

class PragmaOnceCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
		// swiftlint:disable:next empty_count
		if invocation.buffer.selections.count > 0 && invocation.buffer.lines.count > 0 {
			guard let selection = invocation.buffer.selections.firstObject as? XCSourceTextRange else {
				return
			}

			var index = selection.start.line
			guard let entryLine = invocation.buffer.lines[index - 1] as? NSString,
				let exitLine = invocation.buffer.lines[index] as? NSString else {
					return
			}

			var needsEntryNewline = (entryLine.rangeOfCharacter(from: CharacterSet.alphanumerics).location != NSNotFound)
			var needsExitNewline = (exitLine.rangeOfCharacter(from: CharacterSet.alphanumerics).location != NSNotFound)

			if !needsEntryNewline {
				needsEntryNewline = (entryLine.range(of: "/").location != NSNotFound)
			}

			if !needsExitNewline {
				needsExitNewline = (exitLine.range(of: "/").location != NSNotFound)
			}

			invocation.buffer.selections.removeAllObjects()

			if needsEntryNewline {
				invocation.buffer.lines.insert("\n", at: index)
				index += 1
			}

			let headerString = "#pragma once"
			invocation.buffer.lines.insert(headerString, at: index)
			index += 1

			if needsExitNewline {
				invocation.buffer.lines.insert("\n", at: index)
				index += 1
			}

			let updatedSelection = XCSourceTextRange(start: XCSourceTextPosition(line: index, column: 0),
													 end: XCSourceTextPosition(line: index, column: 0))
			invocation.buffer.selections.add(updatedSelection)
		}

		completionHandler(nil)
    }
}
