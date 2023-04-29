//
//  BuyTicketView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class BuyTicketView: UIView {
    
    // MARK: - UI Components
    
    private let buyTicketLabel = UILabel()
    private let subscriptionAttach = NSTextAttachment()
    private lazy var buyTicketButton = UIButton()
    
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

extension BuyTicketView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.tvingGray5
        
        subscriptionAttach.do {
            $0.image = Image.logoImg
        }
        
        buyTicketLabel.do {
            let firstString = NSMutableAttributedString(string: "이용권을 구매하고  ")
            let logoImg = NSAttributedString(attachment: subscriptionAttach)
            let secondString = NSAttributedString(string: " 등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!")
            $0.labelWithImg(composition: firstString, logoImg, secondString, spacing: 7)
            $0.textColor = Color.tvingGray2
            $0.font = UIFont.pretendard(.semibold, size: 12)
            $0.numberOfLines = 2
        }
        
        buyTicketButton.do {
            $0.setImage(Image.RightArrow, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(buyTicketLabel, buyTicketButton)
        
        buyTicketLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(18)
            $0.height.equalTo(38)
        }
        
        buyTicketButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(13)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(18)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
