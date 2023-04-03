//
//  UIView +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/03.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
