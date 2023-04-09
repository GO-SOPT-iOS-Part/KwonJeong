//
//  UIFont +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/09.
//

import UIKit

extension UIFont {
    
    // MARK: - Pretendard
    
    public enum pretendardType: String {
        case semibold = "SemiBold"
        case bold = "Bold"
        case regular = "Regular"
        case medium = "Medium"
    }
    
    static func pretendard(_ type: pretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}
