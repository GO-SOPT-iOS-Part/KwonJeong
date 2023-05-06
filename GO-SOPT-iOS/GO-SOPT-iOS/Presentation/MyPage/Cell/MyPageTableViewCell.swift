//
//  MyPageTableViewCell.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let listLabel = UILabel()
    private let listButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPageTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.tvingBlack
        
        listLabel.do {
            $0.font = UIFont.pretendard(.medium, size: 15)
            $0.textColor = Color.tvingGray2
        }
        
        listButton.do {
            $0.setImage(Image.RightArrow, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(listLabel, listButton)
        
        listLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        listButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(18)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: MyPageListModel) {
        listLabel.text = model.list
    }
}
