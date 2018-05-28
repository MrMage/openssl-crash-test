import XCTest

import openssl_crash_testTests

var tests = [XCTestCaseEntry]()
tests += openssl_crash_testTests.allTests()
XCTMain(tests)