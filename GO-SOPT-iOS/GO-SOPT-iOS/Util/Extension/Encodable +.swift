//
//  Encodable +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/06/30.
//

import Foundation

extension Encodable {
    
    public func asParameter() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
