//
//  UIResponder+Extension.swift
//  tip-calculator
//
//  Created by Timothy Adamcik on 5/17/23.
//

import Foundation
import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
