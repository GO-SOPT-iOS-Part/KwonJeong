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
    
    enum TextFieldType {
        case id
        case password
        case none
    }
    
    // MARK: - UI Components
    
    private let loginLabel = UILabel()
    private let idTextField = UITextField()
    private let idClearButton = UIButton()
    private let idButtonView = UIView()
    private let passwordTextField = UITextField()
    private let passwordButtonView = UIView()
    private let textFiedClearButton = UIButton()
    private let textFieldSecurityButton = UIButton()
    private let loginButton = CheckButton()
    private let findIdButton = UIButton()
    private let centerView = UIView()
    private let findPasswordButton = UIButton()
    private let accountVerificationLabel = UILabel()
    private let createNicknameButton = UIButton()
    
    // MARK: - Properties
    
    var activeTextField: TextFieldType?
    let maxLength = 15
    var nickname: String = ""
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.idTextField.text?.removeAll()
        self.passwordTextField.text = ""
        self.nickname = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
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
            $0.clearButtonMode = .never
            $0.rightView = idButtonView
            $0.setLeftPaddingPoints(23)
        }
        
        idClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
        }

        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.setPlaceholderColor(Color.tvingGray2)
            $0.backgroundColor = Color.tvingGray4
            $0.font = UIFont.pretendard(.semibold, size: 15)
            $0.textColor = Color.tvingGray2
            $0.layer.cornerRadius = 3
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .never
            $0.rightView = passwordButtonView
            $0.setLeftPaddingPoints(23)
        }

        textFiedClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
        }

        textFieldSecurityButton.do {
            $0.setImage(Image.passwordIcon, for: .normal)
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
        
        idButtonView.addSubviews(idClearButton)
        passwordButtonView.addSubviews(textFiedClearButton, textFieldSecurityButton)
        view.addSubviews(loginLabel, idTextField, passwordTextField, loginButton,
                         findIdButton, centerView, findPasswordButton, accountVerificationLabel,
                         createNicknameButton, idButtonView, passwordButtonView)

        loginLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(46)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }

        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(27)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(52)
        }
        
        idButtonView.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        idClearButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
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
        
        textFiedClearButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        textFieldSecurityButton.snp.makeConstraints {
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
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setAddTarget() {
        idClearButton.addTarget(self, action: #selector(idClearButtonDidTap), for: .touchUpInside)
        textFiedClearButton.addTarget(self, action: #selector(passwordClearButtonDidTap), for: .touchUpInside)
        textFieldSecurityButton.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        createNicknameButton.addTarget(self, action: #selector(createNicknameButtonDidTap), for: .touchUpInside)
    }
    
    private func idClearButtonClick() {
        idTextField.text?.removeAll()
        idTextField.rightViewMode = .never
    }
    
    private func passwordClearButtonClick() {
        passwordTextField.text?.removeAll()
        passwordTextField.rightViewMode = .never
        passwordTextField.isSecureTextEntry = true
    }
    
    private func securityButtonClick() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    private func checkTextField(textField: UITextField) -> TextFieldType {
        switch textField {
        case idTextField:
            return .id
        case passwordTextField:
            return .password
        default:
            return .none
        }
    }
    
    private func textFieldPlaceholder(textField: TextFieldType) -> String {
        switch textField {
        case .id:
            return "아이디"
        case .password:
            return "비밀번호"
        case .none:
            return ""
        }
    }
    
    private func textFieldBorderSetting(textField: UITextField) {
        textField.layer.borderColor = Color.tvingGray2.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = .none
    }
    
    private func textFieldButtonState(textField: UITextField, length: Int) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = length + text.count
        switch checkTextField(textField: textField) {
        case .id:
            if newLength >= 1 {
                textField.rightViewMode = .always
            } else {
                textField.rightViewMode = .never
            }
            return true
        case .password:
            if newLength >= maxLength {
                textField.rightViewMode = .always
            } else {
                textField.rightViewMode = .never
            }
            return newLength <= maxLength
        default:
            return true
        }
    }
    
    private func buttonState() {
        if let firstText = idTextField.text, let secondText = passwordTextField.text,
           !firstText.isEmpty && !secondText.isEmpty {
            loginButton.setState(.allow)
        } else {
            loginButton.setState(.notAllow)
        }
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        if nickname.isEmpty {
            welcomeVC.userName = idTextField.text
            welcomeVC.setDataBind()
        } else {
            welcomeVC.userName = nickname
            welcomeVC.setDataBind()
        }

        guard let id = idTextField.text else { return }
        if id.isValidEmail() {
            self.present(welcomeVC, animated: true, completion: nil)
        } else {
            self.showAlert(alertText: "이메일 형식이 올바르지 않습니다.", alertMessage: "다시 입력해 주세요.")
        }
    }
    
    private func presentToCreateNicknameVC() {
        let createNicknameVC = CreateNicknameViewController()
        createNicknameVC.modalPresentationStyle = .pageSheet
        createNicknameVC.delegate = self
        if let sheet = createNicknameVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 40
        }
        self.present(createNicknameVC, animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func idClearButtonDidTap() {
        idClearButtonClick()
    }
    
    @objc
    private func passwordClearButtonDidTap() {
        passwordClearButtonClick()
    }
    
    @objc
    private func securityButtonDidTap() {
        securityButtonClick()
    }
    
    @objc
    private func loginButtonDidTap() {
        presentToWelcomeVC()
    }
    
    @objc
    private func createNicknameButtonDidTap() {
        presentToCreateNicknameVC()
    }
}

// MARK: - UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textFieldBorderSetting(textField: textField)
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textFieldBorderSetting(textField: textField)
        buttonState()
        let length = string.count - range.length
        return textFieldButtonState(textField: textField, length: length)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        activeTextField = checkTextField(textField: textField)
        textField.layer.borderColor = .none
        if let activeTextField = activeTextField {
            textField.placeholder = textFieldPlaceholder(textField: activeTextField)
        }
        buttonState()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignInViewController: UISheetPresentationControllerDelegate {
    
}

extension SignInViewController: DataBindProtocol {
    
    func dataBind(nickname: String) {
        self.nickname = nickname
    }
}
