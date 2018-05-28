import XCTest
@testable import openssl_crash_test

final class openssl_crash_testTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(openssl_crash_test().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
