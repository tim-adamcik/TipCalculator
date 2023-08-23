//
//  ScreenIdentifier.swift
//  tip-calculator
//
//  Created by Timothy Adamcik on 8/23/23.
//

import Foundation

enum ScreenIdentifier {
    
    enum ResultView: String {
        case totalAmountPerPersonValueLabel
        case totalBillValueLabel
        case totalTipValueLabel
    }
    
    enum BillInputView: String {
        case textField
    }
    
    enum TipInputView: String {
        case tenPercentButton
        case fifteenPercentButton
        case twentyPercentButton
        case customPercentButton
        case customTipAlertTextField
    }
    
    enum SplitInputView: String {
        case decrementButton
        case incrementButton
        case quantityValueLabel
    }
    
    enum LogoView: String {
        case logoView
    }
    
}
