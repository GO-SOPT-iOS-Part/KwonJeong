//
//  AdvertisingModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/12.
//

import UIKit

struct AdvertisingModel {
    let image: UIImage
}

extension AdvertisingModel {
    
    static func advertisingdummyData() -> [AdvertisingModel] {
        return [
            AdvertisingModel(image: Image.advertising)
        ]
    }
}
