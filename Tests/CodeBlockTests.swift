//
//  CodeBlockTests.swift
//  CanvasNative
//
//  Created by Sam Soffes on 3/11/16.
//  Copyright © 2016 Canvas Labs, Inc. All rights reserved.
//

import XCTest
import CanvasNative

class CodeBlockTestes: XCTestCase {
	func testLanguage() {
		let node1 = CodeBlock(string: "⧙code⧘puts hi", range: NSRange(location: 0, length: 13), enclosingRange: NSRange(location: 0, length: 13))!
		XCTAssertEqual(NSRange(location: 0, length: 6), node1.nativePrefixRange)
		XCTAssertEqual(NSRange(location: 6, length: 7), node1.visibleRange)

		let node2 = CodeBlock(string: "⧙code-swift⧘print(\"hi\")", range: NSRange(location: 0, length: 23), enclosingRange: NSRange(location: 0, length: 23))!
		XCTAssertEqual(NSRange(location: 0, length: 12), node2.nativePrefixRange)
		XCTAssertEqual(NSRange(location: 12, length: 11), node2.visibleRange)
	}

	func testOffset() {
		var node = CodeBlock(string: "⧙code⧘puts hi", range: NSRange(location: 0, length: 13), enclosingRange: NSRange(location: 0, length: 13))!
		XCTAssertEqual(NSRange(location: 0, length: 6), node.nativePrefixRange)
		XCTAssertEqual(NSRange(location: 6, length: 7), node.visibleRange)

		node.offset(8)
		XCTAssertEqual(NSRange(location: 8, length: 6), node.nativePrefixRange)
		XCTAssertEqual(NSRange(location: 14, length: 7), node.visibleRange)
	}

	func testNativeRepresentation() {
		XCTAssertEqual("⧙code⧘", CodeBlock.nativeRepresentation())
		XCTAssertEqual("⧙code-swift⧘", CodeBlock.nativeRepresentation(language: "swift"))
	}
}