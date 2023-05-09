//
//  LiveModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/10.
//

import UIKit

struct LiveModel {
    let image: UIImage
}

extension LiveModel {
    
    static func livedummyData() -> [LiveModel] {
        return [
            LiveModel(image: Image.live1),
            LiveModel(image: Image.live2)
        ]
    }
}
