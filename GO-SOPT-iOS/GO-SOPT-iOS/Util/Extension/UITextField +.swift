//
//  UITextField +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/10.
//

import UIKit

extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [
                    .foregroundColor: placeholderColor,
                    .font: font
                ].compactMapValues { $0 }
            )
        }
}
