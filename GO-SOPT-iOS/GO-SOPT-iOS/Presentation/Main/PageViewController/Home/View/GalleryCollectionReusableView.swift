//
//  GalleryCollectionReusableView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class GalleryCollectionReusableView: UITableViewHeaderFooterView {
    
    // 안쓰는뷰
    
    // MARK: - UI Components
    
    let pageControl = UIPageControl()
    private var posterModel: [PosterModel] = PosterModel.posterdummyData()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryCollectionReusableView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        pageControl.do {
            $0.numberOfPages = posterModel.count
            $0.pageIndicatorTintColor = Color.tvingGray2
            $0.currentPage = 0
            $0.currentPageIndicatorTintColor = Color.tvingWhite
            $0.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        pageControl.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
