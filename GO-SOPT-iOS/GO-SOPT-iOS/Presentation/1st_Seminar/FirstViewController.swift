//
//  FirstViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/03.
//

import UIKit

import SnapKit
import Then

class FirstViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let nameTextFieldView = UIView()
    private lazy var presentButton = UIButton()
    private lazy var pushButton = UIButton()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension FirstViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        nameLabel.do {
            $0.text = "이름이 무엇인가요?"
            $0.font = .systemFont(ofSize: 24, weight: .medium)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        nameTextField.do {
            $0.placeholder = "이름을 입력해주세요"
            $0.font = .systemFont(ofSize: 17, weight: .medium)
            $0.textColor = .systemGray2
            $0.clearButtonMode = .whileEditing
        }
        
        nameTextFieldView.do {
            $0.backgroundColor = .systemGray2
        }
        
        presentButton.do {
            $0.setTitle("present", for: .normal)
            $0.backgroundColor = .systemGray2
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 5
        }
        
        pushButton.do {
            $0.setTitle("push", for: .normal)
            $0.backgroundColor = .systemGray2
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 5
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(nameLabel, nameTextField, nameTextFieldView,
                         presentButton, pushButton)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(48)
        }
        
        nameTextFieldView.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom)
            $0.leading.trailing.equalTo(nameTextField)
            $0.height.equalTo(2)
        }
        
        presentButton.snp.makeConstraints {
            $0.top.equalTo(nameTextFieldView.snp.bottom).offset(50)
            $0.leading.trailing.equalTo(nameTextField)
            $0.height.equalTo(44)
        }
        
        pushButton.snp.makeConstraints {
            $0.top.equalTo(presentButton.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(presentButton)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
    }
    
    private func presentToSecondVC() {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .formSheet
        secondVC.name = nameTextField.text
        secondVC.setDataBind()
        self.present(secondVC, animated: true, completion: nil)
    }
    
    private func pushToSecondVC() {
        let secondVC = SecondViewController()
        secondVC.name = nameTextField.text
        secondVC.setDataBind()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func presentButtonTapped() {
        presentToSecondVC()
    }
    
    @objc
    private func pushButtonTapped() {
        pushToSecondVC()
    }
}
