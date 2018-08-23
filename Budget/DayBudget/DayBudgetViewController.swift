//
//  ViewController.swift
//  Budget
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

class DayBudgetViewController: UIViewController {
    public var dayBudgetView: DayBudgetView! {
        guard isViewLoaded else { return nil }
        return view as? DayBudgetView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        loadBudget()
    }

    private func loadBudget() {
        let dayBudget = DayBudget(budget: 20, date: Date())

        dayBudgetView.dayBudgetLabel.text = "\(dayBudget.budget)"
        dayBudgetView.balanceLabel.text = "\(dayBudget.balance)"
        title = dayBudget.dateFormat.string(from: dayBudget.date)
    }
}

