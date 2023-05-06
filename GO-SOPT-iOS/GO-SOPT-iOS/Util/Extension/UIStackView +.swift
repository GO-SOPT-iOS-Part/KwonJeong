//
//  UIStackView +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/27.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {  self.addArrangedSubview($0) }
    }
}
