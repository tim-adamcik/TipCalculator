//
//  CalculatorScreen.swift
//  tip-calculatorUITests
//
//  Created by Timothy Adamcik on 8/23/23.
//

import XCTest

class CalculatorScreen {
    private let app: XCUIApplication
    
    var totalAmountPerPersonValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalAmountPerPersonValueLabel.rawValue]
    }
    
    var totalBillValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalBillValueLabel.rawValue]
    }
    
    var totalTipValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalTipValueLabel.rawValue]
    }
    
    init(app: XCUIApplication) {
        self.app = app
    }
    

    
}
