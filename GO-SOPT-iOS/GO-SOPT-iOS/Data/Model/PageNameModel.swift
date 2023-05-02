//
//  PageNameModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/02.
//

import UIKit

struct PageNameModel {
    let list: String
}

extension PageNameModel {
    
    static func pageNamedummyData() -> [PageNameModel] {
        return [
            PageNameModel(list: "홈"),
            PageNameModel(list: "실시간"),
            PageNameModel(list: "TV프로그램"),
            PageNameModel(list: "영화"),
            PageNameModel(list: "파라마운트+"),
            PageNameModel(list: "키즈")
        ]
    }
}
