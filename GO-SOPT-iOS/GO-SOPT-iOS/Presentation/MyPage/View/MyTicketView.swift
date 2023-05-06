//
//  MyTicketView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class MyTicketView: UIView {
    
    // MARK: - UI Components
    
    private let ticketIcon = UIImageView()
    private let ticketLabel = UILabel()
    private let ticketStatusLabel = UILabel()
    private let cashIcon = UIImageView()
    private let cashLabel = UILabel()
    private let cashStatusLabel = UILabel()
    
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

extension MyTicketView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.tvingGray5
        
        ticketIcon.do {
            $0.image = Image.myTicket
            $0.tintColor = Color.tvingGray3
        }
        
        ticketLabel.do {
            $0.text = "나의 이용권"
            $0.font = UIFont.pretendard(.medium, size: 13)
            $0.textColor = Color.tvingGray3
        }
        
        ticketStatusLabel.do {
            $0.text = "사용중인 이용권이 없습니다."
            $0.font = UIFont.pretendard(.medium, size: 13)
            $0.textColor = Color.tvingGray3
        }
        
        cashIcon.do {
            $0.image = Image.cash
            $0.tintColor = Color.tvingGray3
        }
        
        cashLabel.do {
            $0.text = "티빙캐시"
            $0.font = UIFont.pretendard(.medium, size: 13)
            $0.textColor = Color.tvingGray3
        }
        
        cashStatusLabel.do {
            $0.text = "0"
            $0.font = UIFont.pretendard(.bold, size: 15)
            $0.textColor = Color.tvingWhite
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(ticketIcon, ticketLabel, ticketStatusLabel,
                    cashIcon, cashLabel, cashStatusLabel)
        
        ticketIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(11)
            $0.width.height.equalTo(18)
        }
        
        ticketLabel.snp.makeConstraints {
            $0.top.equalTo(ticketIcon)
            $0.leading.equalTo(ticketIcon.snp.trailing).offset(5)
            $0.height.equalTo(18)
        }
        
        ticketStatusLabel.snp.makeConstraints {
            $0.top.equalTo(ticketIcon)
            $0.trailing.equalToSuperview().inset(13)
            $0.height.equalTo(18)
        }
        
        cashIcon.snp.makeConstraints {
            $0.top.equalTo(ticketIcon.snp.bottom).offset(17)
            $0.leading.equalTo(ticketIcon)
            $0.width.height.equalTo(18)
        }
        
        cashLabel.snp.makeConstraints {
            $0.top.equalTo(cashIcon)
            $0.leading.equalTo(cashIcon.snp.trailing).offset(5)
            $0.height.equalTo(18)
        }
        
        cashStatusLabel.snp.makeConstraints {
            $0.top.equalTo(cashIcon)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}
