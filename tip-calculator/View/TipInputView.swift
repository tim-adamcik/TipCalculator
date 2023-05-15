//
//  TipInputView.swift
//  tip-calculator
//
//  Created by Timothy Adamcik on 4/25/23.
//

import Foundation
import UIKit

class TipInputView: UIView {
    
    private let headerView: UIView = {
        let view = HeaderView()
        view.configure(topText: "Choose", bottomText: "your tip")
        return view
    }()
    
    private lazy var tenPercentButton: UIButton = {
        let button = buildTipButton(tip: .tenPercent)
        return button
    }()
    
    private lazy var fifteenPercentButton: UIButton = {
        let button = buildTipButton(tip: .fifteenPercent)
        return button
    }()
    
    private lazy var twentyPercentButton: UIButton = {
        let button = buildTipButton(tip: .twentyPercent)
        return button
    }()
    
    private lazy var horizontalStackView: UIStackView = {
       let view = UIStackView(arrangedSubviews: [
        tenPercentButton,
        fifteenPercentButton,
        twentyPercentButton
       ])
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 16
        return view
    }()
    
    private lazy var customTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom Tip", for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.backgroundColor = ThemeColor.primary
        button.tintColor = .white
        button.addCornerRadius(radius: 8.0)
        return button
    }()
    
    private lazy var vStackView: UIStackView = {
       let view = UIStackView(arrangedSubviews: [
        horizontalStackView,
        customTipButton
       ])
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fillEqually
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [headerView, vStackView].forEach(addSubview(_:))
        
        vStackView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
        }
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(vStackView.snp.leading).offset(-24)
            make.width.equalTo(68)
            make.centerY.equalTo(horizontalStackView.snp.centerY)
        }
        
    }
    
    private func buildTipButton(tip: Tip) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = ThemeColor.primary
        button.addCornerRadius(radius: 8.0)
        let text = NSMutableAttributedString(string: tip.stringValue, attributes: [.font: ThemeFont.bold(ofSize: 20),
                                                                                   .foregroundColor: UIColor.white])
        text.addAttributes([.font: ThemeFont.demiBold(ofSize: 14)], range: NSMakeRange(2, 1))
        button.setAttributedTitle(text, for: .normal)
        return button
    }
}
