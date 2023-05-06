//
//  TvingContentModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/05.
//

import UIKit

struct TvingContentModel {
    let image: UIImage
    let title: String
}

extension TvingContentModel {
    
    static func tvingContentdummyData() -> [TvingContentModel] {
        return [
            TvingContentModel(image: Image.movieImg8, title: "냠냠"),
            TvingContentModel(image: Image.movieImg7, title: "죄송합니다"),
            TvingContentModel(image: Image.movieImg6, title: "시간"),
            TvingContentModel(image: Image.movieImg5, title: "부족"),
            TvingContentModel(image: Image.movieImg4, title: "미리할걸")
        ]
    }
}
