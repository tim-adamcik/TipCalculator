//
//  LogoView.swift
//  tip-calculator
//
//  Created by Timothy Adamcik on 4/25/23.
//

import Foundation
import UIKit

class LogoView: UIView {
    
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .red
    }
}
