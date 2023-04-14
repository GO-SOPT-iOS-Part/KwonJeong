//
//  String +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/15.
//

import UIKit

extension String {
    
    func isOnlyKorean() -> Bool {
           let pattern = "[가-힣]"
           guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
           return true
    }
}
