import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(openssl_crash_testTests.allTests),
    ]
}
#endif