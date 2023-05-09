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
    
    func registerReusableView<T: UICollectionReusableView>(_ type: T.Type, kind: String) {
        self.register(type.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.className)
    }


//    func registerReusableViews<T: UICollectionReusableView>(_ types: T.Type...) {
//        types.forEach {
//            registerReusableView($0)
//        }
//    }

    func dequeueReusableView<T: UICollectionReusableView>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    
    
//    func registerReusableView<T: UICollectionReusableView>(_ types: [(T.Type, String)]) {
//        types.forEach {
//            register($0.0, forCellWithReuseIdentifier: $0.1)
//        }
//    }
//
//    // Dequeue a reusable cell or view from collection view
//    func dequeueReusableView<T: UICollectionViewCell>(_ type: T.Type, indexPath: IndexPath) -> T {
//        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
//    }
//
//    func dequeueReusableView<T: UICollectionReusableView>(_ type: T.Type, kind: String, indexPath: IndexPath) -> T {
//        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
//    }
}
