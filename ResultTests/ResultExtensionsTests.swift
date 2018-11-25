@testable import Result
import XCTest

final class ResultExtensionsTests: XCTestCase {
    private enum MockError: Error {
        case mock
    }

    func testIsSuccess() {
        let result = Result.success(0)
        XCTAssertTrue(result.isSuccess)
    }

    func testIsFailure() {
        let result = Result<Int>.failure(MockError.mock)
        XCTAssertTrue(result.isFailure)
    }

    func testValue() {
        let value = "aValue"
        let result = Result.success(value)
        XCTAssertEqual(result.value, value)
    }

    func testError() {
        let error = MockError.mock
        let result = Result<Int>.failure(error)
        XCTAssertEqual(result.error as? MockError, error)
    }
}
