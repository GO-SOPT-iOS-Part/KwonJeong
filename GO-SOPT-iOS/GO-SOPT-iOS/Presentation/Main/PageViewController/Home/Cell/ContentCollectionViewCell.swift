//
//  TvingContentCollectionViewCell.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/05.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class ContentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components Property
    
    private let movieImage = UIImageView()
    private let movieTitle = UILabel()
    
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

extension ContentCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        movieImage.do {
            $0.contentMode = .scaleToFill
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
        
        movieTitle.do {
            $0.font = UIFont.pretendard(.medium, size: 10)
            $0.textColor = Color.tvingGray2
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(movieImage, movieTitle)
        
        movieImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(146)
        }
        
        movieTitle.snp.makeConstraints {
            $0.top.equalTo(movieImage.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().inset(3)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: ContentModel) {
        guard let url = URL(string: model.image) else { return }
        movieImage.kf.setImage(with: url)
        movieTitle.text = model.title
    }
}
