//
//  PageCollectionViewCell.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/02.
//

import UIKit

import SnapKit
import Then



final class PageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    let pageLabel = UILabel()
    var underlineView = UIView()
    
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

extension PageCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        pageLabel.do {
            $0.textColor = Color.tvingWhite
            $0.font = UIFont.pretendard(.regular, size: 17)
        }
        
        underlineView.do {
            $0.backgroundColor = Color.tvingWhite
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(pageLabel, underlineView)
        
        pageLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(3)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: PageNameModel) {
        pageLabel.text = model.list
    }
    
    func setUnderLineWidth(size: Int) {
        underlineView.snp.makeConstraints {
            $0.width.equalTo(size)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            underlineView.isHidden = !isSelected
        }
    }
}
