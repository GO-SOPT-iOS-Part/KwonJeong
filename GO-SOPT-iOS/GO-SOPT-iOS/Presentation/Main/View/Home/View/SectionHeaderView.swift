//
//  SectionHeaderView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/10.
//

import UIKit

import SnapKit
import Then

final class SectionHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionHeaderView"
    
    // MARK: - UI Components
    
    private let headerLabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
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

extension SectionHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.tvingBlack
        
        headerLabel.do {
            $0.font = UIFont.pretendard(.semibold, size: 15)
            $0.textColor = Color.tvingWhite
            $0.text = "anjdi"
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(headerLabel)
        
        headerLabel.snp.makeConstraints {
            $0.height.equalTo(23)
        }
    }
    
    // MARK: - Methods
    
    func setSectionTitle(text: String) {
        headerLabel.text = text
    }
}
