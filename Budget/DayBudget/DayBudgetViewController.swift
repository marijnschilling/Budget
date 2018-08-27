//
//  ViewController.swift
//  Budget
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

class DayBudgetViewController: UIViewController {
    let dayBudgetManager = DayBudgetManager(persistentManager: UserDefaultsManager())

    public var dayBudgetView: DayBudgetView! {
        guard isViewLoaded else { return nil }
        return view as? DayBudgetView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        updateBudget()
    }

    private func updateBudget() {
        dayBudgetView.dayBudgetLabel.text = "\(dayBudgetManager.budget)"
        dayBudgetView.balanceLabel.text = "\(dayBudgetManager.balance)"
        title = dayBudgetManager.dateString
    }

    public override func prepare(for segue: UIStoryboardSegue,
                                    sender: Any?) {
        guard let viewController = segue.destination
            as? AddExpenseViewController else { return }
        viewController.delegate = self
    }
}

extension DayBudgetViewController: AddExpenseViewControllerDelegate {
    func addExpenseViewControllerDidCancel(_ viewController: AddExpenseViewController) {

    }

    func addExpenseViewController(_ viewController: AddExpenseViewController, didAddExpense expense: Int) {
        dayBudgetManager.add(expense: expense)
        updateBudget()
    }
}

