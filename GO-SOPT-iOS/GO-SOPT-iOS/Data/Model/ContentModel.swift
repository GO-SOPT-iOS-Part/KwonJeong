//
//  TvingContentModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/05.
//

import UIKit

struct ContentModel {
    let image: UIImage
    let title: String
}

extension ContentModel {
    
    static func contentdummyData() -> [ContentModel] {
        return [
            ContentModel(image: Image.movieImg8, title: "냠냠"),
            ContentModel(image: Image.movieImg7, title: "죄송합니다"),
            ContentModel(image: Image.movieImg6, title: "시간"),
            ContentModel(image: Image.movieImg5, title: "부족"),
            ContentModel(image: Image.movieImg4, title: "미리할걸")
        ]
    }
}
