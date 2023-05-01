//
//  HomeViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let myPageButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
    
        myPageButton.do {
            $0.setImage(Image.profileImage, for: .normal)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubview(myPageButton)
        
        myPageButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(11)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(9)
            $0.width.height.equalTo(31)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        myPageButton.addTarget(self, action: #selector(myPageButtonDidTapped), for: .touchUpInside)
    }
    
    private func pushToMyPage() {
        navigationController?.pushViewController(MyPageViewController(), animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func myPageButtonDidTapped() {
        pushToMyPage()
    }
}
