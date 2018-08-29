//
//  DayBudgetView.swift
//  Budget
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

public class DayBudgetView: UIView {
    @IBOutlet public var dayBudgetLabel: UILabel!
    @IBOutlet public var balanceLabel: UILabel!
    @IBOutlet public var addExpenseButtonView: UIView!

    override public func layoutSubviews() {
        super.layoutSubviews()
        
        addExpenseButtonView.layer.cornerRadius = 33

        addExpenseButtonView.addShadow(xOffset: 2, yOffset: 2, radius: 2)
    }

    @IBAction func didTapAddButton() {

    }
}
