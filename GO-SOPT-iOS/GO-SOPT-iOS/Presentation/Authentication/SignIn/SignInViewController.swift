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
    private let passwordButtonView = UIView()
    private let passwordClearButton = UIButton()
    private let passwordSecurityButton = UIButton()
    private let loginButton = CheckButton()
    private let findIdButton = UIButton()
    private let centerView = UIView()
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
            $0.font = UIFont.pretendard(.medium, size: 23)
            $0.textColor = Color.tvingWhite
            $0.textAlignment = .center
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
            $0.setPlaceholderColor(Color.tvingGray2)
            $0.backgroundColor = Color.tvingGray4
            $0.font = UIFont.pretendard(.semibold, size: 15)
            $0.textColor = Color.tvingGray2
            $0.layer.cornerRadius = 3
            $0.setLeftPaddingPoints(23)
        }

        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.setPlaceholderColor(Color.tvingGray2)
            $0.backgroundColor = Color.tvingGray4
            $0.font = UIFont.pretendard(.semibold, size: 15)
            $0.textColor = Color.tvingGray2
            $0.layer.cornerRadius = 3
            $0.isSecureTextEntry = true
//            $0.clearButtonMode = .never
            $0.rightView = passwordButtonView
            $0.rightViewMode = .always
            $0.setLeftPaddingPoints(23)
        }

        passwordClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
            $0.addTarget(self, action: #selector(passwordClearButtonDidTap), for: .touchUpInside)
        }

        passwordSecurityButton.do {
            $0.setImage(Image.passwordIcon, for: .normal)
            $0.addTarget(self, action: #selector(passwordSecurityButtonDidTap), for: .touchUpInside)
        }

        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setState(.notAllow)
        }

        findIdButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
            $0.setTitleColor(Color.tvingGray2, for: .normal)
            $0.backgroundColor = Color.tvingBlack
        }

        centerView.do {
            $0.backgroundColor = Color.tvingGray4
        }

        findPasswordButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
            $0.setTitleColor(Color.tvingGray2, for: .normal)
            $0.backgroundColor = Color.tvingBlack
        }

        accountVerificationLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.font = UIFont.pretendard(.semibold, size: 14)
            $0.textColor = Color.tvingGray3
            $0.backgroundColor = Color.tvingBlack
            $0.textAlignment = .center
        }

        createNicknameButton.do {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.setTitleColor(Color.tvingGray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.regular, size: 14)
            $0.backgroundColor = Color.tvingBlack
            $0.setUnderline()
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        passwordButtonView.addSubviews(passwordClearButton, passwordSecurityButton)
        view.addSubviews(loginLabel, idTextField, passwordTextField,
                         loginButton, findIdButton, centerView, findPasswordButton,
                         accountVerificationLabel, createNicknameButton, passwordButtonView)

        loginLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(46)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }

        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(27)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(52)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(11)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(52)
        }
        
        passwordButtonView.snp.makeConstraints {
            $0.width.equalTo(76)
            $0.height.equalTo(20)
        }
        
        passwordClearButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        passwordSecurityButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(52)
        }

        centerView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }

        findIdButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalTo(centerView).inset(33)
            $0.height.equalTo(22)
        }

        findPasswordButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalTo(centerView).offset(36)
            $0.height.equalTo(22)
        }

        accountVerificationLabel.snp.makeConstraints {
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.trailing.equalTo(centerView)
            $0.height.equalTo(22)
        }

        createNicknameButton.snp.makeConstraints {
            $0.top.equalTo(findPasswordButton.snp.bottom).offset(28)
            $0.leading.equalTo(accountVerificationLabel.snp.trailing).offset(17)
            $0.width.equalTo(128)
            $0.height.equalTo(22)
        }
    }
    
    // MARK: - Methods
    
    func clearButtonClick() {
        print("clearButton")
    }
    
    func securityButtonClick() {
        print("securityButton")
    }
    
    // MARK: - @objc Methods
    
    @objc
    func passwordClearButtonDidTap() {
        clearButtonClick()
    }
    
    @objc
    func passwordSecurityButtonDidTap() {
        securityButtonClick()
    }
}
