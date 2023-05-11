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
    private let viewAllButton = UIButton()
    
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
        }
        
        viewAllButton.do {
            $0.setTitle("전체보기 >", for: .normal)
            $0.setTitleColor(Color.tvingGray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.medium, size: 11)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(headerLabel, viewAllButton)
        
        headerLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        viewAllButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(11)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(20)
        }
    }
    
    // MARK: - Methods
    
    func setSectionTitle(text: String) {
        headerLabel.text = text
    }
}
