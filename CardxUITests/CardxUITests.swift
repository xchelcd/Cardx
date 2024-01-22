//
//  CardxUITests.swift
//  CardxUITests
//
//  Created by Xchel Carranza on 08/10/23.
//

import XCTest

final class CardxUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMainViewHasFourButtons() throws {
        app.launch()
        let buttons = app.buttons
        
        XCTAssertEqual(buttons.count, 4)
    }
    
    func testGoToSettingsScreen() throws {
        app.launch()
        
        let settingsScreen = app.otherElements["view_settings"]
        let settingsButton = app.buttons["Settings"]
        
        settingsButton.tap()
        
        XCTAssert(settingsScreen.waitForExistence(timeout: 5)) // Did settings screen launch?
        XCTAssertEqual(app.buttons.count, 6) // Has the required buttons?
    }
    
    func testGoToAddScreen() throws {
        app.launch()
        
        let addScreen = app.otherElements["view_add"]
        let addButton = app.buttons["Add"]
        
        addButton.tap()
        
        XCTAssert(addScreen.waitForExistence(timeout: 5))
    }
    
    func testGoBackFromAnyView() throws {
        app.launch()
        
        let mainScreen = app.otherElements["view_menu"]
        
        let testScreen = app.otherElements["view_test"]
        let testButton = app.buttons["Test"]
        
        let homeScreenBackButton = app.navigationBars["Test"].buttons["Back"] /// "Test" it the title of the navigationBar - "Back" is the name by default of back button in navController
        
        testButton.tap()
        XCTAssert(testScreen.waitForExistence(timeout: 5))
        
        homeScreenBackButton.tap()
        XCTAssert(mainScreen.waitForExistence(timeout: 5))
    }
    
    /*
    func testAddNewLanguage() throws {
        app.launch()
        
        let settingsButton = app.buttons["Settings"]
        
        let newLanguageButton = app.staticTexts["Add New Language"]
        let languageTextField = app.alerts["Add New Language"].scrollViews.otherElements.textFields["Language"]
        
        settingsButton.tap()
        
        // Open language dialog
        let language = "English"
        newLanguageButton.tap()
        XCTAssert(languageTextField.exists)

        let cancelLanguageDialogButton = app.alerts["Add New Language"].scrollViews.otherElements.buttons["Cancel"]
        let addLanguageDialogButton = app.alerts["Add New Language"].scrollViews.otherElements.buttons["Add"]
        
        languageTextField.tap()
        languageTextField.typeText(language)
        addLanguageDialogButton.tap()
        
//        let messageLanguageLabel = app.staticTexts["Language added: \(language)"]
//        XCTAssert(messageLanguageLabel.exists)
        
        XCTAssertFalse(cancelLanguageDialogButton.exists)
        XCTAssertFalse(addLanguageDialogButton.exists)
    }
    
    func testAddNewCategory() throws {
        app.launch()
        
        let settingsScreen = app.otherElements["view_settings"]
        let settingsButton = app.buttons["Settings"]
        
        let newCategoryButton = app.staticTexts["Add New Category"]
        let categoryTextField = app.alerts["Add New Category"].scrollViews.otherElements.textFields["Category"]
        
        settingsButton.tap()
    
        // Open Category dialog
        let category = "Phrasal Verb"
        newCategoryButton.tap()
        XCTAssert(categoryTextField.exists)

        let cancelCategoryDialogButton = app.alerts["Add New Category"].scrollViews.otherElements.buttons["Cancel"]
        let addCategoryDialogButton = app.alerts["Add New Category"].scrollViews.otherElements.buttons["Add"]
        
        categoryTextField.tap()
        categoryTextField.typeText(category)
        addCategoryDialogButton.tap()
        
        XCTAssertFalse(cancelCategoryDialogButton.exists)
        XCTAssertFalse(addCategoryDialogButton.exists)
        
        //let messageCategoryLabel = app.staticTexts["Category added: \(category)"]
        //XCTAssert(messageCategoryLabel.exists)
    }
    
    func testAddButtonGoesToAddScreen() throws {
        app.launch()
        
        let mainScreen = app.otherElements["view_menu"]
        let settingsScreen = app.otherElements["view_settings"]
        let defaultCardsScreen = app.otherElements["view_deault_cards"]
        
        XCTAssert(mainScreen.waitForExistence(timeout: 5)) // Test if it launch the home menu screen
        
        let settingsButton = app.buttons["Settings"]
        
        let defaultCardsButton = app.buttons["View Default Cards"]
        
        let defaultScreenBackButton = app.navigationBars["Default cards"].buttons["Settings"]
        let homeScreenBackButton = app.navigationBars["Settings"].buttons["Back"]
        
        let newLanguageButton = app.staticTexts["Add New Language"]
        let languageTextField = app.alerts["Add New Language"].scrollViews.otherElements.textFields["Language"]
        
        let newCategoryButton = app.staticTexts["Add New Category"]
        let categoryTextField = app.alerts["Add New Category"].scrollViews.otherElements.textFields["Category"]
        
        
        settingsButton.tap()
        
        XCTAssert(settingsScreen.waitForExistence(timeout: 5)) // Did settings screen launch?
        XCTAssertEqual(app.buttons.count, 6) // Has the required buttons?
        
        // Go to default cards view
        defaultCardsButton.tap()
        XCTAssert(defaultCardsScreen.waitForExistence(timeout: 5))
        
        // Return to Settings screen
        defaultScreenBackButton.tap()
        XCTAssert(settingsScreen.waitForExistence(timeout: 5))
        
        // Open language dialog
        let language = "English"
        newLanguageButton.tap()
        XCTAssert(languageTextField.exists)

        let cancelLanguageDialogButton = app.alerts["Add New Language"].scrollViews.otherElements.buttons["Cancel"]
        let addLanguageDialogButton = app.alerts["Add New Language"].scrollViews.otherElements.buttons["Add"]
        
        languageTextField.tap()
        languageTextField.typeText(language)
        addLanguageDialogButton.tap()
        
        let messageLanguageLabel = app.staticTexts["Language added: \(language)"]
//        XCTAssert(messageLanguageLabel.exists)
        XCTAssertFalse(cancelLanguageDialogButton.exists)
        
        // Open Category dialog
        let category = "Phrasal Verb"
        newCategoryButton.tap()
        XCTAssert(categoryTextField.exists)

        let cancelCategoryDialogButton = app.alerts["Add New Category"].scrollViews.otherElements.buttons["Cancel"]
        let addCategoryDialogButton = app.alerts["Add New Category"].scrollViews.otherElements.buttons["Add"]
        
        categoryTextField.tap()
        categoryTextField.typeText(category)
        addCategoryDialogButton.tap()
        
        let messageCategoryLabel = app.staticTexts["Category added: \(category)"]
//        XCTAssert(messageCategoryLabel.exists)
        XCTAssertFalse(cancelCategoryDialogButton.exists)
        
        // Return to home menu
        homeScreenBackButton.tap()
        XCTAssert(mainScreen.waitForExistence(timeout: 5))
        
    }
    */

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
