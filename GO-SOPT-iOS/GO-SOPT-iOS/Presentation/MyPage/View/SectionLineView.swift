//
//  MyPageSectionView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class SectionLineView: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let sectionLineView = UIView()
    
    // MARK: - View Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SectionLineView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundView?.backgroundColor = Color.tvingBlack
        
        sectionLineView.do {
            $0.backgroundColor = Color.tvingGray4
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(sectionLineView)
        
        sectionLineView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(1)
        }
    }
}
