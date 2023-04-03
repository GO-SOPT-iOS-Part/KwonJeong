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
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension SecondViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        nameLabel.do {
            $0.text = "제 이름은요!"
            $0.font = .boldSystemFont(ofSize: 22)
            $0.textAlignment = .center
        }
        
        backButton.do {
            $0.setTitle("뒤로가기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemGray2
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
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
    
    // MARK: - @objc Methods
}
