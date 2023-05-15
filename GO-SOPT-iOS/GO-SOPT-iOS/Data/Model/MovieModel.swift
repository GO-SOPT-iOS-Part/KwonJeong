//
//  movieModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/03.
//

import UIKit

struct MovieModel {
    let image: UIImage
}

extension MovieModel {
    
    static func moviedummyData() -> [MovieModel] {
        return [
            MovieModel(image: Image.movieImg1),
            MovieModel(image: Image.movieImg2),
            MovieModel(image: Image.movieImg3),
            MovieModel(image: Image.movieImg4),
            MovieModel(image: Image.movieImg5),
            MovieModel(image: Image.movieImg6),
            MovieModel(image: Image.movieImg7),
            MovieModel(image: Image.movieImg8)
        ]
    }
}
