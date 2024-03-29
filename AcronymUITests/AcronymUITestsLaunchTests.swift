//
//  AcronymUITestsLaunchTests.swift
//  AcronymUITests
//
//  Created by Albert Patania on 10/04/21.
//

import XCTest

class AcronymUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Acronym"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
