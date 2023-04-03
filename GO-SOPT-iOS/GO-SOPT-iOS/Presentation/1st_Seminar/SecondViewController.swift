//
//  SecondViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/03.
//

import UIKit

import SnapKit
import Then

final class SecondViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let nameLabel = UILabel()
    private lazy var backButton = UIButton()
    
    // MARK: - Properties
    
    public var name: String?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension SecondViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        nameLabel.do {
            $0.font = .boldSystemFont(ofSize: 22)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        backButton.do {
            $0.setTitle("뒤로가기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemGray2
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            $0.layer.cornerRadius = 5
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(nameLabel, backButton)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(140)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    func setDataBind() {
        guard let name = self.name else { return }
        if name == "" {
            nameLabel.text = "제 이름 모르겠죵?"
        }
        else {
            nameLabel.text = "제 이름은요! \(name)입니다!"
        }
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
