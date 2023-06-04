//
//  Firebase_RealmUITests.swift
//  Firebase-RealmUITests
//
//  Created by Mac on 17/05/2023.
//

import XCTest

final class Firebase_RealmUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
   
    func testExample() throws {
        let app = XCUIApplication()
                        app.launch()
        
        let loginLabel = app.staticTexts["Login"]
        XCTAssertTrue(loginLabel.exists)
        
      let username =  app.textFields["Enter username"]
        XCTAssertTrue(username.exists)
        username.tap()
        username.typeText("Chi")
        
       let button = app.buttons["Log in"]
        XCTAssertTrue(button.exists)
        button.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
