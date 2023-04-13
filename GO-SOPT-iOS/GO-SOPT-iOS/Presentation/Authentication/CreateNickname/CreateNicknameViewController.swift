//
//  CreateNicknameViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/12.
//

import UIKit

import SnapKit
import Then

protocol DataBindProtocol: AnyObject {
    func dataBind(nickname: String)
}

final class CreateNicknameViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let enterNicknameLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let saveButton = CheckButton()
    
    // MARK: - Properties
    
    weak var delegate: DataBindProtocol?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
    }
}

extension CreateNicknameViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.tvingWhite
        
        enterNicknameLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.font = UIFont.pretendard(.medium, size: 23)
            $0.textColor = Color.tvingBlack
        }
        
        nicknameTextField.do {
            $0.backgroundColor = Color.tvingGray2
            $0.font = UIFont.pretendard(.semibold, size: 14)
            $0.layer.cornerRadius = 3
            $0.setLeftPaddingPoints(24)
        }
        
        saveButton.do {
            $0.setTitle("저장하기", for: .normal)
            $0.setState(.notAllow)
            $0.layer.cornerRadius = 12
            $0.layer.borderWidth = 0
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(enterNicknameLabel, nicknameTextField, saveButton)
        
        enterNicknameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(enterNicknameLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        nicknameTextField.delegate = self
    }
    
    private func setAddTarget() {
        saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
    
    private func backToSignInVC() {
        self.dismiss(animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func saveButtonDidTap() {
        if let nickname = nicknameTextField.text {
            delegate?.dataBind(nickname: nickname)
        }
        backToSignInVC()
    }
}

extension CreateNicknameViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let nicknameText = nicknameTextField.text,
           !nicknameText.isEmpty {
            saveButton.setState(.allow)
        } else {
            saveButton.setState(.notAllow)
        }
        return true
    }
}
