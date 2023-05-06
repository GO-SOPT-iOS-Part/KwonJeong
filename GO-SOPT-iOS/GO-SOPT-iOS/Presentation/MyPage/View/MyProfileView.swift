//
//  MyProfileView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class MyProfileView: UIView {
    
    // MARK: - UI Components
    
    private let profileImageView = UIImageView()
    private let profileName = UILabel()
    private lazy var profileSwitchButton = UIButton()
    
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

extension MyProfileView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.tvingBlack
        
        profileImageView.do {
            $0.image = Image.profileImage
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
        }
        
        profileName.do {
            $0.text = "구너정"
            $0.font = UIFont.pretendard(.medium, size: 17)
            $0.textColor = Color.tvingWhite
        }
        
        profileSwitchButton.do {
            $0.setTitle("프로필 전환", for: .normal)
            $0.layer.borderColor = Color.tvingGray4.cgColor
            $0.layer.borderWidth = 1
            $0.setTitleColor(Color.tvingWhite, for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.medium, size: 10)
            $0.titleLabel?.textAlignment = .center
            $0.backgroundColor = Color.tvingBlack
            $0.layer.cornerRadius = 2
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(profileImageView, profileName, profileSwitchButton)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
            $0.width.equalTo(72)
            $0.height.equalTo(74)
        }
        
        profileName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(profileImageView.snp.trailing).offset(22)
        }
        
        profileSwitchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
    }
}
