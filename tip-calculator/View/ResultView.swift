//
//  ResultView.swift
//  tip-calculator
//
//  Created by Timothy Adamcik on 4/25/23.
//

import Foundation
import UIKit

class ResultView: UIView {
    
    private let headerLabel: UILabel = {
        LabelFactory.build(text: "Total p/person", font: ThemeFont.demiBold(ofSize: 18))
    }()
    
    private let amountPerPersonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        let text = NSMutableAttributedString(string: "$0", attributes: [.font: ThemeFont.bold(ofSize: 48)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    
    private let horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [

        ])
        view.axis = .vertical
        view.spacing = -4
        view.alignment = .center
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [

        ])
        view.axis = .vertical
        view.spacing = -4
        view.alignment = .center
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
        backgroundColor = .gray
    }
}
