//
//  LiveCollectionViewCell.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/12.
//

import UIKit

import SnapKit
import Then

final class LiveCollectonViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let liveImage = UIImageView()
    private let numberLabel = UILabel()
    private let channelLabel = UILabel()
    private let titleLabel = UILabel()
    private let viewRatingLabel = UILabel()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LiveCollectonViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.tvingBlack
        
        liveImage.do {
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
        
        numberLabel.do {
            $0.textColor = Color.tvingWhite
            $0.font = UIFont.pretendard(.bold, size: 19)
        }
        
        channelLabel.do {
            $0.textColor = Color.tvingWhite
            $0.font = UIFont.pretendard(.regular, size: 10)
        }
        
        titleLabel.do {
            $0.textColor = Color.tvingGray2
            $0.font = UIFont.pretendard(.regular, size: 10)
        }
        
        viewRatingLabel.do {
            $0.textColor = Color.tvingGray2
            $0.font = UIFont.pretendard(.regular, size: 10)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(liveImage, numberLabel, channelLabel,
                    titleLabel, viewRatingLabel)
        
        liveImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        numberLabel.snp.makeConstraints {
            $0.top.equalTo(liveImage.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(2)
            $0.height.equalTo(30)
        }
        
        channelLabel.snp.makeConstraints {
            $0.top.equalTo(liveImage.snp.bottom).offset(11)
            $0.leading.equalTo(numberLabel.snp.trailing).offset(5)
            $0.height.equalTo(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(channelLabel.snp.bottom)
            $0.leading.equalTo(channelLabel)
            $0.height.equalTo(16)
        }
        
        viewRatingLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(channelLabel)
            $0.height.equalTo(16)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: LiveModel) {
        liveImage.image = model.image
        numberLabel.text = model.number
        channelLabel.text = model.channel
        titleLabel.text = model.title
        viewRatingLabel.text = model.viewRating
    }
}
