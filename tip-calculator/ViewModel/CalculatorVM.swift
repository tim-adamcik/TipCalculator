//
//  CalculatorVM.swift
//  tip-calculator
//
//  Created by Timothy Adamcik on 5/15/23.
//

import Foundation
import Combine

class CalculatorVM {
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    let result = Result(amountPerPerson: 500, totalBill: 1000, totalTip: 50.0)
    
    func transform(input: Input) -> Output {
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
    
    
}
