//
//  CheckButton.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/10.
//

import UIKit

enum CheckButtonState {
    case allow
    case notAllow
}

final class CheckButton: UIButton {
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    func setUI() {
        layer.cornerRadius = 3
        titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
    }
    
    // MARK: - Methods
    
    public func setState(_ state: CheckButtonState) {
        if state == .allow {
            setTitleColor(Color.tvingWhite, for: .normal)
            backgroundColor = Color.tvingRed
            isUserInteractionEnabled = true
        } else {
            setTitleColor(Color.tvingGray2, for: .normal)
            backgroundColor = Color.tvingBlack
            layer.borderWidth = 1
            layer.borderColor = Color.tvingGray4.cgColor
            isUserInteractionEnabled = false
        }
    }
}

