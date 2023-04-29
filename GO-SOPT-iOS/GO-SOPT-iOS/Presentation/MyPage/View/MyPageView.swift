//
//  MyPageScrollView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class MyPageView: UIScrollView {
    
    // MARK: - UI Components
    
    private let myPageStackView = UIStackView()
    private let myProfileView = MyProfileView()
    private let myTicketView = MyTicketView()
    private let buyTicketView = BuyTicketView()
    private let testView = UIView()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setNavigationBarColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPageView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .clear
        
        myPageStackView.do {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 12
        }
        
        myTicketView.do {
            $0.layer.cornerRadius = 5
        }
        
        buyTicketView.do {
            $0.layer.cornerRadius = 5
        }
        
        testView.do {
            $0.backgroundColor = Color.tvingBlack
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        myPageStackView.addArrangedSubviews(myProfileView, myTicketView, buyTicketView)
        addSubviews(myPageStackView, testView)
        
        myPageStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(3)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(284)
        }
        
        myProfileView.snp.makeConstraints {
            $0.height.equalTo(108)
        }
        
        myTicketView.snp.makeConstraints {
            $0.height.equalTo(92)
        }
        
        buyTicketView.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        
        testView.snp.makeConstraints {
            $0.top.equalTo(myPageStackView.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(500)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBarColor() {
        
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            navigationBarAppearance.backgroundColor = .clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
//            let tabBarApperance = UITabBarAppearance()
//            tabBarApperance.configureWithOpaqueBackground()
//            tabBarApperance.backgroundColor = UIColor.blue
//            UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
//            UITabBar.appearance().standardAppearance = tabBarApperance
        }
    }
    
    // MARK: - @objc Methods
}
