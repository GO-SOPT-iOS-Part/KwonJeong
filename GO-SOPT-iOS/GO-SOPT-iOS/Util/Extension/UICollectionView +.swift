//
//  UICollectionView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        let className = type.className
        self.register(type.self, forCellWithReuseIdentifier: className)
    }

    func registerCells<T: UICollectionViewCell>(_ types: T.Type...) {
        types.forEach {
            registerCell($0)
        }
    }
    
    func dequeueCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
