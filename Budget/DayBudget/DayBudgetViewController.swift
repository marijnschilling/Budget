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

    var dayBudgetView: DayBudgetView! {
        return viewIfLoaded as? DayBudgetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateBudget()
    }

    private func updateBudget() {
        dayBudgetView.dayBudgetLabel.text = "\(dayBudgetManager.budget)"
        dayBudgetView.balanceLabel.text = "\(dayBudgetManager.balance)"
        title = dayBudgetManager.dateString
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? AddExpenseViewController else { return }
        viewController.delegate = self
    }
}

extension DayBudgetViewController: AddExpenseViewControllerDelegate {
    func addExpenseViewControllerDidCancel(_ viewController: AddExpenseViewController) {
        //TODO: Implement cancel action
    }

    func addExpenseViewController(_ viewController: AddExpenseViewController, didAddExpense expense: Expense) {
        dayBudgetManager.add(expense: expense)
        updateBudget()
    }
}

