//
//  WelcomeViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/12.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let tvingImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let mainButton = CheckButton()
    
    // MARK: - Properties
    
    var userName: String?
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension WelcomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = Color.tvingBlack
        
        tvingImageView.do {
            $0.image = Image.tvingLogo
        }
        
        userNameLabel.do {
            $0.text = "반가워요!"
            $0.font = UIFont.pretendard(.bold, size: 23)
            $0.textColor = Color.tvingWhite
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
        
        mainButton.do {
            $0.setTitle("메인으로", for: .normal)
            $0.setState(.allow)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(tvingImageView, userNameLabel, mainButton)
        
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(210)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(tvingImageView.snp.bottom).offset(67)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(66)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind() {
        userNameLabel.text = "\(userName ?? "") 님\n반가워요!"
    }
    
    // MARK: - @objc Methods
}
