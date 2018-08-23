//
//  AddExpenseViewController.swift
//  Budget
//
//  Created by Marijn Schilling on 23/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//


import UIKit

protocol AddExpenseViewControllerDelegate: class {
    func addExpenseViewControllerDidCancel(_ viewController: AddExpenseViewController)
    func addExpenseViewController(_ viewController: AddExpenseViewController, didAddExpense expense: Int)
}

class AddExpenseViewController: UIViewController {
    public weak var delegate: AddExpenseViewControllerDelegate?
    var amount = 0
    
    public var addExpenseView: AddExpenseView! {
        guard isViewLoaded else { return nil }
        return view as? AddExpenseView
    }

    override func viewDidLoad() {
        addExpenseView.amountTextField.becomeFirstResponder()
    }
    
    @IBAction func didTapAddButton() {
        delegate?.addExpenseViewController(self, didAddExpense: amount)
        dismiss(animated: true)
    }
}

extension AddExpenseViewController: UITextFieldDelegate {
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
