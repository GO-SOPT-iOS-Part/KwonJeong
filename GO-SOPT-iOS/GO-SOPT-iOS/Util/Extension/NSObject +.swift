//
//  NSObject +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import Foundation

extension NSObject {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
