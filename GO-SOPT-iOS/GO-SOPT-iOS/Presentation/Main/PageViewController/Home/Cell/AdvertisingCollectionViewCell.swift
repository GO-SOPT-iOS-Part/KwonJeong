//
//  AdvertisingCollectionViewCell.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/12.
//

import UIKit

import SnapKit
import Then

final class AdvertisingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let advertisingImage = UIImageView()
    
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

extension AdvertisingCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    
    }
    
    private func setLayout() {
        
        contentView.addSubviews(advertisingImage)
        
        advertisingImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: AdvertisingModel) {
        advertisingImage.image = model.image
    }
}
