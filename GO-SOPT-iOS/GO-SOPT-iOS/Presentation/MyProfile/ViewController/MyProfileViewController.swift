//
//  MyProfileViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class MyProfileViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationStackView = UIStackView()
    private let notificationButton = UIButton()
    private let settingButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setNavigationBar()
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}

extension MyProfileViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        navigationStackView.do {
            $0.addArrangedSubviews(notificationButton, settingButton)
            $0.isLayoutMarginsRelativeArrangement = true
            $0.alignment = .trailing
            $0.distribution = .equalCentering
            $0.tintColor = Color.tvingGray3
        }
        
        notificationButton.do {
            $0.setImage(Image.notification, for: .normal)
        }
        
        settingButton.do {
            $0.setImage(Image.setting, for: .normal)
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        navigationStackView.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
        
        notificationButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }

        settingButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = Color.tvingWhite
        navigationItem.leftBarButtonItem = UIBarButtonItem (
            image: Image.backButtonIcon, style: .plain, target: self, action: nil )
//        let notificationItem = UIBarButtonItem(image: Image.notificationImg, style: .plain, target: self, action: nil)
//        let settingItem = UIBarButtonItem(image: Image.settingImg, style: .plain, target: self, action: nil)
//        navigationItem.rightBarButtonItems = [settingItem, notificationItem]
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationStackView)
    }
    
    // MARK: - @objc Methods
}
