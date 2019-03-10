import XCTest
@testable import RLayoutKit

final class RLayoutKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RLayoutKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
