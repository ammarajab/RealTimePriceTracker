//
//  RealTimePriceTrackerUITests.swift
//  RealTimePriceTrackerUITests
//
//  Created by Ammar on 17/11/2025.
//

import XCTest

final class RealTimePriceTrackerUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testFeedScreenHasControls() throws {
        let app = XCUIApplication()
        app.launch()

        let startButton = app.buttons["Start"]
        let stopButton = app.buttons["Stop"]
        XCTAssertTrue(startButton.waitForExistence(timeout: 2) || stopButton.waitForExistence(timeout: 2))

        let list = app.collectionViews.element(boundBy: 0)
        XCTAssertTrue(list.exists)
    }

    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
