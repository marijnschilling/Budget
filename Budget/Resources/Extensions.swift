//
//  Extensions.swift
//  Budget
//
//  Created by Marijn Schilling on 22/08/2018.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

extension UIView {
    /// Creates a shadow on the current view.
    /// NOTE: Shadows don't show up if you're clipping to bounds, so an assertion failure will occur if `clipsToBounds` is true.
    ///
    /// - Parameters:
    ///   - xOffset: The amount to offset the shadow horizontally
    ///   - yOffset: The amount to offset the shadow vertically
    ///   - radius: The blur radius of the shadow
    ///   - opacity: The opacity of the shadow color. Defaults to 0.5.
    ///   - color: The shadow color. Defaults to black.
    func addShadow(xOffset: CGFloat,
                   yOffset: CGFloat,
                   radius: CGFloat,
                   opacity: Float = 0.5,
                   color: UIColor = UIColor.black) {
        guard clipsToBounds == false else {
            assertionFailure("A shadow won't show up if you're clipping to bounds")
            return
        }

        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
    }
}
