//
//  tip_calculator_snapshot_test.swift
//  tip-calculatorTests
//
//  Created by Timothy Adamcik on 8/23/23.
//

import XCTest
import SnapshotTesting
@testable import tip_calculator

final class tip_calculatorSnapshotTests: XCTestCase {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func testLogoView() {
        //given
        let size = CGSize(width: screenWidth, height: 48)
        //when
        let view = LogoView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialResultView() {
        //given
        let size = CGSize(width: screenWidth, height: 224)
        //when
        let view = ResultView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialBillView() {
        //given
        let size = CGSize(width: screenWidth, height: 56)
        //when
        let view = BillInputView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialTipView() {
        //given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        //when
        let view = TipInputView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialSplitView() {
        //given
        let size = CGSize(width: screenWidth, height: 56)
        //when
        let view = SplitInputLogoView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testCustomResultView() {
        //given
        let size = CGSize(width: screenWidth, height: 224)
        let result = Result(amountPerPerson: 100.25, totalBill: 45, totalTip: 60)
        //when
        let view = ResultView()
        view.configure(result: result)
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testCustomBillView() {
        //given
        let size = CGSize(width: screenWidth, height: 56)
        //when
        let view = BillInputView()
        let textField = view.allSubViewsOf(type: UITextField.self).first
        textField?.text = "500"
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testCustomTipView() {
        //given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        //when
        let view = TipInputView()
        let button = view.allSubViewsOf(type: UIButton.self).first
        button?.sendActions(for: .touchUpInside)
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testCustomSplitView() {
        //given
        let size = CGSize(width: screenWidth, height: 56)
        //when
        let view = SplitInputLogoView()
        let button = view.allSubViewsOf(type: UIButton.self).last
        button?.sendActions(for: .touchUpInside)
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    
}

extension UIView {

    /** This is the function to get subViews of a view of a particular type
*/
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }


/** This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T */
        func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
            var all = [T]()
            func getSubview(view: UIView) {
                if let aView = view as? T{
                all.append(aView)
                }
                guard view.subviews.count>0 else { return }
                view.subviews.forEach{ getSubview(view: $0) }
            }
            getSubview(view: self)
            return all
        }
    }
