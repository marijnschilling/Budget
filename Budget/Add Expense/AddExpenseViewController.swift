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
    func addExpenseViewController(_ viewController: AddExpenseViewController, didAddExpense expense: Expense)
}

class AddExpenseViewController: UIViewController {
    public weak var delegate: AddExpenseViewControllerDelegate?
    var amount = 0
    var currency = Currency.euro

    public var addExpenseView: AddExpenseView! {
        return viewIfLoaded as? AddExpenseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addExpenseView.amountTextField.becomeFirstResponder()
    }
    
    @IBAction func didTapDismiss(_ sender: UITapGestureRecognizer) {
        delegate?.addExpenseViewControllerDidCancel(self)
        addExpenseView.amountTextField.resignFirstResponder()
        dismiss(animated: true)
    }

    @IBAction func didTapAddButton() {
        let expense = Expense(amount: amount, currency: currency)

        expense.amountInEuro() { euro in
            self.delegate?.addExpenseViewController(self, didAddExpense: Expense(amount: euro))
            self.addExpenseView.amountTextField.resignFirstResponder()
            self.dismiss(animated: true)
        }
    }

    @IBAction func didToggleCurrencySwitch(_ sender: UISwitch) {
        if sender.isOn {
            currency = .dollar
        } else {
            currency = .euro
        }
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
