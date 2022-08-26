//
//  UILabelExtension.swift
//  Movies App
//
//  Created by Kaan Turan on 25.08.2022.
//

import Foundation
import UIKit
 extension UILabel {
    func addInterlineSpacing(spacingValue: CGFloat = 2) {

        guard let textString = text else { return }

        let attributedString = NSMutableAttributedString(string: textString)

        let paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineSpacing = spacingValue

        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))

        attributedText = attributedString
    }

}
