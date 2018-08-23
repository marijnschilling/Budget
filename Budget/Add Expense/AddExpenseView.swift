//
//  AddExpenseView.swift
//  Budget
//
//  Created by Marijn Schilling on 23/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

public protocol AddExpenseViewDelegate: class {
    func addExpenseViewDidCancel(_ view: AddExpenseView)
    func addExpenseView(_ view: AddExpenseView, didAddExpense expense: Int)
}

public class AddExpenseView: UIView {
    public weak var delegate: AddExpenseViewDelegate?
    var amount = 0

    @IBOutlet public var amountTextField: UITextField!

    @IBAction func didTapAddButton() {
        print(amount)
        delegate?.addExpenseView(self, didAddExpense: amount)
    }
}

extension AddExpenseView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text, let textRange = Range(range, in: text) else {
            return true
        }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        guard let updatedAmount = Int(updatedText) else {
            return false
        }

        amount = updatedAmount

        return true
    }
}
