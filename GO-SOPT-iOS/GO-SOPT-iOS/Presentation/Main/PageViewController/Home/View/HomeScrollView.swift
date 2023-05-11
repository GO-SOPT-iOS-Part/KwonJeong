//
//  HomeScrollView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class HomeScrollView: UIScrollView {
    
    // MARK: - UI Components
    
    private lazy var movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection  = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private var movieModel: [MovieModel] = MovieModel.moviedummyData()
    private let pageControl = UIPageControl()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
        setRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeScrollView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        movieCollectionView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isPagingEnabled = true
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
        
        pageControl.do {
            $0.numberOfPages = movieModel.count
            $0.pageIndicatorTintColor = Color.tvingGray2
            $0.currentPage = 0
            $0.currentPageIndicatorTintColor = Color.tvingWhite
            $0.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(movieCollectionView, pageControl)
        
        movieCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(600)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(movieCollectionView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods

    private func setDelegate() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    private func setRegister() {
        movieCollectionView.registerCell(CollectionViewCell.self)
    }
    
    // MARK: - @objc Methods
}

extension HomeScrollView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: MovieCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: movieModel[indexPath.row])
        return cell
    }
}

extension HomeScrollView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: 600)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        pageControl.currentPage = page
    }
}
