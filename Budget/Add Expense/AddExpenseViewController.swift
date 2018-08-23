//
//  AddExpenseViewController.swift
//  Budget
//
//  Created by Marijn Schilling on 23/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//


import UIKit

class AddExpenseViewController: UIViewController {
    public var addExpenseView: AddExpenseView! {
        guard isViewLoaded else { return nil }
        return view as? AddExpenseView
    }

    override func viewDidLoad() {
        addExpenseView.amountTextField.becomeFirstResponder()
    }
}
