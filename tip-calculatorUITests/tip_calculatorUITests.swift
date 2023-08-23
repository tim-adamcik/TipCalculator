//
//  tip_calculatorUITests.swift
//  tip-calculatorUITests
//
//  Created by Timothy Adamcik on 4/24/23.
//

import XCTest

final class tip_calculatorUITests: XCTestCase {

    private var app: XCUIApplication!
    private var screen: CalculatorScreen {
        CalculatorScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        app = .init()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testResultViewDefaultValues() {
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$0")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$0")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
    }
    
    func testRegularTipFlow() {
        // User enters $100 bill
        screen.enterBill(amount: 100)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$100")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$100")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
        
        // User selects 10% tip
        screen.selectTip(tip: .tenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$110")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$110")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$10")

        // User selects 15% tip
        screen.selectTip(tip: .fifteenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$115")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$115")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$15")


        // User selects 20% tip
        screen.selectTip(tip: .twentyPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$120")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")

        // User selects custom tip

        // User splits bill by 4
        screen.selectIncrementButton(numberOfTaps: 3)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$30")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")

        // User splits bill by 2
        screen.selectDecrementButton(numberOfTaps: 2)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$60")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")
    }
    
    
}
