//
//  MovieCollectionViewCell.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class PosterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let movieImage = UIImageView()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init (coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension PosterCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        movieImage.do {
            $0.contentMode = .scaleToFill
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        
        contentView.addSubviews(movieImage)
        
        movieImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: PosterModel) {
        movieImage.image = model.image
    }
}
