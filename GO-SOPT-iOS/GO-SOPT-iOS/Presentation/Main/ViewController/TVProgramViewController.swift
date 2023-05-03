//
//  TVProgramViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/02.
//

import UIKit

import SnapKit
import Then

final class TVProgramViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = HomeScrollView()
    
    // MARK: - Properties

    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension TVProgramViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
