import XCTest

// swiftlint:disable trailing_comma

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RLayoutKitTests.allTests),
    ]
}
#endif
