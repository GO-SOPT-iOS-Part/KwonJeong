//
//  LiveModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/12.
//

import UIKit

struct LiveModel {
    let image: UIImage
    let number: String
    let channel: String
    let title: String
    let viewRating: String
}

extension LiveModel {
    
    static func livedummyData() -> [LiveModel] {
        return [
            LiveModel(image: Image.live1, number: "1", channel: "Mnet", title: "권지우의 투썸카공 1화", viewRating: "54.1%"),
            LiveModel(image: Image.live2, number: "2", channel: "Tooniverse", title: "포켓몬스터 37화", viewRating: "42.9%"),
            LiveModel(image: Image.live1, number: "3", channel: "SBS", title: "[속보] 권정 배고픔", viewRating: "18.2%")
        ]
    }
}
