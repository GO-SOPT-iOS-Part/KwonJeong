//
//  SignInViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/10.
//

import UIKit

import SnapKit
import Then

final class SignInViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let loginLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let passwordClearButtion = UIButton()
    private let passwordSecurityButton = UIButton()
    private let loginButton = UIButton()
    private let findIdButton = UIButton()
    private let findPasswordButton = UIButton()
    private let accountVerificationLabel = UILabel()
    private let createNicknameButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension SignInViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.tvingBlack
        
        loginLabel.do {
            $0.text = "TVING ID 로그인"
            $0.font = .pretendard(.medium, size: 23)
            $0.textColor = Color.tvingWhite
            $0.textAlignment = .center
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
            $0.backgroundColor = Color.tvingGray4
            $0.font = .pretendard(.semibold, size: 15)
            $0.textColor = Color.tvingGray2
            $0.layer.cornerRadius = 3
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.backgroundColor = Color.tvingGray4
            $0.font = .pretendard(.semibold, size: 15)
            $0.textColor = Color.tvingGray2
            $0.layer.cornerRadius = 3
            $0.isSecureTextEntry = true
        }
        
        passwordClearButtion.do {
            $0.setImage(Image.deleteIcon, for: .normal)
        }
        
        passwordSecurityButton.do {
            $0.setImage(Image.passwordIcon, for: .normal)
        }
        
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
