//
//  String +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/15.
//

import UIKit

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isOnlyKorean() -> Bool {
           let pattern = "[가-힣]"
           guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
           return true
    }
    
    func size(OfFont font: UIFont) -> CGSize {
        let size = (self as NSString).size(withAttributes: [.font: font])
        let buffer = 0.2 
        return CGSize(width: size.width + buffer, height: size.height)
    }
}
