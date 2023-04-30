//
//  LogoutButtonView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class LogoutButtonView: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let logoutButton = UIButton()
    
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

extension LogoutButtonView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        
        logoutButton.do {
            $0.setTitle("로그아웃", for: .normal)
            $0.backgroundColor = Color.tvingBlack
            $0.titleLabel?.font = UIFont.pretendard(.medium, size: 14)
            $0.titleLabel?.textColor = Color.tvingGray2
            $0.layer.cornerRadius = 4
            $0.layer.borderColor = Color.tvingGray4.cgColor
            $0.layer.borderWidth = 1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(logoutButton)
        
        logoutButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(55)
        }
    }
}
