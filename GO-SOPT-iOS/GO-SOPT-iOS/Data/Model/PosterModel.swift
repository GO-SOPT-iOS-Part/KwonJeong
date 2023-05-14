//
//  movieModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/03.
//

import UIKit

struct PosterModel {
    let image: UIImage
}

extension PosterModel {
    
    static func posterdummyData() -> [PosterModel] {
        return [
            PosterModel(image: Image.movieImg1),
            PosterModel(image: Image.movieImg2),
            PosterModel(image: Image.movieImg3),
            PosterModel(image: Image.movieImg4),
            PosterModel(image: Image.movieImg5),
            PosterModel(image: Image.movieImg6),
            PosterModel(image: Image.movieImg7),
            PosterModel(image: Image.movieImg8)
        ]
    }
}
