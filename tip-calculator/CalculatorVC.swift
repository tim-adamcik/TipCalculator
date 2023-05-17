//
//  ViewController.swift
//  tip-calculator
//
//  Created by Timothy Adamcik on 4/24/23.
//

import UIKit
import SnapKit
import Combine

class CalculatorVC: UIViewController {

    private let logoView = LogoView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInputLogoView()
    
    private let vm = CalculatorVM()
    private var cancellables = Set<AnyCancellable>()
    
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoView,
            resultView,
            billInputView,
            tipInputView,
            splitInputView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 36
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
        bind()
    }

    private func layout() {
        view.backgroundColor = ThemeColor.bg
        view.addSubview(vStackView)
        
        vStackView.snp.makeConstraints({ make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-16)
        })
        
        logoView.snp.makeConstraints({ make in
            make.height.equalTo(48)
        })
        
        resultView.snp.makeConstraints({ make in
            make.height.equalTo(224)
        })
        
        billInputView.snp.makeConstraints({ make in
            make.height.equalTo(56)
        })
        
        tipInputView.snp.makeConstraints({ make in
            make.height.equalTo(56+56+16)
        })
        
        splitInputView.snp.makeConstraints({ make in
            make.height.equalTo(56)
        })
    }
    
    private func bind() {
        
        let input = CalculatorVM.Input(billPublisher: billInputView.valuePublisher,
                                       tipPublisher: tipInputView.valuePublisher,
                                       splitPublisher: splitInputView.valuePublisher)
        let output = vm.transform(input: input)
        
        output.updateViewPublisher.sink { result in
            print(result)
        }.store(in: &cancellables)
    }
}

