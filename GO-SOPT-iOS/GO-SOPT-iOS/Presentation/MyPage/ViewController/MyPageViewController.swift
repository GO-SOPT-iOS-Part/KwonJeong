//
//  MyProfileViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class MyPageViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationStackView = UIStackView()
    private let notificationButton = UIButton()
    private let settingButton = UIButton()
    private let myPageView = MyPageView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setNavigationBar()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}

extension MyPageViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.tvingBlack
        
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
        
        view.addSubviews(myPageView)
        
        navigationStackView.snp.makeConstraints {
            $0.width.equalTo(62)
            $0.height.equalTo(23)
        }
        
        notificationButton.snp.makeConstraints {
            $0.width.height.equalTo(23)
        }

        settingButton.snp.makeConstraints {
            $0.width.height.equalTo(23)
        }
        
        myPageView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Methods
    
    private func popToHome() {
        navigationController?.popViewController(animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = Color.tvingWhite
        navigationItem.leftBarButtonItem = UIBarButtonItem (
            image: Image.backButtonIcon,
            style: .plain,
            target: self,
            action: #selector(backButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationStackView)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonTapped() {
        popToHome()
    }
}

extension MyPageViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true 
    }
}
