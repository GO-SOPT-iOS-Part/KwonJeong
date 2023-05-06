//
//  UILabel +.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/29.
//

import UIKit

extension UILabel {
    
    // string과 이미지합쳐주고 줄 간격 주는 익스텐션
    func labelWithImg(composition: NSAttributedString..., spacing: CGFloat) {
            let attributedString = NSMutableAttributedString()
            for i in composition {
            attributedString.append(i)
            }
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle,
                                      value: style,
                                      range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
    
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length))
        attributedText = attributeString
    }
}
